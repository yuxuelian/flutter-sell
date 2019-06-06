import 'package:flutter/cupertino.dart';

import '../../bean/goods_bean.dart';
import '../../widget/add_foot_widget.dart';
import '../../widget/ratings_controller_widget.dart';
import '../../widget/ratings_item_widget.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;

  static Future<T> start<T extends Object>(BuildContext context, final Food food) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => FoodDetailPage(food: food),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
              child: child,
            ),
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }

  FoodDetailPage({Key key, @required this.food}) : super(key: key);

  List<Widget> _getListWidget(BuildContext context) {
    final res = <Widget>[
      Image.network(food.image, width: 360),
      // 商品名字
      Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Text(food.name, style: TextStyle(fontSize: 16, color: Color(0xFF303030))),
      ),
      // 商品的销售信息
      Padding(
        padding: EdgeInsets.only(left: 20, top: 6),
        child: Row(
          children: <Widget>[
            Text('月售${food.sellCount}份', style: TextStyle(fontSize: 14, color: Color(0xFF93999F))),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text('好评率${food.rating}%', style: TextStyle(fontSize: 14, color: Color(0xFF93999F))),
          ],
        ),
      ),
      // 单价  添加购物车等
      Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('¥${food.price}', style: TextStyle(fontSize: 16, color: Color(0xFFF01414))),
            AddFoot(food: food),
          ],
        ),
      ),
      Container(
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xFFF3F5F7),
          border: Border(
            top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
            bottom: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
          ),
        ),
      ),
    ];

    // 商品简介不为空的话,显示商品简介
    if (food.info != null && food.info.isNotEmpty) {
      res.addAll(<Widget>[
        // 商品简介
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text('商品介绍', style: TextStyle(fontSize: 16, color: Color(0xFF303030))),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 6, right: 20, bottom: 10),
          child: Text(food.info, style: TextStyle(fontSize: 12, color: Color(0xFF4D555D))),
        ),
        // 分割线
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFFF3F5F7),
            border: Border(
              top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
              bottom: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
            ),
          ),
        ),
      ]);
    }

    // 商品评价
    res.addAll(<Widget>[
      Padding(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Text('商品评价', style: TextStyle(fontSize: 16, color: Color(0xFF303030))),
      ),
      RatingsController(),
    ]);

    // 商品评价信息
    for (int i = 0; i < 10; i++) {
      res.add(RatingsItem());
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(_getListWidget(context)),
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: 30,
            width: 40,
            height: 40,
            child: CupertinoButton(
              minSize: 0,
              pressedOpacity: 1,
              padding: EdgeInsets.all(0),
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/icon_back.png',
                width: 20,
                color: CupertinoColors.activeBlue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

import '../provide/shop_car_provide.dart';
import 'add_foot_widget.dart';
import 'empty_shop_car_widget.dart';

// 购物车列表

class ShopCarList extends StatelessWidget {
  static Future<T> start<T extends Object>(NavigatorState navigatorState) {
    return navigatorState.push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Color(0x6604040F),
        pageBuilder: (context, animation, secondaryAnimation) => ShopCarList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
              .animate(animation),
          child: child,
        ),
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }

  ShopCarList({Key key}) : super(key: key);

  Widget _buildTitle(BuildContext context) {
    return Container(
      height: 40,
      color: Color(0xFFF3F5F7),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('购物车', style: TextStyle(fontSize: 14, color: Color(0xFF303030))),
          CupertinoButton(
            minSize: 0,
            pressedOpacity: 1,
            padding: EdgeInsets.all(0),
            borderRadius: BorderRadius.circular(0),
            child: Text('清空', style: TextStyle(fontSize: 14)),
            onPressed: () {
              // 获取全局 ShopCarProvide 状态对象
              final ShopCarProvide shopCarProvide =
                  Provide.value<ShopCarProvide>(context);
              shopCarProvide.clear();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Provide<ShopCarProvide>(
      builder: (context, child, shopCarProvide) {
        if (shopCarProvide.shopCarFoodList.length == 0) {
          return EmptyShopCar();
        } else {
          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final food = shopCarProvide.shopCarFoodList[index];
                    return Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(food.name,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF303030))),
                          Expanded(child: Container()),
                          Text(
                            '¥${food.price * food.count}',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFF01414)),
                          ),
                          Padding(padding: EdgeInsets.only(left: 6)),
                          AddFoot(food: food),
                          Padding(padding: EdgeInsets.only(right: 14)),
                        ],
                      ),
                    );
                  },
                  childCount: shopCarProvide.shopCarFoodList.length,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 260,
        color: CupertinoColors.white,
        child: Column(
          children: <Widget>[
            _buildTitle(context),
            Expanded(
              child: _buildList(context),
            ),
          ],
        ),
      ),
    );
  }
}

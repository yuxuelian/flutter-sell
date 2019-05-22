import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import '../bean/goods_bean.dart';
import '../utils/data_utils.dart';
import '../widget/add_foot_widget.dart';

// 商品
class Goods extends StatefulWidget {
  @override
  State createState() => _GoodsState();
}

class _GoodsState extends State<Goods> {
  // 当前选择的菜单类型的index
  int _currentFoodTypeIndex = 0;

  List<GoodsBean> _goodsBeanList = [];

  ScrollController foodTypeListController;

  ScrollController foodListController;

  // 创建菜单分类列表
  Widget _buildFoodTypeList(BuildContext context) {
    return CustomScrollView(
      controller: foodTypeListController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _buildFoodTypeItem,
            childCount: _goodsBeanList.length,
          ),
        ),
      ],
    );
  }

  Widget _buildFoodTypeItem(BuildContext context, final int index) {
    return CupertinoButton(
      minSize: 50,
      pressedOpacity: 1,
      borderRadius: BorderRadius.circular(0),
      padding: EdgeInsets.only(left: 16, right: 16),
      color: _currentFoodTypeIndex == index ? Color(0xFFF8F8F8) : Color(0),
      child: Text(
        _goodsBeanList[index].name,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: _currentFoodTypeIndex == index ? Color(0xFFF01414) : Color(0xFF303030)),
      ),
      onPressed: () {
        setState(() {
          _currentFoodTypeIndex = index;
        });
        // TODO 滑动对应的标题位置
      },
    );
  }

  Widget _buildFoodList(BuildContext context) {
    List<Widget> children = [];
    for (final goods in _goodsBeanList) {
      children.add(_buildFoodTitle(context, goods.name));
      for (final food in goods.foods) {
        final foodDetailItem = _buildFoodDetailItem(context, food);
        children.add(foodDetailItem);
      }
    }
    return CustomScrollView(
      controller: foodListController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(children),
        ),
      ],
    );
  }

  Widget _buildFoodTitle(BuildContext context, final String name) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 3, color: Color(0xFFD0D0D0))),
        color: Color(0xFFE0E0E0),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(name, style: TextStyle(color: Color(0xFF93999F))),
    );
  }

  Widget _buildFoodDetailItem(BuildContext context, final Food food) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(food.icon, width: 60, height: 60),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: () {
                final res = <Widget>[];
                res.add(Text(food.name, style: TextStyle(fontSize: 16, color: Color(0xFF303030))));
                res.add(Padding(padding: EdgeInsets.only(top: 4)));
                if (food.description.isNotEmpty) {
                  res.add(Text(food.name, style: TextStyle(fontSize: 12, color: Color(0xFF93999F))));
                  res.add(Padding(padding: EdgeInsets.only(top: 4)));
                }
                res.add(Row(
                  children: <Widget>[
                    Text('月售${food.sellCount}份', style: TextStyle(fontSize: 12, color: Color(0xFF93999F))),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Text('好评率${food.rating}%', style: TextStyle(fontSize: 12, color: Color(0xFF93999F))),
                  ],
                ));
                res.add(Padding(padding: EdgeInsets.only(top: 4)));
                res.add(Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('¥${food.price}', style: TextStyle(fontSize: 16, color: Color(0xFFF01414))),
                    AddFoot(food: food),
                  ],
                ));
                return res;
              }(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    foodTypeListController = ScrollController();
    foodTypeListController.addListener(() {
      // 滑动监听
    });
    foodListController = ScrollController();
    foodListController.addListener(() {
      // 滑动监听
    });

    // 获取数据
    () async {
      final res = await DataUtils.getGoodsBeanList(context);
      setState(() {
        _goodsBeanList = res;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 左侧的食物类型列表
        Container(
          width: 80,
          color: Color(0xFFE0E0E0),
          child: _buildFoodTypeList(context),
        ),
        // 右侧的食物列表
        Expanded(
          child: Container(
            color: Color(0xFFF8F8F8),
            child: _buildFoodList(context),
          ),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(Goods oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

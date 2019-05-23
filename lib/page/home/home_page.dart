import 'package:flutter/cupertino.dart';

import 'package:flutter_sell/page/home/header.dart';
import '../../widget/custom_tab_bar_widget.dart';
import '../../widget/shop_car_widget.dart';
import '../../widget/throw_ball_anim_widget.dart';
import 'package:flutter_sell/page/home/goods.dart';
import 'package:flutter_sell/page/home/ratings.dart';
import 'package:flutter_sell/page/home/seller.dart';

final List<String> _tabValues = [
  '商品',
  '评论',
  '商家',
];

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget _buildPage(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 首先最底层展示商品信息
        Column(
          children: <Widget>[
            HomeHeader(),
            CustomTabBar(
              fontSize: 14,
              itemValues: _tabValues,
              initIndex: _currentIndex,
              color: Color(0xFF4D555D),
              selectedColor: Color(0xFFF01414),
              valueCallback: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            // 分割线
            Container(height: 0.5, color: Color(0xFFE0E0E0)),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: <Widget>[
                  Goods(),
                  Ratings(),
                  Seller(),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
          ],
        ),
        // 购物车层
        ShopCar(),
        // 抛小球动画层
        ThrowBallAnim(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: CupertinoColors.white),
        child: _buildPage(context),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_sell/page/home/goods.dart';
import 'package:flutter_sell/page/home/header.dart';
import 'package:flutter_sell/page/home/ratings.dart';
import 'package:flutter_sell/page/home/seller.dart';

import '../../widget/custom_tab_bar_widget.dart';

final List<String> _tabValues = [
  '商品',
  '评论',
  '商家',
];

class HomeContent extends StatefulWidget {
  @override
  State createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

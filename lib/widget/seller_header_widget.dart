import 'package:flutter/cupertino.dart';

import 'ratings_widget.dart';

class SellerHeader extends StatelessWidget {
  Widget _buildRow1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('粥品香坊（回龙观）',
                style: TextStyle(fontSize: 16, color: Color(0xFF303030))),
            Padding(padding: EdgeInsets.only(top: 4)),
            Row(
              children: <Widget>[
                RatingsWidget(),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('(24)',
                    style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('月售90单',
                    style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
              ],
            ),
          ],
        ),
        Container(
          child: Column(
            children: <Widget>[
              Image.asset('assets/icon_love_normal.png', width: 30),
              Text('收藏',
                  style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow2Item(
      BuildContext context, String text1, String text2, String text3) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(text1, style: TextStyle(fontSize: 12, color: Color(0xFF909090))),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(text2,
                style: TextStyle(fontSize: 24, color: Color(0xFF303030))),
            Container(
              // 这里的padding主要是为了字体底线对齐
              padding: EdgeInsets.only(bottom: 4),
              child: Text(text3,
                  style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRow2(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: _buildRow2Item(context, '起送价', '20', '元')),
        Container(
          width: 0.5,
          height: 30,
          color: Color(0xFFE0E0E0),
        ),
        Expanded(child: _buildRow2Item(context, '商家配送', '4', '元')),
        Container(
          width: 0.5,
          height: 30,
          color: Color(0xFFE0E0E0),
        ),
        Expanded(child: _buildRow2Item(context, '平均配送时间', '38', '分钟')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          _buildRow1(context),
          Container(
            height: 0.5,
            color: Color(0xFFE0E0E0),
            margin: EdgeInsets.only(top: 10, bottom: 10),
          ),
          _buildRow2(context),
        ],
      ),
    );
  }
}

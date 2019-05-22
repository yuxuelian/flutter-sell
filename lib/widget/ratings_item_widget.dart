import 'package:flutter/cupertino.dart';

import 'ratings_widget.dart';

// 评论页的列表项

class RatingsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 0.5, color: Color(0xFFE0E0E0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipOval(
            child: Image.asset('assets/default_header.png', width: 40),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('g*********0', style: TextStyle(fontSize: 14, color: Color(0xFF303030))),
                    Text('2016-07-23 10:46', style: TextStyle(fontSize: 14, color: Color(0xFF303030))),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 4)),
                Row(
                  children: <Widget>[
                    RatingsWidget(),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    Text('70', style: TextStyle(fontSize: 14, color: Color(0x60909090))),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text('送货速度蜗牛一样', style: TextStyle(fontSize: 14, color: Color(0xFF303030))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

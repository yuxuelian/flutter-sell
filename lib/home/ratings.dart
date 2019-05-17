import 'package:flutter/cupertino.dart';

import '../widget/ratings_widget.dart';

// 评论

class Ratings extends StatefulWidget {
  @override
  State createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  Widget _buildRatingsHeader(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('4.2', style: TextStyle(fontSize: 30, color: Color(0xFFFF9900))),
                Padding(padding: EdgeInsets.only(top: 4)),
                Text('综合评分', style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
                Padding(padding: EdgeInsets.only(top: 4)),
                Text('高于周边商家69.2%', style: TextStyle(fontSize: 12, color: Color(0xFF909090))),
              ],
            ),
            flex: 2,
          ),
          Container(
            width: 1,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            color: Color(0xFFE0E0E0),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text('服务态度', style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    RatingsWidget(ratingValue: 4.9),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    Text('4.1', style: TextStyle(fontSize: 12, color: Color(0xFFFF9900))),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text('商品评分', style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    RatingsWidget(ratingValue: 4.9),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    Text('4.1', style: TextStyle(fontSize: 12, color: Color(0xFFFF9900))),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text('送达时间', style: TextStyle(fontSize: 12, color: Color(0xFF303030))),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    Text('38分钟', style: TextStyle(fontSize: 12, color: Color(0xFF909090))),
                  ],
                ),
              ],
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _buildRatingsHeader(context),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../widget/ratings_header_widget.dart';
import '../widget/ratings_controller_widget.dart';
import '../widget/ratings_item_widget.dart';

// 评论

class Ratings extends StatefulWidget {
  @override
  State createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  List<String> _ratingsDataList = ["", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      RatingsHeader(),
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
      RatingsController(),
    ];

    // 加载评论列表
    children.addAll(_ratingsDataList.map((ratingsData) {
      return RatingsItem();
    }));
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(children),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

class RatingsWidget extends StatelessWidget {
  // 总数
  final int count;

  // 评分值
  final double ratingValue;

  // 大小
  final double starSize;

  // 间隔
  final double padding;

  RatingsWidget({Key key, this.count = 5, this.ratingValue = 4.5, this.starSize = 16.0, this.padding = 4})
      : assert(count >= 1),
        assert(ratingValue >= 0.0 && ratingValue <= count),
        super(key: key);

  String _computeAssets(int index) {
    final floorValue = ratingValue.floor();
    if (index < floorValue) {
      return 'assets/star36_on@2x.png';
    } else if (index == floorValue) {
      if (ratingValue < floorValue + 0.5) {
        return 'assets/star36_off@2x.png';
      } else if (ratingValue < floorValue + 1) {
        return 'assets/star36_half@2x.png';
      } else {
        return 'assets/star36_on@2x.png';
      }
    } else {
      return 'assets/star36_off@2x.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < count; i++) {
      children.add(Image.asset(_computeAssets(i), width: starSize, height: starSize));
      if (i < count - 1) {
        children.add(Padding(padding: EdgeInsets.only(left: padding)));
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

import 'package:flutter/cupertino.dart';

class SellerPicture extends StatelessWidget {
  final List<String> pictureUrlList = ['', '', '', ''];

  Widget _buildTitle(BuildContext context) {
    return Text(
      '商家实景',
      style: TextStyle(fontSize: 16, color: Color(0xFF303030)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
          bottom: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(context),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            height: 90,
            padding: EdgeInsets.only(left: 10),
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index % 2 == 0) {
                        return Image.network(
                          'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg?imageView2/1/w/180/h/180',
                          width: 120,
                          fit: BoxFit.fitWidth,
                        );
                      } else {
                        return Padding(padding: EdgeInsets.only(left: 10));
                      }
                    },
                    childCount: pictureUrlList.length * 2 - 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
    );
  }
}

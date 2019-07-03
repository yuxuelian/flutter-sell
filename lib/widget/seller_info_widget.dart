import 'package:flutter/cupertino.dart';

class SellerInfo extends StatelessWidget {
  Widget _buildTitle(BuildContext context) {
    return Text(
      '商家信息',
      style: TextStyle(fontSize: 16, color: Color(0xFF303030)),
    );
  }

  Widget _buildSellerInfoItem(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
      child:
          Text(text, style: TextStyle(fontSize: 14, color: Color(0xFF303030))),
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
          _buildSellerInfoItem(context, '该商家支持发票,请下单写好发票抬头'),
          _buildSellerInfoItem(context, '品类:其他菜系,包子粥店'),
          _buildSellerInfoItem(context, '北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340'),
          _buildSellerInfoItem(context, '营业时间:10:00-20:30'),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class SellerDetailPanel extends StatelessWidget {
  Widget _buildTitle(BuildContext context) {
    return Text(
      '公告与活动',
      style: TextStyle(fontSize: 16, color: Color(0xFF303030)),
    );
  }

  Widget _buildBulletin(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        '粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。',
        style: TextStyle(fontSize: 14, color: Color(0xFFF01414)),
        textAlign: TextAlign.justify,
      ),
    );
  }

  // 创建优惠信息
  Widget _buildDiscountsInfo(BuildContext context, String icon, String text) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 14, bottom: 14),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Color(0xFFE0E0E0),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(icon, width: 16),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(text, style: TextStyle(fontSize: 14, color: Color(0xFF303030))),
        ],
      ),
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
          _buildBulletin(context),
          _buildDiscountsInfo(context, 'assets/decrease_3@2x.png', '在线支付满28减5'),
          _buildDiscountsInfo(context, 'assets/discount_3@2x.png', 'VC无限橙果汁全场8折'),
          _buildDiscountsInfo(context, 'assets/special_3@2x.png', '单人精彩套餐'),
          _buildDiscountsInfo(context, 'assets/invoice_3@2x.png', '该商家支持发票,请下单写好发票抬头'),
          _buildDiscountsInfo(context, 'assets/guarantee_3@2x.png', '已加入“外卖保”计划,食品安全保障'),
        ],
      ),
    );
  }
}

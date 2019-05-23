import 'package:flutter/cupertino.dart';

import '../../widget/ratings_widget.dart';

class SellDetailPage extends StatelessWidget {
  /// 跳转到登录页面
  static Future<T> start<T extends Object>(BuildContext context) {
    return Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => SellDetailPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }

  // 创建标题
  Widget _buildTitle(BuildContext context) {
    return Center(
      child: Text(
        '粥品香坊（回龙观）',
        style: TextStyle(fontSize: 22),
      ),
    );
  }

  // 创建子标题
  Widget _buildSubTitle(BuildContext context, String title) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 0.5,
              color: CupertinoColors.white,
              margin: EdgeInsets.only(left: 30, right: 10),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Container(
              height: 0.5,
              color: CupertinoColors.white,
              margin: EdgeInsets.only(left: 10, right: 30),
            ),
          ),
        ],
      ),
    );
  }

  // 创建优惠信息
  Widget _buildDiscountsInfo(BuildContext context, String icon, String text) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 40)),
        Image.asset(icon, width: 16),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  // 创建商家公告
  Widget _buildSellBulletin(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Text(text, style: TextStyle(fontSize: 14)),
    );
  }

  Widget _buildPage(BuildContext context) {
    List<Widget> children = [];
    // 设置到顶部的距离
    children.add(Padding(padding: EdgeInsets.only(top: 70)));
    // 标题
    children.add(_buildTitle(context));
    children.add(Padding(padding: EdgeInsets.only(top: 20)));
    // 评分控件
    children.add(Center(
      child: RatingsWidget(
        starSize: 26,
      ),
    ));
    children.add(Padding(padding: EdgeInsets.only(top: 20)));
    children.add(_buildSubTitle(context, '优惠信息'));

    // 优惠信息列表
    children.add(Padding(padding: EdgeInsets.only(top: 20)));
    children.add(_buildDiscountsInfo(context, 'assets/decrease_2@2x.png', '在线支付满28减5'));
    children.add(Padding(padding: EdgeInsets.only(top: 10)));
    children.add(_buildDiscountsInfo(context, 'assets/discount_2@2x.png', 'VC无限橙果汁全场8折'));
    children.add(Padding(padding: EdgeInsets.only(top: 10)));
    children.add(_buildDiscountsInfo(context, 'assets/special_2@2x.png', '单人精彩套餐'));
    children.add(Padding(padding: EdgeInsets.only(top: 10)));
    children.add(_buildDiscountsInfo(context, 'assets/invoice_2@2x.png', '该商家支持发票,请下单写好发票抬头'));
    children.add(Padding(padding: EdgeInsets.only(top: 10)));
    children.add(_buildDiscountsInfo(context, 'assets/guarantee_2@2x.png', '已加入“外卖保”计划,食品安全保障'));
    children.add(Padding(padding: EdgeInsets.only(top: 20)));

    // 商家公告
    children.add(_buildSubTitle(context, '商家公告'));
    children.add(Padding(padding: EdgeInsets.only(top: 20)));
    children.add(_buildSellBulletin(context, '粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。'));

    return Column(
      children: <Widget>[
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(children),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          alignment: Alignment.center,
          child: CupertinoButton(
            minSize: 0,
            pressedOpacity: 1,
            padding: EdgeInsets.all(0),
            borderRadius: BorderRadius.circular(0),
            child: Image.asset('assets/icon_close.png', width: 36),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xC0030709),
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: CupertinoColors.white),
        child: _buildPage(context),
      ),
    );
  }
}

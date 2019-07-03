import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../detail/sell_detail_page.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key key}) : super(key: key);

  @override
  State createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  void _showSellDetail() {
    SellDetailPage.start(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Stack(
        children: <Widget>[
          // 最下层背景图片
          ConstrainedBox(
            child: Image.network(
                'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg',
                fit: BoxFit.fill),
            constraints: BoxConstraints.expand(),
          ),
          ConstrainedBox(
            child: Container(color: Color(0x60202020)),
            constraints: BoxConstraints.expand(),
          ),
          // 滤镜层(模糊背景)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 44, 16, 20),
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.network(
                                'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg',
                                width: 70),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Image.asset('assets/brand@2x.png',
                                        width: 34),
                                    Padding(padding: EdgeInsets.only(left: 6)),
                                    Text('粥品香坊（回龙观）',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: CupertinoColors.white)),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 2)),
                                Text('蜂鸟专送/38分钟送达'),
                                Padding(padding: EdgeInsets.only(top: 2)),
                                Row(
                                  children: <Widget>[
                                    Image.asset('assets/decrease_2@2x.png',
                                        width: 12),
                                    Padding(padding: EdgeInsets.only(left: 6)),
                                    Text('在线支付满28减5'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 5,
                          child: CupertinoButton(
                            minSize: 0,
                            pressedOpacity: 0.8,
                            padding: EdgeInsets.all(0),
                            borderRadius: BorderRadius.circular(0),
                            child: Container(
                              width: 56,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: Color(0x50303030),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('5个',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: CupertinoColors.white)),
                                  Padding(padding: EdgeInsets.only(left: 4)),
                                  Image.asset('assets/icon_right.png',
                                      width: 10),
                                ],
                              ),
                            ),
                            onPressed: _showSellDetail,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                  minSize: 0,
                  pressedOpacity: 0.8,
                  padding: EdgeInsets.all(0),
                  borderRadius: BorderRadius.circular(0),
                  child: Container(
                    height: 30,
                    color: Color(0x60000000),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/bulletin@2x.png', width: 24),
                        Padding(padding: EdgeInsets.only(left: 6)),
                        Expanded(
                          child: Text(
                            '粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。',
                            style: TextStyle(
                                fontSize: 12, color: CupertinoColors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 2)),
                        Image.asset('assets/icon_right.png', width: 10),
                      ],
                    ),
                  ),
                  onPressed: _showSellDetail,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../widget/seller_detail_panel_widget.dart';
import '../../widget/seller_header_widget.dart';
import '../../widget/seller_info_widget.dart';
import '../../widget/seller_pictrue_widget.dart';

// 商家Tab页

class Seller extends StatefulWidget {
  @override
  State createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              SellerHeader(),
              // 分割线
              Container(
                height: 20,
                color: Color(0xFFF3F5F7),
              ),
              SellerDetailPanel(),
              // 分割线
              Container(
                height: 20,
                color: Color(0xFFF3F5F7),
              ),
              SellerPicture(),
              // 分割线
              Container(
                height: 20,
                color: Color(0xFFF3F5F7),
              ),
              SellerInfo(),
            ],
          ),
        ),
      ],
    );
  }
}

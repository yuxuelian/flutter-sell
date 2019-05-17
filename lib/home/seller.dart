import 'package:flutter/cupertino.dart';

// 商家

class Seller extends StatefulWidget {
  @override
  State createState() => _SellerState();
}

class _SellerState extends State<Seller> {
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
              <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}

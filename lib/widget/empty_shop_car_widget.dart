import 'package:flutter/cupertino.dart';

// 购物车为空时Widget

class EmptyShopCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/empty_shop_car.png', width: 100, height: 100),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          '购物车竟然是空的',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFA7B49),
          ),
        ),
      ],
    );
  }
}

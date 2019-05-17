import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

import '../provide/shop_car_provide.dart';
import 'add_foot_widget.dart';
import 'empty_shop_car_widget.dart';

class ShopCarList extends StatelessWidget {
  ShopCarList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<ShopCarProvide>(
      child: Container(
        height: 40,
        color: Color(0xFFF3F5F7),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('购物车'),
            CupertinoButton(
              minSize: 0,
              pressedOpacity: 1,
              padding: EdgeInsets.all(0),
              borderRadius: BorderRadius.circular(0),
              child: Text('清空', style: TextStyle(fontSize: 14)),
              onPressed: () {
                // 获取全局 ShopCarProvide 状态对象
                final ShopCarProvide shopCarProvide = Provide.value<ShopCarProvide>(context);
                shopCarProvide.clear();
              },
            ),
          ],
        ),
      ),
      builder: (context, child, shopCarProvide) {
        return Container(
          height: 260,
          color: CupertinoColors.white,
          child: Column(
            children: <Widget>[
              child,
              Expanded(
                child: shopCarProvide.shopCarFoodList.length == 0
                    ? EmptyShopCar()
                    : CustomScrollView(
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final food = shopCarProvide.shopCarFoodList[index];
                                return Container(
                                  height: 40,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(left: 20)),
                                      Text(food.name),
                                      Expanded(child: Container()),
                                      Text(
                                        '¥${food.price * food.count}',
                                        style: TextStyle(fontSize: 16, color: Color(0xFFF01414)),
                                      ),
                                      Padding(padding: EdgeInsets.only(left: 6)),
                                      AddFoot(food: food),
                                      Padding(padding: EdgeInsets.only(right: 14)),
                                    ],
                                  ),
                                );
                              },
                              childCount: shopCarProvide.shopCarFoodList.length,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

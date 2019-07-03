import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

import '../../provide/index.dart';
import '../../widget/shop_car_list_widget.dart';
import '../../widget/shop_car_widget.dart';
import '../../widget/throw_ball_anim_widget.dart';
import 'home_content.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  bool _isShow = false;

  Future<void> showShopCarListCallback() async {
    _isShow = !_isShow;
    if (_isShow) {
      // 显示
      await ShopCarList.start(navigatorKey.currentState);
      // 已经关闭
      _isShow = false;
    } else {
      // 关闭
      navigatorKey.currentState.pop();
    }
  }

  Widget _buildPage(BuildContext context) {
    final ShopCarProvide shopCarProvide =
        Provide.value<ShopCarProvide>(context);
    //  传递点击事件回调
    shopCarProvide.showShopCarListCallback = showShopCarListCallback;
    return Stack(
      children: <Widget>[
        // 首先最底层展示商品信息
        Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Navigator(
            key: navigatorKey,
            onGenerateRoute: (settings) {
              print('settings.name = ${settings.name}');
              if (settings.name == '/') {
                return PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomeContent(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                  transitionDuration: Duration(milliseconds: 300),
                );
              }
              return null;
            },
          ),
        ),
        // 购物车层
        ShopCar(),
        // 抛小球动画层
        ThrowBallAnim(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12, color: CupertinoColors.white),
        child: _buildPage(context),
      ),
    );
  }
}

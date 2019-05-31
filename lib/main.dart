import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

import './page/home/home_page.dart';
import './provide/index.dart';

void main() {
  final providers = Providers();
  providers.provide(Provider.value(BallAnimProvide()));
  providers.provide(Provider.value(ShopCarProvide()));
  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  int _lastClickTime = 0;

  Future<bool> _doubleExit() {
    int nowTime = new DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return new Future.value(true);
    } else {
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      new Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      Fluttertoast.showToast(msg: '再点击一次返回键退出');
      return new Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'flutter_sell',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: WillPopScope(
        onWillPop: _doubleExit,
        child: HomePage(),
      ),
    );
  }
}

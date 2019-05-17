import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import './home/home_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_sell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
        canvasColor: Colors.transparent,
      ),
      home: CupertinoPageScaffold(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 12, color: CupertinoColors.white),
          child: HomePage(),
        ),
      ),
    );
  }
}

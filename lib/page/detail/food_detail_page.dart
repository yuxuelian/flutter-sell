import 'package:flutter/cupertino.dart';

class FoodDetailPage extends StatelessWidget {
  static Future<T> start<T extends Object>(BuildContext context) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => FoodDetailPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
              child: child,
            ),
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: CupertinoColors.white,
          child: Center(
            child: CupertinoButton(
                child: Text('关闭'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ),
        ),
      ],
    );
  }
}

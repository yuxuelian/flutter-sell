import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

import '../bean/goods_bean.dart';
import '../provide/index.dart';

const _translationInitial = Offset.zero;
const _translationTo1 = Offset(1.23, 0.0);
const _translationTo2 = Offset(2.8, 0.0);

// 添加到购物车的加减按钮

class AddFoot extends StatefulWidget {
  final Food food;

  AddFoot({Key key, @required this.food}) : super(key: key);

  @override
  State createState() => _AddFootState();
}

class _AddFootState extends State<AddFoot> with TickerProviderStateMixin {
  GlobalKey _addWidgetKey = GlobalKey();

  AnimationController _animationController;
  Animation<double> _curved;

  Animation<Offset> _minusWidget;
  Animation<Offset> _counterWidget;
  Animation<double> _curveTween;

  bool _hideMinusBtn;
  double _currentOpacity;

  void startShowAnim() {
    setState(() {
      _assignShowValue();
      _animationController.reset();
      _animationController.forward();
    });
  }

  void startHideAnim() {
    setState(() {
      _assignHideValue();
      _animationController.reset();
      _animationController.forward();
    });
  }

  // 赋值显示的时候应该执行的动画
  void _assignShowValue() {
    // 旋转动画
    _curved = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    // 平移动画
    _minusWidget = Tween(begin: _translationTo1, end: _translationInitial)
        .animate(_animationController);
    _counterWidget = Tween(begin: _translationTo2, end: _translationInitial)
        .animate(_animationController);
    // 透明度动画
    _curveTween = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          _currentOpacity = _curveTween.value;
        });
      });
  }

  // 赋值隐藏的时候应该执行的动画
  void _assignHideValue() {
    // 旋转动画
    _curved = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    // 平移动画
    _minusWidget = Tween(begin: _translationInitial, end: _translationTo1)
        .animate(_animationController);
    _counterWidget = Tween(begin: _translationInitial, end: _translationTo2)
        .animate(_animationController);
    // 透明度动画
    _curveTween = Tween(begin: 1.0, end: 0.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          _currentOpacity = _curveTween.value;
        });
      });
  }

  @override
  void initState() {
    super.initState();
    // 动画控制器
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _hideMinusBtn = widget.food.count == 0;
        });
      }
    });

    // 是否隐藏减按钮
    _hideMinusBtn = widget.food.count == 0;
    // 是否透明减按钮
    _currentOpacity = _hideMinusBtn ? 0.0 : 1.0;

    // 初始显示的位置
    if (_hideMinusBtn) {
      _assignShowValue();
    } else {
      _assignHideValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ShopCarProvide>(
      child: CupertinoButton(
        minSize: 0,
        pressedOpacity: 1,
        padding: EdgeInsets.all(6),
        child: Image.asset(
          'assets/icon_plus.png',
          key: _addWidgetKey,
          width: 20,
          height: 20,
        ),
        onPressed: () {
          // 获取全局 BallAnimProvide 状态对象
          final BallAnimProvide ballAnimProvide =
              Provide.value<BallAnimProvide>(context);
          // 获取Widget树中真正的盒子对象
          RenderBox renderBox = _addWidgetKey.currentContext.findRenderObject();
          // 小球大小保存到全局
//            ballAnimProvide.ballSize = renderBox.size;
          ballAnimProvide.ballSize = Size(16, 16);
          // 小球的在屏幕的位置保存到全局
          ballAnimProvide.ballPosition = renderBox.localToGlobal(Offset.zero);
          // 回调这个启动动画的函数
          ballAnimProvide.notifyStartAnim();
          // 获取全局 ShopCarProvide 状态对象
          final ShopCarProvide shopCarProvide =
              Provide.value<ShopCarProvide>(context);
          shopCarProvide.plusFoodCount(widget.food);
          if (widget.food.count == 1) {
            _hideMinusBtn = false;
            startShowAnim();
          }
        },
      ),
      builder: (context, child, shopCarProvide) {
//        print('name = ${widget.food.name}  count = ${widget.food.count}');
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 显示减按钮
            Offstage(
              offstage: _hideMinusBtn,
              child: SlideTransition(
                position: _minusWidget,
                child: RotationTransition(
                  turns: _curved,
                  child: Opacity(
                    opacity: _currentOpacity,
                    child: CupertinoButton(
                      minSize: 0,
                      pressedOpacity: 1,
                      padding: EdgeInsets.all(6),
                      child: Image.asset('assets/icon_minus.png',
                          width: 20, height: 20),
                      onPressed: () {
                        // 获取全局 ShopCarProvide 状态对象
                        final ShopCarProvide shopCarProvide =
                            Provide.value<ShopCarProvide>(context);
                        shopCarProvide.minusFoodCount(widget.food);
                        if (widget.food.count == 0) {
                          startHideAnim();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            // 显示总数
            Offstage(
              offstage: _hideMinusBtn,
              child: SlideTransition(
                position: _counterWidget,
                child: RotationTransition(
                  turns: _curved,
                  child: Opacity(
                    opacity: _currentOpacity,
                    child: Text(
                      widget.food.count.toString(),
                      style: TextStyle(fontSize: 12, color: Color(0xFF93999F)),
                    ),
                  ),
                ),
              ),
            ),
            // 显示 加 按钮
            child,
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

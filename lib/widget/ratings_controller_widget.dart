import 'package:flutter/cupertino.dart';

// 评论列表控制器

class RatingsController extends StatefulWidget {
  @override
  State createState() => _RatingsControllerState();
}

class _RatingsControllerState extends State<RatingsController> {
  bool _lookCheck = false;

  int _checkedId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              _RectCheckBox(
                text: '全部  24',
                onPressed: () {
                  setState(() {
                    _checkedId = 0;
                  });
                },
                id: 0,
                checkedId: _checkedId,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              _RectCheckBox(
                text: '满意  24',
                onPressed: () {
                  setState(() {
                    _checkedId = 1;
                  });
                },
                id: 1,
                checkedId: _checkedId,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              _RectCheckBox(
                text: '不满意  24',
                onPressed: () {
                  setState(() {
                    _checkedId = 2;
                  });
                },
                id: 2,
                checkedId: _checkedId,
                color: Color(0xFFDBDBDB),
                activeColor: Color(0xFF404040),
              ),
            ],
          ),
          // 分割线
          Container(
            height: 0.5,
            color: Color(0xFFE0E0E0),
            margin: EdgeInsets.only(top: 14, bottom: 14),
          ),
          CupertinoButton(
            minSize: 0,
            pressedOpacity: 1,
            padding: EdgeInsets.only(top: 4, bottom: 4),
            borderRadius: BorderRadius.circular(0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _CircleCheckBox(
                  normalChild: Image.asset('assets/icon_check_normal.png'),
                  checkedChild: Image.asset('assets/icon_checked.png'),
                  isChecked: _lookCheck,
                  size: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('只看有内容的评价',
                    style: TextStyle(fontSize: 14, color: Color(0xFF909090))),
              ],
            ),
            onPressed: () {
              setState(() {
                _lookCheck = !_lookCheck;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _RectCheckBox extends StatelessWidget {
  final int id;
  final int checkedId;

  final Color color;

  final Color activeColor;

  final double width;

  final double height;

  final VoidCallback onPressed;

  final String text;

  _RectCheckBox({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.id,
    @required this.checkedId,
    this.color = const Color(0xFFCCECF8),
    this.activeColor = const Color(0xFF00A0DC),
    this.width = 80,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      pressedOpacity: 1,
      padding: EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(7),
      color: id == checkedId ? activeColor : color,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: Text(text,
            style: TextStyle(
                fontSize: 14,
                color: id == checkedId
                    ? CupertinoColors.white
                    : Color(0xFF909090))),
      ),
      onPressed: onPressed,
    );
  }
}

class _CircleCheckBox extends StatelessWidget {
  final bool isChecked;
  final double size;
  final Widget normalChild;
  final Widget checkedChild;

  _CircleCheckBox({
    Key key,
    @required this.normalChild,
    @required this.checkedChild,
    this.isChecked = false,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: isChecked ? checkedChild : normalChild,
      ),
    );
  }
}

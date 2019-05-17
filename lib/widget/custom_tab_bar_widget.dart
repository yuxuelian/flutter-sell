import 'package:flutter/cupertino.dart';

typedef ValueCallback = void Function(int index);

class CustomTabBar extends StatefulWidget {
  final List<String> itemValues;
  final ValueCallback valueCallback;
  final Color color;
  final Color selectedColor;
  final double fontSize;
  final initIndex;

  CustomTabBar({
    @required this.itemValues,
    @required this.valueCallback,
    this.fontSize = 16,
    this.initIndex = 0,
    this.color = CupertinoColors.inactiveGray,
    this.selectedColor = CupertinoColors.activeBlue,
    Key key,
  })  : assert(itemValues.length > 0),
        super(key: key);

  @override
  State createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;

  List<Widget> _buildChildren(BuildContext context) {
    int index = 0;
    return widget.itemValues.map((value) => _buildItem(context, value, index++)).toList();
  }

  Widget _buildItem(BuildContext context, final String value, final int index) => Expanded(
        child: CupertinoButton(
          minSize: double.infinity,
          pressedOpacity: 1,
          padding: EdgeInsets.all(0),
          borderRadius: BorderRadius.circular(0),
          child: Text(value, style: TextStyle(fontSize: widget.fontSize, color: _currentIndex == index ? widget.selectedColor : widget.color)),
          onPressed: () {
            setState(() {
              _currentIndex = index;
              widget.valueCallback(_currentIndex);
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: CupertinoColors.white,
      child: Row(
        children: _buildChildren(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final double iconSize;
  final paddingReduce;
  final Color buttonColor;

  RoundedIconButton(
      {@required this.onPressed,
      @required this.iconData,
      this.iconSize = 30,
      this.buttonColor,
      this.paddingReduce = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: 0,
      elevation: 5,
      color: buttonColor != null ? buttonColor : Theme.of(context).buttonColor,
      onPressed: onPressed,
      padding: EdgeInsets.all((iconSize / 2) - paddingReduce),
      child: Icon(iconData, size: iconSize),
      shape: CircleBorder(),
    );
  }
}

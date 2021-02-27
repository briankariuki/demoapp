import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double height;
  final double minWidth;
  final Color color;
  final Color textColor;

  const MainButton({
    Key key,
    this.onTap,
    this.title,
    this.height,
    this.minWidth,
    this.color,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      height: height,
      child: FlatButton(
        splashColor: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: color,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 12.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}

class MainIconButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double height;
  final double minWidth;
  final Color color;
  final Color textColor;
  final Widget icon;

  const MainIconButton({
    Key key,
    this.onTap,
    this.title,
    this.height,
    this.minWidth,
    this.color,
    this.textColor,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      height: height,
      child: FlatButton(
        splashColor: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: color,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 12.0,
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        onPressed: onTap,
      ),
    );
  }
}

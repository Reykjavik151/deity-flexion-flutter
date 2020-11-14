import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  Line({
    this.backgroundColor = Colors.white,
    @required this.height,
    this.margin,
    this.isCompleted = true,
    this.child,
  });

  final Color backgroundColor;
  final double height;
  final bool isCompleted;
  final EdgeInsets margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: !this.isCompleted
            ? BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))
            : null,
        color: this.backgroundColor,
      ),
      child: this.child,
    );
  }
}

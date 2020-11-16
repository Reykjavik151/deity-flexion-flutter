import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  Line({
    this.backgroundColor = Colors.white,
    this.height,
    this.margin,
    this.isCompleted = true,
    this.borderRadius = 10.0,
    this.child,
  });

  final Color backgroundColor;
  final double height;
  final bool isCompleted;
  final EdgeInsets margin;
  final double borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: !this.isCompleted
            ? BorderRadius.only(
                topRight: Radius.circular(this.borderRadius),
                bottomRight: Radius.circular(this.borderRadius))
            : null,
        color: this.backgroundColor,
      ),
      child: this.child,
    );
  }
}

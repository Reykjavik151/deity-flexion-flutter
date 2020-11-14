import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  final double size;

  SectionButton({
    @required this.icon,
    @required this.onPress,
    this.size = 250.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        width: this.size,
        height: this.size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(this.size / 2)),
        ),
        child: Center(
          child: Icon(
            this.icon,
            size: this.size / 1.7,
            color: Colors.lightBlueAccent[200],
          ),
        ),
      ),
    );
  }
}

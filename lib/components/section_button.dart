import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  SectionButton({ @required this.icon, @required this.onPress });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(125.0)),
        ),
        child: Center(
          child: Icon(
            this.icon,
            size: 150.0,
            color: Colors.lightBlueAccent[200],
          ),
        ),
      ),
    );
  }
}

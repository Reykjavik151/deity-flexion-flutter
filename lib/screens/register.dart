import 'package:deity_flexion_app/components/line.dart';
import 'package:flutter/material.dart';
import 'package:deity_flexion_app/constants.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register_screen';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: FIRST_LINE_HERO_TAG,
              child: Line(
                height: 12.0,
                isCompleted: false,
                margin: EdgeInsets.only(bottom: 12.0, right: 32.0),
              ),
            ),
            Hero(
              tag: SECOND_LINE_HERO_TAG,
              child: Line(
                height: 32.0,
                margin: EdgeInsets.only(bottom: 12.0),
              ),
            ),
            Hero(
              tag: THIRD_LINE_HERO_TAG,
              child: Line(
                height: 32.0,
                isCompleted: false,
                margin: EdgeInsets.only(bottom: 12.0, right: 16.0),
              ),
            ),
            Hero(
              tag: FOURTH_LINE_HERO_TAG,
              child: Line(
                height: 12.0,
                isCompleted: false,
                margin: EdgeInsets.only(right: 64.0),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Line(
                    height: 12.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/components/section_button.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/screens/tasks.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: TASKS_HERO_TAG,
                  child: SectionButton(
                    icon: Icons.check,
                    onPress: () {
                      Navigator.pushNamed(context, TasksPage.id);
                    },
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: FIRST_LINE_HERO_TAG,
                  child: Line(
                    height: 12.0,
                    margin: EdgeInsets.only(bottom: 12.0),
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
                    margin: EdgeInsets.only(bottom: 12.0),
                  ),
                ),
                Hero(
                  tag: FOURTH_LINE_HERO_TAG,
                  child: Line(
                    height: 12.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: SectionButton(
                    icon: Icons.note,
                    onPress: () {
                      print('notes pressed');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

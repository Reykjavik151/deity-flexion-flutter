import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/components/section_button.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  static String id = 'tasks_screen';

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: TASKS_HERO_TAG,
            child: Container(
              padding: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0))),
              child: SafeArea(
                bottom: false,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Tasks',
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.lightBlueAccent[700],
                      ))
                ]),
              ),
            ),
          ),
          Expanded(
            child: ListView(),
          ),
          Hero(
            tag: FIRST_LINE_HERO_TAG,
            child: Line(
              height: 20.0,
              isCompleted: false,
              margin: EdgeInsets.only(bottom: 12.0, right: 8.0),
            ),
          ),
          Hero(
            tag: SECOND_LINE_HERO_TAG,
            child: Line(
              height: 20.0,
              isCompleted: false,
              margin: EdgeInsets.only(bottom: 12.0, right: 24.0),
            ),
          ),
          Hero(
            tag: THIRD_LINE_HERO_TAG,
            child: Line(
              height: 20.0,
              isCompleted: false,
              margin: EdgeInsets.only(bottom: 12.0, right: 40.0),
            ),
          ),
          Hero(
            tag: FOURTH_LINE_HERO_TAG,
            child: Line(
              height: 42.0,
            ),
          ),
        ],
      ),
    );
  }
}

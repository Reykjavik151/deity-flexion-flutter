import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/data/status.dart';
import 'package:deity_flexion_app/data/task.dart';
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  Task task;
  final Function onPress;
  final Function onLongPress;

  TaskView({this.task, this.onPress, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    bool isCompleted = task.status == Status.completed;
    final double rightPadding = isCompleted ? 80.0 : 16.0;

    return GestureDetector(
      onTap: () => this.onPress(this.task),
      onLongPress: () => this.onLongPress(this.task),
      child: Line(
          isCompleted: isCompleted,
          backgroundColor: isCompleted ? Colors.white70 : Colors.white,
          margin: EdgeInsets.only(right: isCompleted ? 0.0 : 64.0, top: 16.0),
          borderRadius: 30.0,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0, right: rightPadding, top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  task.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                )
              ],
            ),
          )),
    );
  }
}

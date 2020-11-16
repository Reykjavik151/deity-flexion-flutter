import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/data/status.dart';
import 'package:deity_flexion_app/data/task.dart';
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  Task task;

  TaskView({this.task});

  @override
  Widget build(BuildContext context) {
    bool isCompleted = task.status == Status.completed;
    final double rightPadding = !isCompleted ? 80.0 : 16.0;

    return Line(
        isCompleted: !isCompleted,
        margin: isCompleted ? EdgeInsets.only(right: 64.0, top: 16.0) : null,
        borderRadius: 30.0,
        child: Padding(
          padding: EdgeInsets.only(
              left: 16.0, right: rightPadding, top: 8.0, bottom: 8.0),
          child: Column(
            children: [
              Text(
                task.title,
                style: TextStyle(fontSize: 26.0, color: Colors.black),
              ),
              Text(
                task.description,
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              )
            ],
          ),
        ));
  }
}

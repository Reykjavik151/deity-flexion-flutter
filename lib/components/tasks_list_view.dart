import 'package:deity_flexion_app/components/task_view.dart';
import 'package:deity_flexion_app/data/task.dart';
import 'package:flutter/material.dart';

class TasksListView extends StatelessWidget {
  List<Widget> tasks;

  TasksListView(
      {List<Task> tasks, Function onTaskPress, Function onTaskLongPress}) {
    this.tasks = [];
    tasks.forEach((task) {
      this.tasks.add(
            TaskView(
              task: task,
              onPress: onTaskPress,
              onLongPress: onTaskLongPress,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.tasks,
      reverse: true,
    );
  }
}

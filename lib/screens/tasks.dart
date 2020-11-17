import 'package:deity_flexion_app/components/default_progress_indicator.dart';
import 'dart:async';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/components/tasks_list_view.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/data/status.dart';
import 'package:deity_flexion_app/data/task.dart';
import 'package:deity_flexion_app/screens/tasks_add.dart';
import 'package:deity_flexion_app/services/firebase_auth.dart';
import 'package:deity_flexion_app/services/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TasksPage extends StatefulWidget {
  static String id = 'tasks_screen';

  bool isLoading = false;
  final User currentUser = FirebaseAuthHelper.getCurrentUser();
  List<Task> tasks = [];

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 300), () => this.getTasks());
  }

  getTasks() async {
    this.setState(() {
      widget.isLoading = true;
    });

    List<Task> newTasks =
        await FirebaseStorageHelper.getTasksByUid(widget.currentUser.uid);

    this.setState(() {
      widget.tasks = newTasks;
      widget.isLoading = false;
    });
  }

  addTask(Task task) async {
    this.setState(() {
      widget.isLoading = true;
    });

    Task newTask = await FirebaseStorageHelper.addTask(task: task);

    this.setState(() {
      widget.tasks.add(newTask);
      widget.isLoading = false;
    });
  }

  onTaskPress(Task task) async {
    this.setState(() {
      switch (task.status) {
        case Status.completed:
          task.status = Status.none;
          break;
        case Status.none:
          task.status = Status.completed;
          break;
      }
    });

    await FirebaseStorageHelper.updateTask(task: task);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.tasks);
    return ModalProgressHUD(
      inAsyncCall: widget.isLoading,
      progressIndicator: DefaultProgressIndicator(),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.lightBlueAccent[200],
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: TASKS_HERO_TAG,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0))),
                      child: SafeArea(
                        bottom: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tasks',
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.lightBlueAccent[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TasksListView(tasks: widget.tasks, onTaskPress: this.onTaskPress),
                ),
                Hero(
                  tag: FIRST_LINE_HERO_TAG,
                  child: Line(
                    height: 12.0,
                    // margin: EdgeInsets.only(bottom: 12.0),
                  ),
                ),
                Hero(
                  tag: SECOND_LINE_HERO_TAG,
                  child: Line(
                    backgroundColor: Colors.white70,
                    height: 32.0,
                    // margin: EdgeInsets.only(bottom: 12.0),
                  ),
                ),
                Hero(
                  tag: THIRD_LINE_HERO_TAG,
                  child: Line(
                    height: 32.0,
                    backgroundColor: Colors.white70,
                    // margin: EdgeInsets.only(bottom: 12.0),
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
          ),
          Positioned(
            bottom: 64.0,
            right: 16.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: () async {
                  dynamic titleDescriptionList =
                  await Navigator.pushNamed(context, TasksAddPage.id);
                  if (titleDescriptionList is List<String>) {
                    addTask(Task(
                      id: '',
                      ownerId: widget.currentUser.uid,
                      status: Status.none,
                      title: titleDescriptionList[0],
                      description: titleDescriptionList[1],
                      createdAt: DateTime.now().toIso8601String(),
                    ));
                  }
                },
                child: Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.lightBlueAccent[700],
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

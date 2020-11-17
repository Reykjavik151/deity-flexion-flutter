import 'package:deity_flexion_app/components/default_form.dart';
import 'package:deity_flexion_app/components/default_text_form_field.dart';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/data/task.dart';
import 'package:deity_flexion_app/services/firebase_storage.dart';
import 'package:flutter/material.dart';

class TasksEditPage extends StatefulWidget {
  static String id = 'tasks_edit_screen';

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  _TasksEditPageState createState() => _TasksEditPageState();
}

class _TasksEditPageState extends State<TasksEditPage> {

  @override
  void initState() {
    super.initState();
  }

  onEditTask(Task task) async {
    String title = widget.titleController.value.text;
    String description =
        widget.descriptionController.value.text;

    task.title = title;
    task.description = description;

    await FirebaseStorageHelper.updateTask(task: task);
    Navigator.pop(context, true);
  }

  onDeleteTask(Task task) async {
    await FirebaseStorageHelper.deleteTask(taskId: task.id);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context).settings.arguments as Task;
    print(task);
    widget.titleController.value = TextEditingValue(text: task.title);
    widget.descriptionController = TextEditingController(text: task.description);

    return Scaffold(
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
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Task',
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
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16.0),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: DefaultForm(
                    onSubmit: () {
                      this.onEditTask(task);
                    },
                    submitButtonText: 'Edit',
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DefaultTextFormInput(
                        controller: widget.titleController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DefaultTextFormInput(
                        controller: widget.descriptionController,
                        minLines: 1,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onDeleteTask(task);
                  },
                  child: Line(
                    backgroundColor: Colors.red[100],
                    height: 64.0,
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
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
          ),
        ],
      ),
    );
  }
}

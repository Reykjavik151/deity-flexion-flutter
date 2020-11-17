import 'package:deity_flexion_app/components/default_form.dart';
import 'package:deity_flexion_app/components/default_text_form_field.dart';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:flutter/material.dart';

class NotesAddPage extends StatefulWidget {
  static String id = 'notes_add_screen';

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  _NotesAddPageState createState() => _NotesAddPageState();
}

class _NotesAddPageState extends State<NotesAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(),
          ),
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
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: DefaultForm(
                  onSubmit: () {
                    String title = widget.titleController.value.text;
                    String body =
                        widget.bodyController.value.text;

                    Navigator.pop(context, [title, body]);
                  },
                  submitButtonText: 'Save',
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
                        'Body',
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DefaultTextFormInput(
                      controller: widget.bodyController,
                      minLines: 3,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Hero(
            tag: NOTES_HERO_TAG,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.only(top: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0))),
                child: SafeArea(
                  top: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Note',
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.lightBlueAccent[700],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


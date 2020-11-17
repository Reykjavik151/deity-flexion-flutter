import 'package:deity_flexion_app/components/default_form.dart';
import 'package:deity_flexion_app/components/default_text_form_field.dart';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/data/note.dart';
import 'package:deity_flexion_app/services/firebase_storage.dart';
import 'package:flutter/material.dart';

class NotesEditPage extends StatefulWidget {
  static String id = 'notes_edit_screen';

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  _NotesEditPageState createState() => _NotesEditPageState();
}

class _NotesEditPageState extends State<NotesEditPage> {
  onEditNote(Note note) async {
    String title = widget.titleController.value.text;
    String body = widget.bodyController.value.text;

    note.title = title;
    note.body = body;

    await FirebaseStorageHelper.updateNote(note: note);
    Navigator.pop(context, true);
  }

  onDeleteNote(Note note) async {
    await FirebaseStorageHelper.deleteNote(noteId: note.id);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context).settings.arguments as Note;
    widget.titleController.value = TextEditingValue(text: note.title);
    widget.bodyController = TextEditingController(text: note.body);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView(
                    reverse: true,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16.0),
                    children: [
                      SizedBox(height: 96.0),
                      GestureDetector(
                        onTap: () {
                          onDeleteNote(note);
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
                      Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        child: DefaultForm(
                          onSubmit: () {
                            this.onEditNote(note);
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
                              'Edit Note',
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
          ),
        ],
      ),
    );
  }
}

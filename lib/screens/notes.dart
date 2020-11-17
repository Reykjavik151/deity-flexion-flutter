import 'dart:async';

import 'package:deity_flexion_app/components/default_progress_indicator.dart';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/components/notes_list_view.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/data/note.dart';
import 'package:deity_flexion_app/screens/notes_add.dart';
import 'package:deity_flexion_app/services/firebase_auth.dart';
import 'package:deity_flexion_app/services/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NotesPage extends StatefulWidget {
  static String id = 'notes_screen';

  bool isLoading = false;
  final User currentUser = FirebaseAuthHelper.getCurrentUser();
  List<Note> notes = [];

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 300), () => this.getNotes());
  }

  getNotes() async {
    this.setState(() {
      widget.isLoading = true;
    });

    List<Note> newNotes =
        await FirebaseStorageHelper.getNotesById(widget.currentUser.uid);

    this.setState(() {
      widget.notes = newNotes;
      widget.isLoading = false;
    });
  }

  addNote(Note note) async {
    this.setState(() {
      widget.isLoading = true;
    });

    Note newNote = await FirebaseStorageHelper.addNote(note: note);

    this.setState(() {
      widget.notes.add(newNote);
      widget.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: widget.isLoading,
      progressIndicator: DefaultProgressIndicator(),
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.lightBlueAccent[200],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Expanded(
                child: NotesListView(
                  notes: widget.notes,
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
                            'Notes',
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
        Positioned(
          top: 96.0,
          right: 16.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, NotesAddPage.id);
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
      ]),
    );
  }
}

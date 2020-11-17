import 'package:deity_flexion_app/components/note_view.dart';
import 'package:deity_flexion_app/data/note.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  List<Widget> notes;

  NotesListView({List<Note> notes, Function onNoteLongPress}) {
    this.notes = [];
    notes.forEach((note) {
      this.notes.add(
        NoteView(
          note: note,
          onLongPress: onNoteLongPress,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.notes,
    );
  }
}

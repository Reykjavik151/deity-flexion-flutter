import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/data/note.dart';
import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  Note note;
  final Function onLongPress;

  NoteView({this.note, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => this.onLongPress(this.note),
      child: Line(
          borderRadius: 30.0,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  note.body,
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
              ],
            ),
          )),
    );
  }
}

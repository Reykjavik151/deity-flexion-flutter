import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/screens/notes_add.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  static String id = 'notes_screen';

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ListView(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, NotesAddPage.id);
              },
              child: Icon(
                Icons.add,
                size: 32.0,
                color: Colors.lightBlueAccent[700],
              ),
              backgroundColor: Colors.white,
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
    );
  }
}

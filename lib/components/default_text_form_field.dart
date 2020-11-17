import 'package:deity_flexion_app/components/line.dart';
import 'package:flutter/material.dart';

class DefaultTextFormInput extends StatelessWidget {
  final String emptyValidateText;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;

  DefaultTextFormInput({
    this.controller = null,
    this.emptyValidateText = '',
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Line(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        autocorrect: false,
        minLines: this.minLines,
        maxLines: this.maxLines,
        controller: this.controller,
        cursorWidth: 6.0,
        validator: (value) {
          if (value.isEmpty) {
            return this.emptyValidateText;
          }
          return null;
        },
        cursorColor: Colors.black,
        obscureText: this.obscureText,
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 16.0),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintText: this.hintText,
            hintStyle: TextStyle(
              fontSize: 26.0,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            )
        ),
        style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

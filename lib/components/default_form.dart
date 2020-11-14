import 'package:deity_flexion_app/components/line.dart';
import 'package:flutter/material.dart';

// Define a custom Form widget.
class DefaultForm extends StatefulWidget {
  final List<Widget> children;
  final String submitButtonText;
  final Function onSubmit;

  DefaultForm({
    @required this.children,
    this.submitButtonText = '',
    @required this.onSubmit,
  });

  @override
  DefaultFormState createState() {
    return DefaultFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class DefaultFormState extends State<DefaultForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...widget.children,
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  widget.onSubmit();
                }
              },
              child: Line(
                height: 64.0,
                child: Center(
                  child: Text(
                    widget.submitButtonText,
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
          // Add TextFormFields and ElevatedButton here.
        ));
  }
}

import 'package:deity_flexion_app/screens/home.dart';
import 'package:deity_flexion_app/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deity_flexion_app/components/default_form.dart';
import 'package:deity_flexion_app/components/default_text_form_field.dart';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/constants.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register_screen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  onRegister(String email, String password) async {
    if (await FirebaseAuthHelper.register(email: email, password: password) !=
        null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: FIRST_LINE_HERO_TAG,
              child: Line(
                height: 12.0,
                isCompleted: false,
                margin: EdgeInsets.only(bottom: 12.0, right: 32.0),
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
                isCompleted: false,
                margin: EdgeInsets.only(bottom: 12.0, right: 16.0),
              ),
            ),
            Hero(
              tag: FOURTH_LINE_HERO_TAG,
              child: Line(
                height: 12.0,
                isCompleted: false,
                margin: EdgeInsets.only(right: 64.0),
              ),
            ),
            Expanded(
              child: DefaultForm(
                onSubmit: () {
                  String email = widget.emailController.value.text;
                  String password = widget.passwordController.value.text;
                  print('email is $email');
                  print('password is $password');

                  onRegister(email, password);
                },
                children: [
                  DefaultTextFormInput(
                    controller: widget.emailController,
                    emptyValidateText: 'Email is required',
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                  ),
                  DefaultTextFormInput(
                    controller: widget.passwordController,
                    emptyValidateText: 'Password is required',
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ],
                submitButtonText: 'Register',
              ),
            )
          ],
        ),
      ),
    );
  }
}

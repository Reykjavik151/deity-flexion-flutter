import 'package:deity_flexion_app/components/default_progress_indicator.dart';
import 'package:deity_flexion_app/components/default_text_form_field.dart';
import 'package:deity_flexion_app/components/line.dart';
import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/screens/home.dart';
import 'package:deity_flexion_app/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:progress_indicators/progress_indicators.dart';

// Widgets
import '../components/default_form.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_screen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void onLogin(String email, String password) async {
    this.setState(() {
      widget.isLoading = true;
    });

    try {
      if (await FirebaseAuthHelper.login(email: email, password: password) !=
          null) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }
    } catch (e) {
      print(e);
    } finally {
      this.setState(() {
        widget.isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: widget.isLoading,
      progressIndicator: DefaultProgressIndicator(),
      child: Scaffold(
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

                    onLogin(email, password);
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
                  submitButtonText: 'Login',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

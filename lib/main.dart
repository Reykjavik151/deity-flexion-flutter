import 'package:deity_flexion_app/screens/home.dart';
import 'package:deity_flexion_app/screens/login.dart';
import 'package:deity_flexion_app/screens/register.dart';
import 'package:deity_flexion_app/screens/tasks.dart';
import 'package:deity_flexion_app/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DeityFlexionApp());
}

class DeityFlexionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          accentColor: Colors.purple[600],
          textTheme: TextTheme(
              body1: TextStyle(
                color: Colors.white,
              ))),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
        TasksPage.id: (context) => TasksPage(),
      }
    );
  }
}


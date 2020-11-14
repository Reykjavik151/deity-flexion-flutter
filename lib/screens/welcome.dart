import 'package:deity_flexion_app/constants.dart';
import 'package:deity_flexion_app/screens/login.dart';
import 'package:deity_flexion_app/screens/register.dart';
import 'package:flutter/material.dart';

// Widgets
import '../components/line.dart';

class WelcomePage extends StatelessWidget {
  static String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DEITY',
                      style: TextStyle(
                        fontSize: 72.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'FLEXION',
                      style: TextStyle(
                        fontSize: 72.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Hero(
                    tag: FIRST_LINE_HERO_TAG,
                    child: Line(
                      isCompleted: false,
                      height: 12.0,
                      margin: EdgeInsets.only(bottom: 12.0, right: 64.0),
                    ),
                  ),
                  Hero(
                    tag: SECOND_LINE_HERO_TAG,
                    child: Line(
                      height: 32.0,
                      margin: EdgeInsets.only(bottom: 18.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RegisterPage.id),
                    child: Line(
                      height: 64.0,
                      margin: EdgeInsets.only(bottom: 18.0),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, LoginPage.id),
                    child: Line(
                      height: 64.0,
                      margin: EdgeInsets.only(bottom: 18.0),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                      isCompleted: false,
                      margin: EdgeInsets.only(right: 64.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

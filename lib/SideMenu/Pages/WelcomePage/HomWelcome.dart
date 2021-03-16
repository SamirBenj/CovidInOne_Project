import 'package:flutter/material.dart';
import 'package:flutter_application_1/SideMenu/Pages/WelcomePage/WelcomePage.dart';

class HomeWelcome extends StatefulWidget {
  HomeWelcome({Key key}) : super(key: key);

  @override
  _HomeWelcomeState createState() => _HomeWelcomeState();
}

class _HomeWelcomeState extends State<HomeWelcome> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        WelcomePage(),
      ],
    );
  }
}

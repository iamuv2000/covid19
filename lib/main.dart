import 'package:flutter/material.dart';

//importing screens
import 'Screens/main_page.dart';

void main() => runApp(Covid19());

class Covid19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.black54),
          ),
        ),
        home:  MainScreen(),
    );
  }
}

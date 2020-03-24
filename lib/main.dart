import 'package:flutter/material.dart';

//importing screens
import 'Screens/main_page.dart';
import 'Screens/news.dart';
import 'Screens/help.dart';

void main() => runApp(Covid19());

class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  int _currentIndex = 0;

  Widget returnPage(index){
    setState(() {

    });
    switch(index){
      case 0: return MainScreen();
      case 1: return NewsScreen();
      case 2: return HelpScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Covid19'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: returnPage(_currentIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.black12,
          selectedItemColor: Colors.blueAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq),
              title: Text('Statistics'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.art_track),
              title: Text('News'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              title: Text('Help'),
            )
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        )
      ),
    );
  }
}

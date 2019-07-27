import 'package:flutter/material.dart';

import 'airplay_widget.dart';
import 'email_widget.dart';
import 'home_widget.dart';
import 'page_widget.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() {
    return _BottomNavigationWidgetState();
  }
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomColor = Colors.lightBlue;
  int _currentIndex = 0;

  List<Widget> bodyList = List();

  @override
  void initState() {
    super.initState();
    bodyList
      ..add(HomeWidget())
      ..add(EmailWidget())
      ..add(PagesWidget())
      ..add(AirPlayWidget());
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomColor,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: _bottomColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomColor,
              ),
              title: Text(
                "Email",
                style: TextStyle(color: _bottomColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomColor,
              ),
              title: Text(
                "Pages",
                style: TextStyle(color: _bottomColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _bottomColor,
              ),
              title: Text(
                "Airplay",
                style: TextStyle(color: _bottomColor),
              ),
            ),
          ]),
    );
  }
}

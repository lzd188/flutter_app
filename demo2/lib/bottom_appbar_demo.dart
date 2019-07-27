import 'package:flutter/material.dart';

import 'each_view.dart';

class BottomAppbarDemo extends StatefulWidget {
  @override
  _BottomAppbarDemoState createState() {
    return _BottomAppbarDemoState();
  }
}

class _BottomAppbarDemoState extends State<BottomAppbarDemo> {
  List<Widget> bodyList;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    bodyList = List();
    bodyList..add(EachView(title: "android"))..add(EachView(title: "home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EachView(
                        title: "new page",
                      )));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: "添加",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: Icon(Icons.android),
            ),
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyKeepAliveWidget extends StatefulWidget {
  @override
  _MyKeepAliveWidgetState createState() {
    return _MyKeepAliveWidgetState();
  }
}

class _MyKeepAliveWidgetState extends State<MyKeepAliveWidget>
    with AutomaticKeepAliveClientMixin
{
  int _counter = 0;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("click to add one"),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.display3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        child: Icon(Icons.add),
        tooltip: "increase one",
      ),
    );
  }
}

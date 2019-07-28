import 'package:flutter/material.dart';

class WrapLayoutDemo extends StatefulWidget {
  @override
  _WrapLayoutDemoState createState() => _WrapLayoutDemoState();
}

class _WrapLayoutDemoState extends State<WrapLayoutDemo> {
  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = List()..add(buildAddWidget());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Wrap流式布局"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Opacity(
              opacity: 0.8,
              child: Container(
                height: height / 2,
                width: width,
                color: Colors.grey,
                child: Wrap(
                  children: widgets,
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildAddWidget() {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 80.0,
          width: 80.0,
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        if (widgets.length < 9) {
          setState(() {
            widgets.insert(widgets.length - 1, buildPhotoWidget());
          });
        }
      },
    );
  }

  Widget buildPhotoWidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text("photo"),
      ),
    );
  }
}

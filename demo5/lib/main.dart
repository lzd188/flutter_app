import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "keep alive",
      home: TabDemo(),
    );
  }
}

class TabDemo extends StatefulWidget {
  @override
  _TabDemoState createState() {
    return _TabDemoState();
  }
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("keep alive demo"),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyKeepAliveWidget(),
          MyKeepAliveWidget(),
          MyKeepAliveWidget(),
        ],
      ),
    );
  }
}

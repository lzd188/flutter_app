import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData.dark(),
      home: MyExpansionPanelList(),
    );
  }
}

class MyExpandedTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expandedTile"),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text("ExpansionTile"),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.black38,
          children: <Widget>[
            ListTile(
              title: Text("title"),
              subtitle: Text("subtitle"),
            )
          ],
        ),
      ),
    );
  }
}

class MyExpansionPanelList extends StatefulWidget {
  @override
  _MyExpansionPanelListState createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  List<int> indexList;
  List<ExpansionBean> expansionList;

  @override
  void initState() {
    super.initState();
    indexList = List();
    expansionList = List();
    for (int i = 0; i < 10; i++) {
      indexList.add(i);
      expansionList.add(ExpansionBean(i, false));
    }
  }

  _currentIndex(int panelIndex, bool isExpanded) {
    expansionList[panelIndex].isExpanded =
        !expansionList[panelIndex].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expansion panel list demo"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int panelIndex, bool isExpanded) {
            setState(() {
              _currentIndex(panelIndex, isExpanded);
            });
          },
          children: indexList.map((index) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("this is $index"),
                  leading: Icon(Icons.account_box),
                );
              },
              body: ListTile(
                title: Text("item $index"),
              ),
              isExpanded: expansionList[index].isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// 列表中每一个item的bean
class ExpansionBean {
  int index;
  bool isExpanded;

  ExpansionBean(this.index, this.isExpanded);
}

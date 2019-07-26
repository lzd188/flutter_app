import 'package:flutter/material.dart';

/// 学习使用Container组件、Image组件的初步使用
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564146014952&di=c01dede4f5836fd7647d1c59ffba6402&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201507%2F15%2F20150715211610_QA8vW.jpeg",
        fit: BoxFit.contain,
        color: Colors.pink,
        colorBlendMode: BlendMode.lighten,
        repeat: ImageRepeat.repeat,
      ),
//            alignment: Alignment.center,
      width: 600,
      height: 400,
//            padding: const EdgeInsets.all(30.0),
//            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 20.0),
//            color: Colors.lightBlue,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.lightBlue, Colors.pink])),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> items;

  MyListView({Key key, @required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.access_time),
            title: Text("${items[index]}"),
          );
        },
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      padding: EdgeInsets.all(30.0),
      mainAxisSpacing: 2.0,
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      children: <Widget>[
        new Image.network(
            'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',
            fit: BoxFit.cover),
        new Image.network(
            'http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',
            fit: BoxFit.cover),
      ],
    ));
  }
}

class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: RaisedButton(

          onPressed: () {},
          color: Colors.redAccent,
          child: Text('red button'),
        )),
        Expanded(
            child: RaisedButton(
          onPressed: () {},
          color: Colors.lightBlue,
          child: Text('blue button'),
        )),
        Expanded(
            child: RaisedButton(
          onPressed: () {},
          color: Colors.lightGreen,
          child: Text('green button'),
        )),
        Expanded(
            child: RaisedButton(
          onPressed: () {},
          color: Colors.yellowAccent,
          child: Text('yellow button'),
        )),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'bar.dart';
import 'bar_chart.dart';

class SingleBarPage extends StatefulWidget {
  @override
  _SingleBarPageState createState() => _SingleBarPageState();
}

class _SingleBarPageState extends State<SingleBarPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;
  BarTween _barTween;

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _barTween = BarTween(Bar.empty(), Bar.random());
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charts"),
      ),
      body: Center(
        child: CustomPaint(
          painter: BarPainter(_barTween.animate(_animation)),
          size: Size(200.0, 100.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }

  void changeData() {
    setState(() {
      _barTween = BarTween(_barTween.evaluate(_animation), Bar.random());
      _animation.forward(from: 0.0);
    });
  }
}

class BarChartPage extends StatefulWidget {
  @override
  _BarChartPageState createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;
  BarChartTween _tween;

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _tween = BarChartTween(BarChart.empty(), BarChart.random());
    _animation.forward();
  }

  void changeData() {
    setState(() {
      _tween = BarChartTween(_tween.evaluate(_animation), BarChart.random());
      _animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charts"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
          color: Colors.grey,
          child: CustomPaint(
            painter: BarChartPainter(_tween.animate(_animation)),
            size: Size(200.0, 100.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}

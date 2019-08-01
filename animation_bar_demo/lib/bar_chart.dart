import 'package:flutter/material.dart';

import 'bar.dart';

class BarChart {
  static const int barCount = 5;
  final List<Bar> bars;

  BarChart(this.bars) : assert(bars.length == barCount);

  factory BarChart.empty() => BarChart(List<Bar>.filled(barCount, Bar.empty()));

  factory BarChart.random() =>
      BarChart(List<Bar>.generate(barCount, (i) => Bar.random()));

  static BarChart lerp(BarChart begin, BarChart end, double t) {
    return BarChart(List<Bar>.generate(
        barCount, (i) => Bar.lerp(begin.bars[i], end.bars[i], t)));
  }
}

class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end);

  @override
  BarChart lerp(double t) {
    return BarChart.lerp(begin, end, t);
  }
}

class BarChartPainter extends CustomPainter {
  Animation<BarChart> animation;
  static const double barWidthFraction = 0.75;

  BarChartPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    void drawBar(Bar bar, double x, double barWidth, Paint paint) {
      // 将bar的颜色赋给画笔
      paint..color = bar.color;
      canvas.drawRect(
          Rect.fromLTWH(x, size.height - bar.height, barWidth, bar.height),
          paint);
    }

    final paint = Paint()..style = PaintingStyle.fill;
    final chart = animation.value;
    final barDistance = size.width / (1 + chart.bars.length);
    final barWidth = barDistance * barWidthFraction;

    // bar的x轴开始位置
    var x = barDistance - barWidth / 2;

    chart.bars.forEach((bar) {
      drawBar(bar, x, barWidth, paint);
      x += barDistance;
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

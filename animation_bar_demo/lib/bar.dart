import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import 'color_palette.dart';

class Bar {
  static final Random _random = new Random();
  static final double _maxHeight = 100.0;
  final Color color;
  final double height;

  Bar(this.color, this.height);

  /// 空bar
  factory Bar.empty() => Bar(Colors.transparent, 0.0);

  /// 带有随机颜色和随机高度的bar,高度范围
  factory Bar.random() =>
      Bar(ColorPalette.primary.random(), _random.nextDouble() * _maxHeight);

  static Bar lerp(Bar begin, Bar end, double t) {
    return Bar(Color.lerp(begin.color, end.color, t),
        lerpDouble(begin.height, end.height, t));
  }
}

/// Bar属性线性变换插值器
class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

  @override
  Bar lerp(double t) {
    return Bar.lerp(begin, end, t);
  }
}

/// BarChart绘制器 根据传入的动画对象，在画板canvas上用画笔paint绘制出对应的图形
class BarPainter extends CustomPainter {
  final Animation<Bar> animation;
  static const barWidth = 10.0;

  BarPainter(Animation<Bar> animation)
      : animation = animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final bar = animation.value;
    final paint = new Paint()
      ..color = bar.color
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromLTWH((size.width - barWidth) / 2.0, size.height - bar.height,
            barWidth, bar.height),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}




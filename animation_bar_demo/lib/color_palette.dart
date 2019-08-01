import 'dart:math';

import 'package:flutter/material.dart';

class ColorPalette {
  /// 提供默认调色板
  static final ColorPalette primary = ColorPalette(<Color>[
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.green,
    Colors.blue,
    Colors.lightBlue,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.deepPurple,
  ]);

  final List<Color> _colors;
  static final Random _random = new Random();

  ColorPalette(this._colors) : assert(_colors.isNotEmpty);

  /// 重写[]
  Color operator [](int index) => _colors[index % length];

  /// 返回调色板中随机一个颜色
  Color random() => _colors[_random.nextInt(length)];

  int get length => _colors.length;
}

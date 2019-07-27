import 'dart:ui';

import 'package:flutter/material.dart';

/// 毛玻璃效果
class FrostedGlassWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564245339089&di=4075668a419fcbdbf0683cade831f2bc&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201307%2F25%2F20130725211620_TTCri.thumb.700_0.jpeg"),
          ),
          Center(
            child: ClipRect(
              //可裁切的矩形
              child: BackdropFilter(
                //背景过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: 700,
                    width: 500,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        "pikaqiu",
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

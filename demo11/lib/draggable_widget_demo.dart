import 'package:flutter/material.dart';
import 'draggable_widget.dart';

class DraggableContainerDemo extends StatefulWidget {
  @override
  _DraggableContainerDemoState createState() => _DraggableContainerDemoState();
}

class _DraggableContainerDemoState extends State<DraggableContainerDemo> {
  Color _draggableColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DraggableContainer(
          offset: Offset(80.0, 80.0),
          color: Colors.lightBlue,
        ),
        DraggableContainer(
          offset: Offset(180.0, 80.0),
          color: Colors.pinkAccent,
        ),
        Center(
          child: DragTarget(
              // 一定要转成Color类型？？？
              onAccept: (Color color) {
            // 获取传递过来的颜色，刷新控件
            _draggableColor = color;
          }, builder: (context, candidateData, rejectedData) {
            return Container(
              height: 200.0,
              width: 200.0,
              color: _draggableColor,
            );
          }),
        ),
      ],
    );
  }
}

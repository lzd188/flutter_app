import 'package:flutter/material.dart';

class DraggableContainer extends StatefulWidget {
  final Offset offset;
  final Color color;

  DraggableContainer({Key key, @required this.offset, @required this.color})
      : super(key: key);

  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer> {
  Offset _offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        //传递过去的data
        data: widget.color,
        child: Container(
          height: 100.0,
          width: 100.0,
          color: widget.color,
        ),
        // 在拖拽过程中显示出来的控件样式
        feedback: Container(
          height: 110.0,
          width: 110.0,
          color: widget.color.withOpacity(0.5),
        ),
        // 在拖拽结束的时候
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this._offset = offset;
          });
        },
      ),
    );
  }
}

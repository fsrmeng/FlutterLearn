import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: DraggableApp(),
    ));

class DraggableApp extends StatefulWidget {
  @override
  _DraggableAppState createState() => _DraggableAppState();
}

class _DraggableAppState extends State<DraggableApp> {
  Color _drggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(80.0, 80.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(180.0, 80.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(onAccept: (color) {
              _drggableColor = color;
            }, builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: Colors.redAccent,
              );
            }),
          )
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;

  DraggableWidget({Key key, this.offset, this.widgetColor}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        child: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}

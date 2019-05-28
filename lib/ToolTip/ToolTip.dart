import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ToolTipApp()));

class ToolTipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ToolTip'),
        ),
        body: Center(
          child: Tooltip(
            message: '不要碰我',
            child: Icon(
              Icons.all_inclusive,
            ),
          ),
        ));
  }
}

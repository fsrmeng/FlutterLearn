import 'package:flutter/material.dart';
import 'CustomRouter.dart';

void main() => runApp(MaterialApp(
      home: FirstPage(),
    ));

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: new Text('FirstPage'),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(CustomRouter(SecondPage()));
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent,
        title: new Text('SecondPage'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }
}

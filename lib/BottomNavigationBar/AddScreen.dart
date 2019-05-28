import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  final String title;
  AddScreen({Key key, @required this.title}):super(key:key);

  @override
  _AddScreenState createState() => _AddScreenState(title: title);
}

class _AddScreenState extends State<AddScreen> {
  final String title;
  _AddScreenState({@required this.title}):super();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text(this.title),
      ),
    );
  }
}

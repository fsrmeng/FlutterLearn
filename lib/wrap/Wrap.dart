import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: WrapAppWidget(),));

class WrapAppWidget extends StatefulWidget {
  @override
  _WrapAppWidgetState createState() => _WrapAppWidgetState();
}

class _WrapAppWidgetState extends State<WrapAppWidget> {
  List<Widget> list;
  @override
  void initState() {
    super.initState();
    list = List()..add(buildAddButton());
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: height/2,
          width: width,
          child: Wrap(
            children: list,
            spacing: 26.0,
          ),
        ),
      )
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(list.length < 9) {
            list.insert(list.length - 1, buildPhoto());
          }
        });

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.lightGreen,
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}


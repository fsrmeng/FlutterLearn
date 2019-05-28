import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加1'),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            incrementCounter();
          },
        child: Icon(
            Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  //重写keepAlive为true，就可以有记忆功能了
  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_app/TabBar/MyHomePage.dart';

void main() => runApp(MaterialApp(
      home: TabBarPages(),
    ));

class TabBarPages extends StatefulWidget {
  @override
  _TabBarPagesState createState() => _TabBarPagesState();
}

class _TabBarPagesState extends State<TabBarPages>
    with SingleTickerProviderStateMixin {
  //with是dart的关键字，意思是混入的意思，就是说可以将一个或者多个类的功能添加到自己的类
  //无需继承这些类，避免多重继承导致的问题
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: controller, tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike))
        ]),
      ),
      body: TabBarView(
          controller: controller,
          children: [
            MyHomePage(),
            MyHomePage(),
            MyHomePage(),
          ]
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

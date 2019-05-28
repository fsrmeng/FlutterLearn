import 'package:flutter/material.dart';
import 'package:flutter_app/BottomNavigationBar/HomeScreen.dart';
import 'package:flutter_app/BottomNavigationBar/PagesScreen.dart';
import 'package:flutter_app/BottomNavigationBar/MailScreen.dart';
import 'package:flutter_app/BottomNavigationBar/AddScreen.dart';

void main() =>
    runApp(MaterialApp(
      title: "",
      home: BottomAppBarWidget(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    ));

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomNavigationWidget> {
  final mBottonIconColor = Colors.blue;
  List<Widget> mList = new List();
  int mCurrentIndex = 0;

  @override
  initState() {
    mList..add(HomeScreen())..add(MailScreen())..add(PagesScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: mList[mCurrentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: mBottonIconColor,
                ),
                title: new Text(
                  'home',
                  style: TextStyle(color: mBottonIconColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.mail,
                  color: mBottonIconColor,
                ),
                title: new Text(
                  'mail',
                  style: TextStyle(color: mBottonIconColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages,
                  color: mBottonIconColor,
                ),
                title: new Text(
                  'pages',
                  style: new TextStyle(color: mBottonIconColor),
                )),
          ],
          currentIndex: mCurrentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              mCurrentIndex = index;
            });
          }),
    );
  }
}

class BottomAppBarWidget extends StatefulWidget {
  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  List<Widget> list = new List();
  int currentIndex = 0;

  @override
  void initState() {
    list..add(HomeScreen())..add(PagesScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: list[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddScreen(title: 'AddScreen',);
          }));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        //凹槽
        shape: CircularNotchedRectangle(),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.pages),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


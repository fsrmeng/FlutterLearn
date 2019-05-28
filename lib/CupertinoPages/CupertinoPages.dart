import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CupertinoPagesApp(),));
class CupertinoPagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: CupertinoColors.destructiveRed,
          child: CupertinoButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                //只要使用CupertinoPageRoute打开的子页面，就可以实现右滑返回上一级
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => CupertinoPagesApp()));
              }
          ),
        ),
      ),
    );
  }
}

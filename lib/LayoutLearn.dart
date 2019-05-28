import 'package:flutter/material.dart';

void main() => runApp(CardApp());

class RowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Row')),
        body: new Row(
          children: <Widget>[
            new Expanded(
              child: new RaisedButton(
                onPressed: () {},
                color: Colors.red,
                child: new Text('红色按钮'),
              ),
            ),
            new Expanded(
              child: new RaisedButton(
                onPressed: () {},
                color: Colors.orangeAccent,
                child: new Text('黄色按钮'),
              ),
            ),
            new Expanded(
              child: new RaisedButton(
                onPressed: () {},
                color: Colors.pinkAccent,
                child: new Text('粉色按钮'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
//      alignment: FractionalOffset(1, 0.5),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage(
              'http://upload.jianshu.io/users/upload_avatars/6069538/e63b99ef-6f33-4ee4-a78f-2d784b7b74d9.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
          radius: 50,
        ),
//        new Container(
//          decoration: BoxDecoration(
//            color: Colors.blueAccent,
//          ),
////          padding: EdgeInsets.all(5),
//          child: new Text('zhangpan'),
//        ),

        new Positioned(top: 10, left: 10, child: new Text('zhangpan')),

        new Positioned(bottom: 0, right: 10, child: new Text('wangchuang'))
      ],
    );

    return new MaterialApp(
      title: '',
      home: new Scaffold(
          appBar: new AppBar(title: new Text('stack')),
          body: Center(child: stack)),
    );
  }
}

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      elevation: 4,
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
            title: new Text('管理中心'),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
            title: new Text('消息中心'),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
            title: new Text('服务中心'),
          ),
          new Divider()
        ],
      ),
    );

    return new MaterialApp(
      title: '',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Card'),
        ),
        body: Center(
            child: new Container(
              height: 300,
              width: 300,
              child: card,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(GridViewApp());

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
          body: Center(
            child: Container(
              height: 300.0,
              width: 300.0,
//              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: Text(
                '测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.redAccent,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightBlue,
                    Colors.greenAccent,
                    Colors.purple
                  ]),
                  border: Border.all(width: 2.0, color: Colors.red)),
            ),
          )),
    );
  }
}

class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image'),
        ),
        body: Container(
          height: 400.0,
          width: 400.0,
          child: Image.network(
            'http://jspang.com/static/myimg/blogtouxiang.jpg',
            color: Colors.greenAccent,
            colorBlendMode: BlendMode.darken,
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
    );
  }
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: Text('ListView'),
            ),
            body: listViewBuilder()));
  }

  Widget listViewListTitle() {
    List<ListTile> items = new List();
    for (int i = 0; i < 30; i++) {
      items.add(new ListTile(
        leading: Icon(Icons.access_alarm),
        title: Text('access_alarm'),
        trailing: Icon(Icons.access_time),
      ));
    }
    return ListView(
      children: items,
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, i) => Container(
            height: 64,
            child: Column(
              children: <Widget>[
                Container(
                  height: 63,
                  alignment: Alignment.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '家庭管理',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      ),
                      Container(
                        child: Icon(Icons.arrow_right),
                        margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Color.fromARGB(100, 238, 238, 238),
                )
              ],
            ),
          ),
    );
  }
}

class ListViewApp extends StatefulWidget {
  final List<String> items;

  ListViewApp({Key key, @required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ListState(items);
  }
}

class ListState extends State {
  final List<String> items;

  ListState(this.items);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("ListView"),
        ),
        body: new ListView.builder(
            itemBuilder: buildItem, itemCount: items.length),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
//    if (index.isOdd) {
////      return new Divider(
////          height: 1.0, color: Color.fromARGB(100, 238, 238, 238));
////    }
    return new GestureDetector(
      //处理点击事件
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return getDialog(context);
            });
      },
      child: Container(
        height: 64,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: new Text(
                items[index],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: new Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
    );
  }

  Widget getDialog(BuildContext context) {
    return new AlertDialog(
      title: new Text('点击提示'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[new Text('你点击了Item')],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Debug.log('zp', '点击取消');
              Navigator.of(context).pop();
            },
            child: new Text('取消')),
        new FlatButton(
            onPressed: () {
              Debug.log('zp', '点击确定');
              Navigator.of(context).pop();
            },
            child: new Text('确定'))
      ],
    );
  }
}

class GridViewApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new GridListState();
  }
}

class GridListState extends State {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Scaffold(
          appBar: AppBar(
            title: new Text('GridView'),
          ),
          body: new GridView.count(
            padding: EdgeInsets.all(8),
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: buildGridList(20),
            physics: new BouncingScrollPhysics(),
            childAspectRatio: 1,    //宽高比
          )),
    );
  }

  List<Widget> buildGridList(int number) {
    List<Widget> items = new List();
    for (int i = 0; i < number; i++) {
      items.add(getItemWidget());
    }
    return items;
  }

  Widget getItemWidget() {
    String url =
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
        "3408544765&fm=27&gp=0.jpg";
    return new Image.network(url, fit: BoxFit.cover);
  }
}

List<String> generateTitles() {
  List<String> titles = new List();
  titles.add('家庭管理');
  titles.add('消息中心');
  titles.add('帮助中心');
  titles.add('更多服务');
  titles.add('设置');
  return titles;
}

class Debug {
  static log(String tag, String text) {
    print('[$tag] $text');
  }

  static info(String tag, String text) {
    print('[$tag] $text');
  }

  static success(String tag, String text) {
    print('[$tag] $text');
  }

  static error(String tag, String text) {
    print('[$tag] $text');
  }
}

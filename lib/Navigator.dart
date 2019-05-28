import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: '', home: FirstPage()
//      new FirstScreen(
//          productList:
//              List.generate(20, (i) => Product('商品 $i', '这是一个商品详情，编号为：$i'))),
    ));

class FirstScreen extends StatelessWidget {
  final List<Product> productList;

  FirstScreen({Key key, @required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('firstScreen'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SecondScreen(
                          productList: productList,
                        )));
          },
          child: new Text('第一个界面'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final List<Product> productList;

  SecondScreen({Key key, @required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('SecondScreen'),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) =>
                buildItemList(context, index, this.productList),
            itemCount: productList.length,
          )),
    );
  }
}

Widget buildItemList(BuildContext context, int index, List<Product> list) {
  return new ListTile(
    title: new Text(list[index].title),
    subtitle: new Text(list[index].description),
  );
}

class Product {
  String title;
  String description;

  Product(this.title, this.description);
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('找小姐姐要电话'),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateToXiaojiejie(context);
      },
      child: Text('去找小姐姐'),
    );
  }

  _navigateToXiaojiejie(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Xiaojiejie()));

    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }

//  _navigateToXiaojiejie(BuildContext context) {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => Xiaojiejie())
//    );
//  }
}


class Xiaojiejie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是小姐姐'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('大长腿小姐姐'),
              onPressed: () {
                Navigator.pop(context, '大长腿：180');
              },
            ),
            RaisedButton(
              child: Text('小蛮腰小姐姐'),
              onPressed: () {
                Navigator.pop(context, '小蛮腰：190');
              },
            ),

            Image.asset('images/default_icon.png', width: 130, height: 130,)
          ],
        ),
      ),
    );
  }
}

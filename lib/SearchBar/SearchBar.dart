import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SearchBarApp()));

class SearchBarApp extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final searchList = ["jiejie-大长腿", "jiejie-水蛇腰", "gege1-帅气欧巴", "gege2-小鲜肉"];
  final recentSuggest = ["推荐-1", "推荐-2"];

  /// 搜索条右侧的按钮执行方法
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  /// 搜索栏左侧的图标和功能
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  /// 搜索到内容的展现
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  /// 设置推荐
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ])),
            ));
  }
}

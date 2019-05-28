import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ExPansionPanelApp()));

class ExPansionPanelApp extends StatefulWidget {
  @override
  _ExPansionPanelAppState createState() => _ExPansionPanelAppState();
}

class _ExPansionPanelAppState extends State<ExPansionPanelApp> {
  List<ExpandStateBean> dataList;
  List<int> indexList;

  @override
  void initState() {
    super.initState();
    dataList = new List();
    indexList = new List();

    for(int i =0; i < 20; i++) {
      dataList.add(new ExpandStateBean(false, i));
      indexList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelList'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded){
            setCurIndex(index, isExpanded);
          },
          children: indexList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('This is No. $index'),
                );
              },
              body: ListTile(
                title: Text('expansion no. $index'),
              ),
              isExpanded: dataList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }

  void setCurIndex(int index, bool isExpanded) {
    setState(() {
      dataList.forEach((item){
        if(item.index == index) {
          item.isOpen = !isExpanded;
        }
      });
    });
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.isOpen, this.index);
}

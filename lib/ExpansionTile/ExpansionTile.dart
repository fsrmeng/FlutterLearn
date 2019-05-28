import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MaterialApp(home: ExpansionTileApp(), theme: ThemeData.dark(),));
}

class ExpansionTileApp extends StatefulWidget {
  @override
  _ExpansionTileAppState createState() => _ExpansionTileAppState();
}

class _ExpansionTileAppState extends State<ExpansionTileApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('Expansion Tile'),
          leading: Icon(Icons.ac_unit),
          initiallyExpanded: false,
          backgroundColor: Colors.grey,
          children: <Widget>[
            ListTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
            )
          ],
        ),
      ),
    );
  }
}

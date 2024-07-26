import 'package:flutter/material.dart';

import './hal_komputer.dart' as komputer;
import './hal_headset.dart' as headset;
import './hal_smartphone.dart' as hp;
import './hal_radio.dart' as radio;

void main() {
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          controller: _controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),text: "Komputer",
            ),
            new Tab(
              icon: new Icon(Icons.headset),text: "Headset",
            ),
            new Tab(
              icon: new Icon(Icons.smartphone),text: "Smartphone",
            ),
            new Tab(
              icon: new Icon(Icons.radio),text: "Radio",
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new komputer.Komputer(),
          new headset.Headset(),
          new hp.Smartphone(),
          new radio.Radio(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.amber,
        child:  new TabBar(
          controller: _controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.computer),
            ),
            new Tab(
              icon: new Icon(Icons.headset),
            ),
            new Tab(
              icon: new Icon(Icons.smartphone),
            ),
            new Tab(
              icon: new Icon(Icons.radio),
            ),
          ],
        ),
      ),

    );
  }
}

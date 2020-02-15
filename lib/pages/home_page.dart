import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carros_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String nome;

  HomePage(this.nome);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text : "Classicos"),
              Tab(text : "Esportivos"),
              Tab(text : "Luxo"),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CarrosListView("/tipo/classicos"),
          CarrosListView("/tipo/esportivos"),
          CarrosListView("/tipo/luxo"),
        ]),
        drawer: DrawerList(),
      ),
    );
  }
}

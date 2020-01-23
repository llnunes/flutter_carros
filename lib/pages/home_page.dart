import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String nome;

  HomePage(this.nome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Text(
        this.nome,
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

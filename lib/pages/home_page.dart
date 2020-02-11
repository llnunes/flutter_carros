import 'package:carros/api/carros_api.dart';
import 'package:carros/drawer_list.dart';
import 'package:carros/model/carro.dart';
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
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();

    return ListView.builder(
      itemCount: carros.length,
      itemBuilder: (context, index) {
        Carro c = carros[index];
        return Row(
          children: <Widget>[
            Image.network(
              c.urlFoto,
              width: 150,
            ),
            Flexible(
              child: Text(
                c.nome,
                style: TextStyle(fontSize: 30),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        );
      },
    );
  }
}

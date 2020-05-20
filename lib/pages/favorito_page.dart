import 'package:carros/model/carro.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/pages/favoritos/favoritos_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<FavoritosModel>(context, listen: false).getCarros();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    FavoritosModel model = Provider.of<FavoritosModel>(context);

    List<Carro> carros = model.carros;

    if (carros.isEmpty) {
      return Center(
        child: Text(
          "Nenhum favorito encontrado!",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CarrosListView(carros),
    );
  }

  Future<void> _onRefresh() {
    return Provider.of<FavoritosModel>(context, listen: false).getCarros();
  }

// NÃO FAZ DISPOSE DE BLOC GLOBAL
//  @override
//  void dispose() {
//    super.dispose();
//    favoritosBloc.dispose();
//  }
}

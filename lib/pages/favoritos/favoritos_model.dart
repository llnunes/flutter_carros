
import 'package:carros/model/carro.dart';
import 'package:carros/service/favorito_service.dart';
import 'package:flutter/cupertino.dart';

class FavoritosModel extends ChangeNotifier{
  List<Carro> carros = [];

  Future<List<Carro>> getCarros () async {
    carros = await FavoritoService.getCarros();
    notifyListeners();

    return carros;
  }
}
import 'dart:async';

import 'package:carros/bloc/SimpleBloc.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/service/favorito_service.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {

  Future<List<Carro>> fetch() async {
    List<Carro> carros;
    try {
      carros = await FavoritoService.getCarros();
      add(carros);
    } catch (e) {
      addError(e);
    }
    return carros;
  }
}

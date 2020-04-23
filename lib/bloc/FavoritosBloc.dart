import 'dart:async';

import 'package:carros/api/carros_api.dart';
import 'package:carros/bloc/SimpleBloc.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/model/favorito.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';
import 'package:carros/service/favorito_service.dart';
import 'package:carros/util/network.dart';

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

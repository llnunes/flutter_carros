
import 'package:carros/api/carros_api.dart';
import 'package:carros/bloc/SimpleBloc.dart';
import 'package:carros/model/carro.dart';

class CarroBloc extends SimpleBloc<List<Carro>> {

  fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}
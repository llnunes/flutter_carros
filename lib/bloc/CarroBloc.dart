import 'package:carros/api/carros_api.dart';
import 'package:carros/bloc/SimpleBloc.dart';
import 'package:carros/model/carro.dart';

class CarroBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    List<Carro> carros;
    try {
      carros = await CarrosApi.getCarros(tipo);
      add(carros);
    } catch (e) {
      addError(e);
    }
    return carros;
  }
}

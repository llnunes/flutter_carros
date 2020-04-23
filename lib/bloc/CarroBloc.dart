import 'package:carros/api/carros_api.dart';
import 'package:carros/bloc/SimpleBloc.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/util/network.dart';

class CarroBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    List<Carro> carros;
    try {
      if(! await isNetworkOn()) {
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      }

      carros = await CarrosApi.getCarros(tipo);

      if(carros.isNotEmpty) {
        final dao = CarroDAO();

        dao.count().then((x) => print(x));
        // salvar todos os carros
        carros.forEach((c) => dao.save(c));
        //print('salvos');
      }

      add(carros);
    } catch (e) {
      addError(e);
    }
    return carros;
  }
}

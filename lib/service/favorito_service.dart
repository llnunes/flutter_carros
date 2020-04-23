import 'package:carros/model/carro.dart';
import 'package:carros/model/favorito.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro c) async{

    Favorito favorito = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    final bool existe = await dao.exists(c.id);

    if(existe) {
      dao.delete(c.id);
    } else {
      dao.save(favorito);
    }

  }

  static Future<List<Carro>> getCarros() async{
    // 
    List<Carro> carros = await CarroDAO().query("select * from carro c, favorito f where c.id = f.id");

    return carros;
  }
}
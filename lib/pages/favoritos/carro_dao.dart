import 'package:carros/model/carro.dart';
import 'package:carros/util/sql/base_dao.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro>{
  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    return Carro.fromMap(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo)  {
   return query('select * from $tableName where tipo =? ',[tipo]);
  }
}

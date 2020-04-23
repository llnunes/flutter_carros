// Data Access Object
import 'package:carros/util/sql/base_dao.dart';
import 'package:carros/model/favorito.dart';

class FavoritoDAO extends BaseDAO<Favorito> {
  @override
  String get tableName => "favorito";

  @override
  Favorito fromMap(Map<String, dynamic> map) {
    return Favorito.fromMap(map);
  }
}
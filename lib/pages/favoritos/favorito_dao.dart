// Data Access Object
import 'package:carros/model/favorito.dart';
import 'package:carros/util/sql/base_dao.dart';

class FavoritoDAO extends BaseDAO<Favorito> {
  @override
  String get tableName => "favorito";

  @override
  Favorito fromMap(Map<String, dynamic> map) {
    return Favorito.fromMap(map);
  }
}
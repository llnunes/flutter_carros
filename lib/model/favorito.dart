import 'package:carros/model/carro.dart';
import 'package:carros/util/sql/entity.dart';

class Favorito extends Entity{
  
  int id;
  String nome;

  Favorito.fromCarro(Carro c) {
    this.id = c.id;
    this.nome = c.nome;
  }

  Favorito.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}
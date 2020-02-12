import 'package:carros/model/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarrosApi {
  //http://livrowebservices.com.br/rest/carros
  //https://carros-springboot.herokuapp.com/api/v1/carros

  static Future<List<Carro>> getCarros() async{
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';
    var response = await http.get(url);

    String json = response.body;

    List mapResponse = convert.json.decode(json);
    return [];
  }
}

import 'package:carros/model/carro.dart';
import 'package:carros/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarrosApi {
  //http://livrowebservices.com.br/rest/carros
  //https://carros-springboot.herokuapp.com/api/v1/carros

  static Future<List<Carro>> getCarros(parametro) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros'+parametro;

    Usuario usuario = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${usuario.token}"
    };



    print( headers);
    print("GET > " + url);

    var response = await http.get(url, headers: headers);

    String json = response.body;

    List mapResponse = convert.json.decode(json);

    return mapResponse.map<Carro>((map) => Carro.fromJson(map)).toList();;
  }
}

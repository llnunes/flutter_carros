import 'dart:convert' as convert;
import 'dart:io';

import 'package:carros/api/api_response.dart';
import 'package:carros/model/carro.dart';
import 'package:carros/util/http_helper.dart' as http;
import 'package:carros/util/upload_api.dart';

class CarrosApi {
  //http://livrowebservices.com.br/rest/carros
  //https://carros-springboot.herokuapp.com/api/v1/carros

  static Future<List<Carro>> getCarros(parametro) async {
    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros' + parametro;

    print("GET > " + url);

    var response = await http.get(url);

    String json = response.body;

    List mapResponse = convert.json.decode(json);

    List carros = mapResponse.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro c, File file) async {
    try {
      if (file != null) {
        ApiResponse response = await UploadApi.upload(file);
        if(response.ok) {
          String urlFoto = response.result;
          c.urlFoto = urlFoto;
          print("Carregou!");
        }
        print(response);
      }

      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      if (c.id != null) {
        url += "/${c.id}";
      }
      print("POST > " + url);

      String json = c.toJson();

      var response = await (c.id == null
          ? http.post(url, body: json)
          : http.put(url, body: json));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        //Map mapResponse = convert.json.decode(response.body);

        //Carro carro = Carro.fromMap(mapResponse);

        //print("Carro id: ${carro.id}");

        return ApiResponse.ok(result: true);
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error(msg: "Não foi possivel salvar o carro");
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(result: mapResponse["error"]);
    } catch (e) {
      print(e);
      return ApiResponse.error(msg: "Não foi possivel salvar o carro");
    }
  }

  static Future<ApiResponse<bool>> delete(Carro c) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/${c.id}';

      print("DELETE > " + url);

      var response = await http.delete(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return ApiResponse.ok(result: true);
      }

      return ApiResponse.error(msg: "Não foi possivel deletar o carro");
    } catch (e) {
      print(e);
      return ApiResponse.error(msg: "Não foi possivel deletar o carro");
    }
  }
}

import 'dart:convert';

import 'package:carros/api/api_response.dart';
import 'package:carros/model/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      //    var url = 'http://livrowebservices.com.br/rest/login';
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';
      Map<String, String> headers = {
        "Content-Type": "application/json"
      };

      Map params = {
        'username': login,
        'password': senha,
      };
      String s = json.encode(params);
      print("> $s");
      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if(response.statusCode == 200) {
        final user = new Usuario.fromJson(mapResponse);

        user.save();

        Usuario user2 = await Usuario.get();
        print("user 2: $user2");
        
        return ApiResponse.ok(user);
      } else {
        return ApiResponse.error(mapResponse["error"]);
      }

    } catch (error, exception) {
      print("Erro no login $error > $exception");
      return ApiResponse.error("Não foi possivel realizar o login. ");
    }
  }
}

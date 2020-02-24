import 'dart:async';

import 'package:carros/api/api_response.dart';
import 'package:carros/api/login_api.dart';
import 'package:carros/bloc/SimpleBloc.dart';
import 'package:carros/model/usuario.dart';

class LoginBloc extends BooleanBloc{

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    add(false);

    return response;
  }
}
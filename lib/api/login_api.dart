import 'package:http/http.dart' as http;

class LoginApi {

  static bool login (String usuario, String senha) {

    var url = 'http://livrowebservices.com.br/rest/login';
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read('https://example.com/foobar.txt'));
  }
}

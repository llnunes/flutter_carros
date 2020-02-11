import 'package:carros/model/carro.dart';

class CarrosApi {
  //http://livrowebservices.com.br/rest/carros
  //https://carros-springboot.herokuapp.com/api/v1/carros

  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(Carro(nome: "Porsche Panamera 1700", urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Porsche_Panamera.png"));
    carros.add(Carro(nome: "Lamborghini Aventador", urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png"));
    carros.add(Carro(nome: "BMW M5", urlFoto: "http://www.livroandroid.com.br/livro/carros/esportivos/BMW.png"));

    return carros;
  }
}

import 'package:carros/model/usuario.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/util/nav.dart';
import 'package:carros/util/sql/db_helper.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

//    // Inicializar o banco de dados
//    Future futureA = DatabaseHelper.getInstance().db;
//
//    Future futureB = Future.delayed(Duration(seconds: 3));
//
//    // Usuario
//    Future<FirebaseUser> futureC = FirebaseAuth.instance.currentUser();
//
//    Future.wait([futureA,futureB,futureC]).then((List values) {
//      FirebaseUser fUser = values[2];
//
//      if (fUser != null) {
//        firebaseUserUid = fUser.uid;
//
//        push(context, HomePage(), replace: true);
//      } else {
//        push(context, LoginPage(), replace: true);
//      }
//    });

    Future<Usuario> futureC = Usuario.get();
//    future.then((Usuario usuario) {
//      if(usuario != null) {
//        push(context, HomePage(), replace: true);
//        //setState(() {
//        //  _tLogin.text = usuario.login;
//        //});
//      }
//    });

    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 3));
    print("cabou delay");

    Future.wait([futureA,futureB,futureC]).then((List values) {
      Usuario user = values[2];
      print(user);
      if(user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

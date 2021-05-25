import 'package:flutter/material.dart';
import 'package:whatsapp/cadastro.dart';
import 'package:whatsapp/home.dart';
import 'login.dart';

//Colocando as rotas em um único local e que podem ser chamadas a qualquer momento de qualquer tela, apenas pelo nome.
class RouteGenerator {
  static const String ROTA_HOME = "/home";
  static const String ROTA_DEFAULT = "/login";
  static const String ROTA_LOGIN = "/login";
  static const String ROTA_CADASTRO = "/Cadastro";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROTA_DEFAULT:
        return MaterialPageRoute(builder: (_) => Login());
      case ROTA_LOGIN:
        return MaterialPageRoute(builder: (_) => Login());
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: (_) => Cadastro());
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada"),
        ),
      );
    });
  }
}

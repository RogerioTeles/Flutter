import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/home.dart';
import 'package:whatsapp/model/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/routeGenerator.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = '';

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty) {
        if (senha.isNotEmpty && senha.length > 6) {
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          _cadastrarUsuario(usuario);
        } else {
          setState(() {
            _mensagemErro = "Preencha a senha com 6 ou mais caracteres";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o email com um valor válido";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o nome";
      });
    }
  }

  _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      //Salvar dados do usuário
      FirebaseFirestore db = FirebaseFirestore.instance;
      //vai salvar as informações de cadastro no banco de dados relacionados ao usuario
      //utilizando o uid como chave
      db.collection("usuarios").doc(firebaseUser.user.uid).set(usuario.toMap());
      //usando o PishNamedAndRemoveUntil para resolver o problema de continuar aparecendo a seta
      Navigator.pushNamedAndRemoveUntil(
          context, RouteGenerator.ROTA_HOME, (_) => false);
    }).catchError((erro) {
      _mensagemErro =
          "Erro ao cadastrar usuário, valide os campos e tente novamente";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xff075E54)),
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      "images/usuario.png",
                      width: 200,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _controllerNome,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-Mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                    ),
                  ),
                  TextField(
                    controller: _controllerSenha,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.black,
                        elevation: 5,
                        shadowColor: Colors.black,
                        minimumSize: Size(150, 50),
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      ),
                      onPressed: () {
                        _validarCampos();
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

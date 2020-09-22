
import 'dart:math';

import 'package:cara_ou_coroa/Home.dart';
import 'package:flutter/material.dart';

class ResultadoCaraCoroa extends StatefulWidget {

  int numGerado;

  ResultadoCaraCoroa(this.numGerado);

  @override
  _ResultadoCaraCoroaState createState() => _ResultadoCaraCoroaState();
}

class _ResultadoCaraCoroaState extends State<ResultadoCaraCoroa> {

  var _listaImagens = ["images/moeda_cara.png",
    "images/moeda_coroa.png"];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff53c68c),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 100),
                child: Image.asset(_listaImagens[widget.numGerado]),
              ),

              Padding(padding: EdgeInsets.only(top: 40),
                child: GestureDetector(
                  child: Image.asset("images/botao_voltar.png"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'dart:math';

import 'package:cara_ou_coroa/Resultado.dart';
import 'package:flutter/material.dart';

class HomeCaraCoroa extends StatefulWidget {
  @override
  _HomeCaraCoroaState createState() => _HomeCaraCoroaState();
}

class _HomeCaraCoroaState extends State<HomeCaraCoroa> {

  int _gerarResultado(){

    var _numeroSorteado = Random().nextInt(2);

    return _numeroSorteado;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61db86),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 150),
               child:Image.asset("images/logo.png"),
              ),
              Padding(padding: EdgeInsets.only(top: 40),
                child:   GestureDetector(
                 child: Image.asset("images/botao_jogar.png"),
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultadoCaraCoroa(_gerarResultado())));
                },
              ),
              )


            ],
          ),
        ),
      ),
    );
  }
}

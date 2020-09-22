import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _nomeImgApp = AssetImage("images/padrao.png");

  var _resultadoJogo = "Escolha uma opção abaixo";

   void _opcaoSelecionada(String escolhaUsuario){


     var opcoes = ["pedra","papel","tesoura"];
     var numero = Random().nextInt(opcoes.length);
     var escolhaApp = opcoes[numero];
     print("Opção selecionada $escolhaUsuario");
     print(escolhaApp);

     switch(escolhaApp){

       case "pedra":
         setState(() {
           this._nomeImgApp = AssetImage("images/pedra.png");
         });
         break;

       case "papel":
         setState(() {
           this._nomeImgApp = AssetImage("images/papel.png");
         });
         break;

       case "tesoura":
         setState(() {
           this._nomeImgApp = AssetImage("images/tesoura.png");
         });
         break;

     }
     //Validação do ganhador
     //Usuário ganhador
     if((escolhaUsuario == "pedra" && escolhaApp == "tesoura") || (escolhaUsuario == "tesoura" && escolhaApp == "papel") || (escolhaUsuario == "papel" && escolhaApp == "pedra")){
       setState(() {
         this._resultadoJogo = "Você Venceu!";
       });
     }
     //AppGanhador
     else if((escolhaApp == "pedra" && escolhaUsuario == "tesoura") || (escolhaApp == "tesoura" && escolhaUsuario == "papel") || (escolhaApp == "papel" && escolhaUsuario == "pedra")){
       setState(() {
         this._resultadoJogo = "Você Perdeu!";
       });
     }else{
       setState(() {
         this._resultadoJogo = "EMPATE !!";
       });

     }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body:Center(
        child: Container(
          color: Colors.white,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 0, top: 20),
                child: Text("Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Image(image: this._nomeImgApp),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Text(this._resultadoJogo,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child:  Image.asset("images/pedra.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child:  Image.asset("images/papel.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap:() => _opcaoSelecionada("tesoura"),
                    child:  Image.asset("images/tesoura.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
                  )
            ],
          ) ,
        ) ,)
    );
  }
}

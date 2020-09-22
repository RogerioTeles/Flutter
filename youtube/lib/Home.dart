import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    //Lista para mudar a estrutura do body de acordo com o item da Barra inferior
    //que for clicado
    List<Widget> Telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar:AppBar(
        //Definindo a cor e opacidade dos icones da AppBar
        iconTheme:IconThemeData(
          color:Colors.grey ,
          opacity: 1,
        ),
        //Colocando uma imagem no titula da AppBar
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          //Botes da AppBar cada um com sua função.
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("Ação videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("Ação buscar");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("Ação conta");
            },
          ),
        ],
      ) ,
      body:Telas[_indiceAtual] ,

      bottomNavigationBar: BottomNavigationBar(
          //Nesse type nos definimos o tipo da barra de baixo
          // Caso seja fixed, ele terá uma cor fixa
          // O Shifting deixa todos com uma cor branca
          type: BottomNavigationBarType.fixed,
          //Cor do item selecionado
          fixedColor: Colors.red,
        backgroundColor: Colors.white,
        //O item que será selecionado
        currentIndex: _indiceAtual,

        //OnTap feito pra mudar o item selecionado de a partir do clique.
        onTap: (indice){
            setState(() {
              _indiceAtual= indice;
            });
        },
        //Items do BottomNavigationBar
        items: [
          BottomNavigationBarItem(

            title: Text("Inicio"),
            icon: Icon(Icons.home)
          ),

          BottomNavigationBarItem(
              title: Text("Em Alta"),
              icon: Icon(Icons.whatshot)
          ),

          BottomNavigationBarItem(
              title: Text("Em Alta"),
              icon: Icon(Icons.subscriptions)
          ),

          BottomNavigationBarItem(
              title: Text("Em Alta"),
              icon: Icon(Icons.folder)
          ),

        ]
      ),
    );
  }
}

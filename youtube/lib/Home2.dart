//esse home vou testar o uso da BottomNavigationBarType.shifting
import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme:IconThemeData(
          color:Colors.grey ,
          opacity: 1,
        ),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
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
      body:Container() ,
      bottomNavigationBar: BottomNavigationBar(
        //Nesse type nos definimos o tipo da barra de baixo
        // Caso seja fixed, ele terá uma cor fixa
        // O Shifting deixa todos com uma cor branca


        //AQUI A MUDANÇA ><><><><><><><><><
          type: BottomNavigationBarType.shifting,
          //Daí de acordo com que icone eu clicar e a cor que estiver definida em cada item
          // a barra ira mudar de cor


          fixedColor: Colors.white,
          backgroundColor: Colors.white,
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual= indice;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                title: Text("Inicio"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                title: Text("Em Alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                title: Text("Em Alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                title: Text("Em Alta"),
                icon: Icon(Icons.whatshot)
            ),
          ]
      ),
    );
  }
}

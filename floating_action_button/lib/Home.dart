import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body:Text("Conteúdo") ,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     /*floatingActionButton: FloatingActionButton(
       child: Icon(Icons.whatshot),
       backgroundColor: Colors.purple,
       //cor do icone
       foregroundColor: Colors.red,
       //sombra
       elevation: 6,
       //mini: true,
       onPressed: (){
         print("Floating action button pressionado");
       },
     ),*/
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        //cor do icone
        foregroundColor: Colors.white,
        //sombra
        elevation: 6,
        //mini: true,
        icon:Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
       /* shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),*/
        onPressed: (){
          print("Floating action button pressionado");
        },
      ),
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){
                print("Iconbutton");
              },
              icon: Icon(Icons.folder),
            )
          ],
        ),
      ),
    );
  }
}

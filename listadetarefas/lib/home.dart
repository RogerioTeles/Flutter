import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Conteudo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text("Carrinho"),
        icon: Icon(Icons.shop),
        //mini: false,
        /*child: Icon(Icons.add),
        onPressed: () {
          print("Floatin acttion buttom");
        },*/
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {})
          ],
        ),
      ),
    );
  }
}

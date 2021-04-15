import 'package:flutter/material.dart';


class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegação"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/secundaria");
                },
                child: Text("ir para a segunda tela"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Contato"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:20,left: 10),
                    child: Image.asset("images/detalhe_contato.png",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                    child:Text("Contato",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    )
                    ,)

                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20) ,
                child: Text("atendimento@atmconsultoria.com.br"),
              ),
              Padding(padding: EdgeInsets.only(top: 20) ,
                child: Text("Telefone: (11) 3525-8596"),
              ),
              Padding(padding: EdgeInsets.only(top: 20) ,
                child: Text("Celular: (11) 99586-5236"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

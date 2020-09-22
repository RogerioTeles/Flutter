import 'package:flutter/material.dart';
class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Clientes"),
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
                    child: Image.asset("images/detalhe_cliente.png",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                    child:Text("Clientes",
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
                child: Image.asset("images/cliente1.png"),
              ),
              Text("Empresa de Software"),
              Padding(padding: EdgeInsets.only(top: 20) ,
                child: Image.asset("images/cliente2.png"),
              ),
              Text("Emrpesa de Auditoria"),
            ],
          ),
        ),
      ),
    );
  }
}

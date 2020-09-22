import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Serviços"),
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
                    child: Image.asset("images/detalhe_servico.png",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                    child:Text("Nossos serviços",
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
                child: Text("Consultoria"),
              ),
              Padding(padding: EdgeInsets.only(top: 20) ,
                child: Text("Cálculo de preços"),
              ),
              Padding(padding: EdgeInsets.only(top: 20) ,
                child: Text("Acompanhamento de projetos"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  bool _valor = false;
  bool _valor2 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Entrada de Dados") ,
      ) ,
      body: Container(
        child: SingleChildScrollView(
          child:Padding(padding: EdgeInsets.all(32),
            child:Column(
            children: <Widget>[

             CheckboxListTile(
               value: _valor,
               title:  Text("Comida Brasileira"),
               subtitle: Text("A melhor comida do mundo"),
               activeColor: Colors.black,
               secondary: Icon(Icons.add_box),
               selected: true,
               onChanged:
               (bool valor){
                 setState(() {
                   _valor = valor;
                 });
               },

             ),

              CheckboxListTile(
                value: _valor2,
                title:  Text("Comida Mexicana"),
                subtitle: Text("A melhor comida do mundo"),
                activeColor: Colors.black,
                secondary: Icon(Icons.assistant_photo),
                selected: true,
                onChanged:
                    (bool valor){
                  setState(() {
                    _valor2 = valor;
                  });
                },
              ),
             RaisedButton(
               child: Text("Salvar",
               style: TextStyle(
                 fontSize: 20,
               ),
               ),
               onPressed: (){
                 print(
                   " Comida Brasileira: "+_valor.toString()+
                     " Comida Mexicana "+_valor2.toString()
                 );
               },
             )
            ],
          ),
          )
        ),
      ) ,
    );
  }
}

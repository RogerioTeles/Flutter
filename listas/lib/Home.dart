import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens =[];

  void _carregarItens(){
    _itens =[];
    for(int i=0; i <=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição ${i} ipsum dolor sit amet. ";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (context, indice){
              Map<String, dynamic> item = _itens[indice];
              return ListTile(
                title: Text("${item["titulo"].toString()}"),
                subtitle: Text("${item["descricao"].toString()}"),
                onTap: (){
                  showDialog(
                      context: context,
                    builder: (context){
                        return AlertDialog(
                          title: Text("${item["titulo"].toString()}"),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                          ),
                          content: Text("${item["descricao"].toString()}"),
                          backgroundColor: Colors.white,
                          actions: <Widget>[
                            FlatButton(
                              onPressed:(){
                                Navigator.pop(context);
                              } ,
                              child: Text("Sim"),
                            ),
                            FlatButton(
                              onPressed:(){
                                Navigator.pop(context);
                              } ,
                              child: Text("Não"),
                            ),
                          ],
                        );
                    }
                  );
                }
              );
            }
        ),
      ),
    );
  }
}

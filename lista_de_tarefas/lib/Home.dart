import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _textEditingControllerDescricao = new TextEditingController();
  //TextEditingController _textEditingControllerDescricao = new TextEditingController();

  List _itens = [];

  void _adicionarItens(){
    _itens.add(_textEditingControllerDescricao.text.toString());

}
  void _itemInicial(){
    _itens.add("Exemplo de item");
    _itens.add("Exemplo de item");
  }


  @override
  Widget build(BuildContext context) {
    _itemInicial();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Adicionar nova tarefa"),
                          content:TextField(
                            controller: _textEditingControllerDescricao,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Descrição da tarefa",
                            ),
                          ),

                          actions: <Widget>[
                            FlatButton(
                              onPressed:_adicionarItens ,
                              child: Text("Adicionar"),
                            ),
                            FlatButton(
                              onPressed:(){
                                Navigator.pop(context);
                              } ,
                              child: Text("Cancelar"),
                            )
                          ],

                        );
                      }
                  );
                },
                child:  Text("Adicionar Novo"),
              ),
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, indice){
                    return ListTile(
                      title: Text("Tarefa"),
                      subtitle: Text(_itens[indice].toString()),
                      onTap: (){

                      },
                    );
                  }

              )

            ],
          ),
        ),
    );
  }
}

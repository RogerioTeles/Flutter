import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();
  Future<File> _getFile() async {
    //Pega o caminho do arquivo
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });
    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    //convertendo e salvando o arquivo
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
    //print("Caminho" + diretorio.path);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Vai iniciar o app recuperando as tarefas do arquivo e
    //decodando elas do json
    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("Listas" + _listaTarefas.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista da Procrastinação"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                  title: Text(
                    "Adicionar Tarefa",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(
                      labelStyle: new TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      labelText: "Digite sua tarefa",
                    ),
                    onChanged: (text) {},
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.purple),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.purple),
                      ),
                      onPressed: () {
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: (context, index) {
                    final key = _listaTarefas[index].toString();
                    return Card(
                      shadowColor: Colors.purple,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Dismissible(
                          background: Container(
                            padding: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.delete, color: Colors.white)
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          child: CheckboxListTile(
                              activeColor: Colors.purple,
                              dense: true,
                              title: new Text(
                                _listaTarefas[index]['titulo'],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5),
                              ),
                              //pxua o valor do indice da tarefa e seu status atual
                              value: _listaTarefas[index]['realizada'],
                              secondary: Container(
                                height: 50,
                                width: 50,
                              ),
                              onChanged: (valorAlterado) {
                                //Ao clicar no check box ele atualiza o arquivo para deixar toppp
                                setState(() {
                                  _listaTarefas[index]['realizada'] =
                                      valorAlterado;
                                });
                                _salvarArquivo();
                              }),
                          key: Key(key),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            _ultimaTarefaRemovida = _listaTarefas[index];

                            if (direction == DismissDirection.startToEnd) {
                              setState(() {
                                _listaTarefas.removeAt(index);
                              });
                              _salvarArquivo();
                            }

                            //snackbar
                            final snackbar = SnackBar(
                              content: Text(
                                "Tarefa Removida",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.purple,
                              duration: Duration(seconds: 5),
                              action: SnackBarAction(
                                label: "Desfazer",
                                textColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _listaTarefas.insert(
                                        index, _ultimaTarefaRemovida);
                                  });
                                  _salvarArquivo();
                                },
                              ),
                            );

                            // ignore: deprecated_member_use
                            Scaffold.of(context).showSnackBar(snackbar);
                          },
                        ),
                      ),
                    );

                    /*
                    return ListTile(
                      title: Text(_listaTarefas[index]['titulo']),
                    );*/
                  })),
        ],
      ),
    );
  }
}

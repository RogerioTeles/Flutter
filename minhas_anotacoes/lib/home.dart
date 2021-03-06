import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/Model/Anotacao.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
//importação para formatação de data
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();

  TextEditingController _descricaoController = TextEditingController();
  var _db = AnotacaoHelper();
  // ignore: deprecated_member_use
  List<Anotacao> _anotacoes = List<Anotacao>();

  //parametro opicional
  _exibirTelaCadastro({Anotacao anotacao}) {
    //essa mesma tela abre tanto pra salvar, quanto pora editar uma anotação
    String textoSalvarAtualizar = "";

    if (anotacao == null) {
      //salvando uma anotacao
      _tituloController.text = "";
      _descricaoController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar antoação
      _tituloController.text = anotacao.titulo;
      _descricaoController.text = anotacao.descricao;
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar Anotação",
                style: GoogleFonts.aBeeZee()),
            content: Column(
              //Dimensiona a box com o que tem dentro
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Título",
                    hintText: "Digite o Título",
                  ),
                  maxLines: null,
                ),
                TextField(
                  controller: _descricaoController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                    hintText: "Digite a descrição",
                  ),
                  maxLines: null,
                ),
              ],
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar", style: GoogleFonts.aBeeZee()),
                // ignore: deprecated_member_use
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  //Ao clicar vai chamar o método de cadastro dos dados e levar pro
                  //banco de dados.
                  //passando parametro opicional para edição
                  _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                  Navigator.pop(context);
                },
                child: Text("$textoSalvarAtualizar"),
              ),
            ],
          );
        });
  }

// Método p/ salvar a anotação no banco, ela retorna o ID da anotação.
  _salvarAtualizarAnotacao({Anotacao anotacaoSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    if (anotacaoSelecionada == null) {
      Anotacao anotacao =
          Anotacao(titulo, descricao, DateTime.now().toString());
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();
      var resultado = await _db.alterarAnotacao(anotacaoSelecionada);
    }
    //print("data atual:" + DateTime.now().toString());

    //print("Resultado:" + resultado.toString());
    //limpar os campos
    _tituloController.clear();
    _descricaoController.clear();
// trazer a lista de volta
    _recuperarAnotacoes();
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();

    // ignore: deprecated_member_use
    List<Anotacao> listaTemporaria = List<Anotacao>();
    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }
    setState(() {
      _anotacoes = listaTemporaria;
    });
  }

  _deletarAnotacao(Anotacao anotacao) async {
    if (anotacao != null) {
      var apagar = await _db.apagarAnotacao(anotacao);
    }
  }

  _confirmarDeletar(Anotacao anotacao) {
    _deletarAnotacao(anotacao);

    _recuperarAnotacoes();
  }

  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
    //colocando a data no formato dia/mes/ano
    var formater = DateFormat("d/M/y");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formater.format(dataConvertida);
    return dataFormatada;
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anotações",
          style: GoogleFonts.aBeeZee(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _anotacoes.length,
            itemBuilder: (context, index) {
              final anotacao = _anotacoes[index];
              // final key = _anotacoes[index].id;
              return Card(
                  color: Colors.white,
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            )
                          ]),
                    ),
                    child: ListTile(
                      title: Text(anotacao.titulo,
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      subtitle: Text(
                        anotacao.descricao +
                            " - " +
                            _formatarData(anotacao.data),
                        style: GoogleFonts.aBeeZee(),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _exibirTelaCadastro(anotacao: anotacao);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                          ),
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      //no dismissible não precisa do setstate
                      if (direction == DismissDirection.startToEnd) {
                        _confirmarDeletar(anotacao);
                      }
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Confirmar remoção",
                                  style: GoogleFonts.aBeeZee()),
                              content: Text(
                                  "Você tem certeza que deseja apagar essa anotação?",
                                  style: GoogleFonts.aBeeZee()),
                              actions: <Widget>[
                                Row(
                                  children: <Widget>[
                                    // ignore: missing_required_param
                                    // ignore: deprecated_member_use
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: Text("Cancelar",
                                          style: GoogleFonts.aBeeZee()),
                                    ),
                                    // ignore: deprecated_member_use
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      child: Text("Apagar",
                                          style: GoogleFonts.aBeeZee()),
                                    ),
                                  ],
                                )
                                // ignore: deprecated_member_use
                              ],
                            );
                          });
                    },
                  ));
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          //Ao clicar, vai abrir o dialog de cadastro de anotação.
          _exibirTelaCadastro();
        },
      ),
    );
  }
}

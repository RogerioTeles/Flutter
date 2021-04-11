import 'package:minhas_anotacoes/Model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {
  //varíavel que guarda o nome da tabela pra impedir erros
  static final String nomeTabela = "anotacao";
  //instância única da classe
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();

  Database _db;

//Construtor usando o singletons pattern
  factory AnotacaoHelper() {
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal() {}

//Valida se a tabela ja foi criada, se não ele cria.
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

//CRIAR A TABELA
  _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE $nomeTabela (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo VARCHAR, descricao TEXT, data DATETIME)";
    await db.execute(sql);
  }

//INICIALIZA BANCO DE DADOS CASO NAO EXISTA
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_anotacoes.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

//Método pra salvar anotação no banco a partir dos dados vindos do front
  Future<int> salvarAnotacao(Anotacao anotacao) async {
    //usando o metodo get db
    var bancoDados = await db;
    int idRetornado = await bancoDados.insert(nomeTabela, anotacao.toMap());
    return idRetornado;
  }

  recuperarAnotacoes() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC";
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future<String> alterarAnotacao(Anotacao anotacao) async {
    //usando o metodo get db
    var bancoDados = await db;
    try {
      return await bancoDados.update(nomeTabela, anotacao.toMap(),
          where: "id = ?", whereArgs: [anotacao.id]);
    } catch (msgErro) {
      return ("Falha ao tentar deletar banco de dados:" + msgErro);
    }
  }

  Future<void> apagarAnotacao(Anotacao anotacao) async {
    //usando o metodo get db
    var bancoDados = await db;
    try {
      String tituloAnotacao = anotacao.titulo.toString();
      await bancoDados
          .delete(nomeTabela, where: "id = ?", whereArgs: [anotacao.id]);
      return ("Anotação " + tituloAnotacao + " deletada com sucesso.");
    } catch (msgErro) {
      return ("Falha ao tentar deletar banco de dados:" + msgErro);
    }
  }

  /* Future<String> deletarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    int teste = await bancoDados.delete();
  }*/
}

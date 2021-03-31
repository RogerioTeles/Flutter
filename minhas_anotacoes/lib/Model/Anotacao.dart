//Classe Anotação que é usada pra criar o OBJETO anotação
class Anotacao {
  int id;
  String titulo;
  String descricao;
  String data;

//Construtor que pega todos os dados na hora do cadastro
  Anotacao(this.titulo, this.descricao, this.data);

//ma hora de salvar no banco, esse metodo é chamado pra salvar no banco
  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "descricao": this.descricao,
      "data": this.data
    };
    //caso exista um ID
    if (this.id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}

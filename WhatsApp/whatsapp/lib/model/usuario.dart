class Usuario {
  String nome;
  String email;
  String senha;

  Usuario();

  //Retorna  um map para cadastrar informações de usuários no Firebase.
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"nome": this.nome, "email": this.email};

    return map;
  }

  get getNome => this.nome;

  set setNome(nome) => this.nome = nome;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getSenha => this.senha;

  set setSenha(senha) => this.senha = senha;
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/*Para importar esse pacote primeiro é necessário ir no pubspec e abaixo do
* cupertino icons, definir a versao do http que nesse caso é : http: ^0.12.0+1
* para que depois possamos importar esse pacote.
* obs: só funciona se declarar.*/
import 'dart:convert';
//Esse import serve para convertermos os dados que recebemos da API
import 'dart:async';
//Importamos a biblioteca async para que possamos usá-la posteriomente pois o
// tempo de resposta das APIs pode ser assícrona entao pode demorar algum tepo
// para termos essa resposta.
import 'Post.dart';
//Importando todas as dependecias que usei nesse projeto

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Variável declarada para guardar a url base da API.
  String _urlBase = "https://jsonplaceholder.typicode.com";

  /*Método do tipo future que retorna uma lista do tipo post
    que vai recuperar todas as postagens da API*/
  Future<List<Post>> _recuperarPostagens() async{

    /*Aqui usamos a classe Response, que está dentro de http,
    * e aqui conseguimos recuperar os dados da WEB com o método GET
    * onde vamos passar a url e os dados dela serao resgatados,
    * nesse caso mais uma parte da URL foi adicionada "/posts"
    * para que as postagens fossem resgatadas.*/
    http.Response response = await http.get(_urlBase + "/posts");
    //O jsonDecode vai converter os dados de uma STRING para um objeto Json
    // e depois pode ser armazenada em um MAP.

    var dadosJson = jsonDecode(response.body);

    //Criou uma lista para guardar todas as postagens
    List<Post> postagens = List();
    /*Vamos varrer todo o dadosJson e depois
    * adicionar cada postagem do tipo POST na lista
    * postagens. */
    for(var post in dadosJson){
      //Armazenando cada item do Json no Objeto post pelo construtor.
      Post p = Post(post["userid"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    //Após todas as postages serem adicionadas, retornamos a lista para ser utilizada
    //no future.
    return postagens;
  }



  @override
  Widget build(BuildContext context) {
    //Iniciamos uma estrutura padrão.
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      //retornamos o Future Builder que é uma forma mais avançada de usar as
      //APIs
      body:FutureBuilder<List<Post>>(
        //Intanciamos aqui o método anterior que recupera as postagens, lembrando que
        //ela é do tipo future.
        future: _recuperarPostagens(),
        // ignore: missing_return
        builder: (context, snapshot){
        //E aqui fazemos o builder.
          //Nesse switch verificamos a conexao e damos a ordem de acordo com a ação.
          switch(snapshot.connectionState){
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
              break;
              //Se a conexão for estabelecida de forma correta, tal coisa é feita.
            case ConnectionState.done:
              print("conexao done");
              if (snapshot.hasError){

              }else{
                  print("Lista carregou");
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                      itemBuilder: (context, index){


                      List<Post> lista = snapshot.data;
                      Post post = lista[index];

                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.id.toString()),
                      );
                      },
                    );
              }
              break;
          }
        },
      ) ,
    );
  }
}

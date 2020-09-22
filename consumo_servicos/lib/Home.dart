import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  String _resultado = "Resultado";
  TextEditingController _controllerCep = TextEditingController();

  //Comunicação síncrona e assíncrona
  //Sincrona - resposta instantanea
  //Assincrona - Mensagem no wpp e a pessoa precisa de tempo para processar a mensagem
  // e só depois ela responde.

  //Como não sabemos quanto tempo o servidor vai demorar para responder a nossa requisição
  //colocamos o async pois é assincrona
  _recuperarCep() async{

    String cep = _controllerCep.text;
    String url = "http://viacep.com.br/ws/${cep}/json/";
    http.Response response;
    /*
    * Colocamos o await pois vamos esperar essa execução.
    * */
    response = await http.get(url);
    /*Esse map vai transformar o Json em um jeito que a gente possa pegar os dados pelas tags deles*/
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    print("Rua: "+logradouro);
    print("complemento: "+complemento);
    print("bairro: "+bairro);
    print("localidade: "+localidade);

    setState(() {
      _resultado = "${logradouro}, ${complemento}, ${bairro} , ${localidade}";
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web")
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number ,
              decoration: InputDecoration(
                labelText: "Digite o CEP EX: 05428200"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep
            ),
            RaisedButton(
              child: Text("Clique aqui") ,
              onPressed: _recuperarCep,
            ),
            Padding(padding: EdgeInsets.only(top: 30),
             child: Text(_resultado,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            )


          ],
        ),
      ),
    );
  }
}

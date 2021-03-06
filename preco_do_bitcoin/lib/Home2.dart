import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Para usar a API é necessário importar os seguintes itens:
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class HomeBitcoin extends StatefulWidget {
  @override
  _HomeBitcoinState createState() => _HomeBitcoinState();
}

class _HomeBitcoinState extends State<HomeBitcoin> {

  String _valorBitCoin = "00,00";

  Future<String> _recuperarPrecoBit() async{
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
    Map<String, dynamic> preco = jsonDecode(response.body);
    return preco["BRL"]["buy"].toString();
  }

  void _recuperarPreco() async{

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    print("Resultado" + retorno["BRL"]["buy"].toString());
    setState(() {
      _valorBitCoin = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child:Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/bitcoin.png"),
              FutureBuilder<String>(
                future: _recuperarPrecoBit(),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.done:
                      if (snapshot.hasError){
                      }else{
                        return Padding(
                          padding: EdgeInsets.only(top: 30,bottom: 30),
                          child: Text("R\$ "+snapshot.data.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        );

                      }
                      break;
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator(),);
                      break;
                    case ConnectionState.none:
                    case ConnectionState.active:



                  }
                },
              ),
              /* Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 30),
                  child: Text("R\$ "+_valorBitCoin,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),*/

              RaisedButton(
                onPressed: _recuperarPreco,
                child: Text("Atualizar",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                color:Colors.orange ,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

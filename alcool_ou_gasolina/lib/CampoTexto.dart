import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingControllerAlcool = new TextEditingController();
  TextEditingController _textEditingControllerGasolina = new TextEditingController();
  String _mensagemCalculo = "";

  void _calcular(){

    //convertendo do tipo string pra double.
    double precoAlcool = double.tryParse(_textEditingControllerAlcool.text);
    double precoGasolina = double.tryParse(_textEditingControllerGasolina.text);

    if ((precoAlcool == null) || (precoGasolina == null)) {
    setState(() {
      _mensagemCalculo = "Número inválido, digite números maiores que 0 e utilizando (.)";
    });
    }else{

      if((precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _mensagemCalculo = "Melhor abastecer com Gasolina";
        });
      }else{
        setState(() {
          _mensagemCalculo = "Melhor abastecer com Álcool";
        });
      }

      _limparCampos();
    }
  }
  void _limparCampos(){
    _textEditingControllerAlcool.text = "";
    _textEditingControllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        //Esse  SingleChildScrollView faz com que possamos fazer os croll na tela
          child: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Image.asset("images/logo1.png"
                    // fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: _textEditingControllerAlcool,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço Alcool ex:1.59",
                    ),
                    style: TextStyle(
                      color: Colors.black ,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: _textEditingControllerGasolina,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço Gasolina ex:3.59",
                    ),
                    style: TextStyle(
                      color: Colors.black ,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: RaisedButton(
                    child: Text("Calcular",
                      style: TextStyle(
                        fontSize: 20 ,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color:Colors.blue ,
                    padding: EdgeInsets.all(15),
                    onPressed: () => _calcular(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(_mensagemCalculo,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ) ,
          ),
        ),
    );
  }
}

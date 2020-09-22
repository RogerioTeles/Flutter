import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double _valor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada dados"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
            Padding(padding: EdgeInsets.all(60),
              child: Slider(value: _valor,
              min:0 ,
              max: 10,
              label: "Valor Selecionado"+_valor.toString(),
              divisions: 5,
              activeColor: Colors.blue,
              inactiveColor: Colors.deepPurple,
              onChanged: (double novoValor){
              setState(() {
                _valor = novoValor;
              });
              }
            )
            ),
              RaisedButton(
                child: Text("Salvar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: (){
                  print("Resultado 1° switch = "+ _valor.toString() );
                },
              ),


            ],
          ),
        ),
      ) ,
    );
  }
}

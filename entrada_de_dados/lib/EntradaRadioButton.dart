import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario;
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
            RadioListTile(value: "M",
                  title: Text("Masculino"),
                  groupValue: _escolhaUsuario,
                  onChanged:  (String escolha){
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                  }
              ),
              RadioListTile(value: "F",
                  title: Text("Feminino"),
                  groupValue: _escolhaUsuario,
                  onChanged:  (String escolha){
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                  }
              ),
              RaisedButton(
                child: Text("Salvar",
                style: TextStyle(
                fontSize: 20,
                ),
                ),
                onPressed: (){
                  print("Resultado = "+ _escolhaUsuario );
                },
              ),


              /*
              Text("Masculino"),
              Radio(value: "M",
                  groupValue: _escolhaUsuario,
                  onChanged:  (String escolha){
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                    print("Resultado : "+escolha);
                  }
              ),
              Text("Feminino"),
              Radio(value: "F",
                  // groupvalue vai guardar o value do item selecionado
                  groupValue: _escolhaUsuario,
                  onChanged: (String escolha){
                //Esse set state que vai definir a marcação
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                  print("Resultado : "+escolha);
                  }
              ),*/
            ],
          ),
        ),
      ) ,
    );
  }
}

import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;
  bool _escolhaUsuarioConfig = false;
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

              SwitchListTile(title: Text("Receber Notificações"),value: _escolhaUsuario, onChanged: (bool a){
                setState(() {
                  _escolhaUsuario = a;
                });
              },
              ),
              SwitchListTile(title: Text("Carregar imagens automaticamente"),
                value: _escolhaUsuarioConfig,
                activeColor: Colors.red,
                onChanged: (bool a){
                setState(() {
                  _escolhaUsuarioConfig = a;
                });
              },
              ),
              RaisedButton(
                child: Text("Salvar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: (){
                  print("Resultado 1° switch = "+ _escolhaUsuario.toString() );
                  print("Resultado 2° switch = "+ _escolhaUsuarioConfig.toString() );
                },
              ),

           /*
            Switch(value: _escolhaUsuario,
              onChanged: (bool a){
                setState(() {
                  _escolhaUsuario = a;
                });
              },
            ),
              Text("Receber Notificação"),*/
            ],
          ),
        ),
      ) ,
    );
  }
}

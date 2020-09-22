
import 'package:atm_consultoria/TelaCliente.dart';
import 'package:atm_consultoria/TelaContato.dart';
import 'package:atm_consultoria/TelaEmpresa.dart';
import 'package:atm_consultoria/TelaServico.dart';
import 'package:flutter/material.dart';

class IndexATM extends StatefulWidget {

  @override
  _IndexATMState createState() => _IndexATMState();
}

class _IndexATMState extends State<IndexATM> {
  void _abrirEmpresa(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=> TelaEmpresa()));
  }
  void _abrirServicos(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> TelaServico()));
  }
  void _abrirClientes(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> TelaCliente()));
  }
  void _abrirContato(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> TelaContato()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria",
          style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo.png"),
                Padding(padding: EdgeInsets.only(top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(onTap:_abrirEmpresa,
                        child: Image.asset("images/menu_empresa.png"),
                      ),
                      GestureDetector(onTap:_abrirServicos,
                        child: Image.asset("images/menu_servico.png"),
                      ),

                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap:_abrirClientes,
                        child: Image.asset("images/menu_cliente.png"),
                      ),
                      GestureDetector(onTap:_abrirContato,
                        child: Image.asset("images/menu_contato.png"),)

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}





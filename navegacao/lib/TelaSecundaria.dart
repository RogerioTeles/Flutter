import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {


  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
            Text("Segunda Tela!")
            ],
          ),
        ),
      ),
    );
  }
}

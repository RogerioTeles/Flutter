import 'package:flutter/material.dart';

class Inscricao extends StatefulWidget {
  @override
  _InscricaoState createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Inscrições",
        style: TextStyle(
            fontSize: 25
        ),
      ),
    );
  }
}

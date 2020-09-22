import 'package:flutter/material.dart';
import 'package:navegacao/TelaPrincipal.dart';
import 'package:navegacao/TelaSecundaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
   routes: {
      "/secundaria" : (context) => TelaSecundaria(),
   },
   home:TelaPrincipal(),
  )
  );
}


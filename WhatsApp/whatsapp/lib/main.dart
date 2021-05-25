import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/home.dart';
import 'package:whatsapp/routeGenerator.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(
          //mudando a cor das bordas do campo textfield
          primaryColor: Color(0xff075E54),
          accentColor: Color(0xff25D366)),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}

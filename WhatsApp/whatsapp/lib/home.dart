import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/login.dart';
import 'package:whatsapp/routeGenerator.dart';

import 'telas/contatos.dart';
import 'telas/conversas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> itensMenu = ["Configurações", "Deslogar"];

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Configurações":
        print("Configurações");
        break;
      case "Deslogar":
        _deslogarUsuario();
        break;
    }
    //print("Item Escolhido" + itemEscolhido);
  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    //User usuariologado = auth.currentUser;
    //usuariologado = null;
    Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.green,
          labelColor: Colors.white,
          controller: _tabController,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          tabs: <Widget>[
            Tab(
              text: "Conversas",
            ),
            Tab(
              text: "Contatos",
            )
          ],
        ),
        actions: <Widget>[
          //Criando o menu lateral com os itens
          PopupMenuButton<String>(
            itemBuilder: (context) {
              //retorna uma lista
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: _escolhaMenuItem,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Conversas(), Contatos()],
      ),
    );
  }
}

import 'package:aprenda_ingles/telas/bichos.dart';
import 'package:aprenda_ingles/telas/numeros.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//controller
  TabController _tabController;

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
          title: Text("Aprenda Inglês"),
          //backgroundColor: Colors.brown,
          bottom: TabBar(
            indicatorWeight: 4,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            //unselectedLabelColor: Colors.white12,
            labelStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "Animals",
                //icon: Icon(),
              ),
              Tab(
                text: "Numbers",
                //icon: Icon(),
              ),
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          Bichos(),
          Numeros(),
        ]));
  }
}

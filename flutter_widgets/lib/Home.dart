import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaNomes = ["teste1","teste2","teste 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Widgets"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listaNomes.length,
              itemBuilder: (context, index){

                final item = _listaNomes[index].toString();

                return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.edit)
                      ],
                    ),

                  ),
                  secondaryBackground: Container(
                    color:Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.delete, color: Colors.white,),
                      ],
                    ),
                  ),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){

                    if(direction == DismissDirection.endToStart){
                      print("Direção End to start");
                      setState(() {
                        _listaNomes.removeAt(index);
                      });
                    }else if(direction == DismissDirection.startToEnd){
                      print("Direção start to end");
                    }
                  },

                  key: Key(item),
                  child: ListTile(
                    title: Text("item"),
                  ),
                );
              },
            ),
          ),
        ],
      ) ,
    );
  }
}

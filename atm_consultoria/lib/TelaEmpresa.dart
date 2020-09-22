import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Empresa"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:20,left: 10),
                    child: Image.asset("images/detalhe_empresa.png",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20),
                    child:Text("Sobre a empresa",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    )
                    ,)

                ],
              ),
              Padding(padding: EdgeInsets.all(20) ,
               child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas neque dui, cursus pharetra dictum ut, mollis eu justo. Nam rutrum eu metus sed accumsan. Sed faucibus nec neque quis feugiat. In hac habitasse platea dictumst. Mauris aliquam vel urna nec iaculis. Suspendisse a elit sed odio eleifend fringilla ut semper sem. Etiam non tortor sit amet ipsum volutpat interdum."
                  "Duis gravida, dui vel placerat lobortis, diam nunc aliquet orci, ac volutpat ante metus sit amet arcu. Suspendisse id nisi neque. Aenean sed libero vitae justo condimentum tincidunt. Curabitur congue, nunc vel viverra tincidunt, enim purus finibus tellus, dictum bibendum erat justo et diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum in dapibus eros, posuere vestibulum lorem. Nullam ullamcorper velit sed arcu tempor semper. Nulla feugiat non lorem ut viverra."
                  "Aenean ullamcorper ullamcorper tellus sed ultrices. Curabitur pellentesque tortor nec massa pharetra auctor. Quisque suscipit lorem et fermentum feugiat. Nulla eu ligula ac mi congue vulputate. Suspendisse vel nisi blandit erat bibendum porttitor et sed mauris. Suspendisse rhoncus pharetra vulputate. Pellentesque vitae iaculis eros. Proin at lorem vel massa imperdiet interdum porta nec libero. Duis nec maximus libero. Donec arcu elit, commodo congue semper id, luctus eu nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce sed ante porttitor, pretium purus ut, consectetur tellus."
                   "Fusce sit amet lacinia est. Maecenas pulvinar interdum sem, non sollicitudin felis feugiat nec. Sed metus massa, dignissim quis fermentum at, accumsan vestibulum ante. Cras interdum nisl eget magna condimentum blandit. Sed luctus quam at imperdiet pretium. Donec dui eros, rutrum eu leo et, faucibus imperdiet sem. Vestibulum nec quam vitae dolor vestibulum viverra eu gravida dolor."
                   "Ut et metus varius, aliquet tortor in, viverra velit. Duis at eros orci. In eu ultrices ante. Cras bibendum imperdiet sapien ut pulvinar. Pellentesque suscipit bibendum tellus quis suscipit. Morbi nec est sit amet sem placerat tempor ac non elit. Nullam imperdiet et massa vitae blandit."
               ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

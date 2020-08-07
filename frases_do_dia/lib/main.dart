import 'package:flutter/material.dart';
import 'dart:math';

void main(){

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home2(),
  ));
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}


class _Home2State extends State<Home2> {


  //Array de frases
  var _frases =  [
    "A persistência é o caminho do êxito.",
    "As pessoas costumam dizer que a motivação não dura sempre. Bem, nem o efeito do banho, por isso recomenda-se diariamente.",
    "Motivação é a arte de fazer as pessoas fazerem o que você quer que elas façam porque elas o querem fazer.",
    "Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.",
    "Lute. Acredite. Conquiste. Perca. Deseje. Espere. Alcance. Invada. Caia. Seja tudo o quiser ser, mas acima de tudo, seja você sempre.",
    "Pedras no caminho? Eu guardo todas. Um dia vou construir um castelo.",
    "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado."
  ];
  //Frase principal.
  var _fraseGerada = "CLQUE NO BOTÃO PARA TER SUA FRASE DO DIA";

  void _gerarFrase(){
    /*
    * Esse método vai sortear a frase a ser escolhida.
    * Foi preciso importar pacorte Dart.math pra podermos usar o Random e tal
    * Mas depois disso é bem simples, o Random vai pegar um numero aleatório de acordo com a quantidade
    * estabelecida do NextInt, você pode usar o frases.length ou a quantidade de frases que você colocou no
    * array.
    *Depois disso abrimos o setstate pois ele quem vai ser responsável pela mudança de estado da frase e atribuimos a frase ao valor sorteado
    * anteriormente quando o usuário clicar no botão.
    * */
    var numeroSorteado = Random().nextInt(_frases.length);
    print(numeroSorteado);

    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Frases Do Dia"),
        backgroundColor: Colors.green,

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 3,color: Colors.white)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          /*EsseMainaxisalingment vai separar os itens distribuidos na coluna um do outro
          crossAxisAlignment: CrossAxisAlignment.center,
          No momento em que foi colocado isso, o alinhamento do eixo não deixou o container ocupando todo o
          espaço, portanto é preciso fazer outra coisa, adicionar um width que é igual a double.infinity que é = a 100% do espaço disponível.
          -Outra alternativa é instanciar uma classe Center antes do Container e colocá-lo como child dele.
         home: Center(
          child: Container(
          )
          )
          */
          children: <Widget>[
            Image.asset("images/logo.png"),
            Text(_fraseGerada,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.black
            ),
            ),
            RaisedButton(
              child: Text(
                  "Nova Frase",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.green,
              onPressed: _gerarFrase,
            ),

          ],
        ),
      )

    );
  }
}


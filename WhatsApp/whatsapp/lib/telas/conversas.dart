import 'package:flutter/material.dart';
import 'package:whatsapp/model/conversa.dart';

class Conversas extends StatefulWidget {
  @override
  _ConversasState createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {
  List<Conversa> listaConversas = [
    Conversa("José Renato", "Olá, Tudo Bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-124c9.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=c5796702-9171-42f0-a3c4-7af54e326ee2"),
    Conversa("Pedro", "Oi sumido",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-124c9.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=3d971066-d9db-42bc-9047-a11ed183f9c0"),
    Conversa("Ana Clara", "Está livre hoje",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-124c9.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=edfd2cdf-2c1f-4d47-81d5-510204e3946e"),
    Conversa("Eduardo", "Preciso de um dinheiro",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-124c9.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=e9a65671-4b71-431e-bb15-78a581ed8631"),
    Conversa("Maria José", "Como vai?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-124c9.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=e8d63783-3935-4532-ad9b-894d1d626792"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaConversas.length,
      itemBuilder: (context, index) {
        Conversa conversa = listaConversas[index];

        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(conversa.caminhoFoto),
          ),
          title: Text(
            conversa.nome,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            conversa.mensagem,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}

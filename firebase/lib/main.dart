import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() async {
  //inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final picker = ImagePicker();

  File _imagem;
  String _statusUpload = "Upload não iniciado";
  String _imagemRecuperada = null;

  Future _recuperarImagem(bool daCamera) async {
    PickedFile imagemSelecionada;
    if (daCamera) {
      // ignore: invalid_use_of_visible_for_testing_member
      imagemSelecionada = await picker.getImage(source: ImageSource.camera);
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      imagemSelecionada = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = File(imagemSelecionada.path);
    });
  }

  _uploadImagem() async {
    //referenciar arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    //fazer upload da imagem.
    StorageUploadTask task = arquivo.putFile(_imagem);

    //controlar o progresso to upload
    task.events.listen((StorageTaskEvent storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = "Upload realizado com sucesso";
        });
      }
    });

    //recuperar url da imagem
    task.onComplete.then((storageTaskSnapshot) {
      _recuperarUrlImagem(storageTaskSnapshot);
    });
  }

  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    print(url);
    setState(() {
      _imagemRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar Imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(_statusUpload),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                _recuperarImagem(true);
              },
              child: Text("Camera"),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                _recuperarImagem(false);
              },
              child: Text("Galeria"),
            ),
            _imagem == null ? Container() : Image.file(_imagem),
            _imagem == null
                ? Container()
                :
                // ignore: deprecated_member_use
                RaisedButton(
                    onPressed: () {
                      _uploadImagem();
                    },
                    child: Text("Upload Storage"),
                  ),
            _imagemRecuperada == null
                ? Container()
                : Image.network(_imagemRecuperada)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;

  //Inicialização do vídeo
  @override
  void initState() {
    super.initState();
    /* _controller = VideoPlayerController.network(
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4")
      ..initialize().then((_) {
        setState(() {
          //ao iniciar ele vai executar o vídeo
          _controller.play();
        });
      });*/

    //..initialize()
    //Queremos chamar o método initialize e ao mesmo tempo atribuir ao item controller
    //porém o initialize retorna void, enquanto o controller precisa de um objeto
    //portanto usando os dois pontos, o retorno do initialize é desconsiderado e
    //o que é atribuido controller é um obj videoplayercontroller;
    //
    //then((_) {}) = > Vai passar um parâmetro vazio que não ocupa espaço na
    //memória.
    _controller = VideoPlayerController.asset("assets/videos/video.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        // _controller.play();
      });
  }

//interface para execução do vídeo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reproduzindo Vídeos"),
      ),
      body: Center(
        //É utilizado o _controller.value.isInitialized para verificar
        //se o vídeo já foi iniciado.
        //Usamos um operador ternário, nesse caso o "?" e o ":"
        //onde o "?" representa o true e o ":" representa o false.
        //
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Text("Pressione Play"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

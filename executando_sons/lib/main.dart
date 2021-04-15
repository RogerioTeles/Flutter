import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

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
  AudioPlayer audioPlayer = AudioPlayer();
  final AudioCache audioCache = AudioCache();
  bool primeiraExecucao = true;
  double volume = 0.5;

  _executarAudio() async {
    if (primeiraExecucao) {
      audioPlayer = await audioCache.play("audios/musica.mp3");
      primeiraExecucao = false;
      audioPlayer.setVolume(volume);
    } else {
      audioPlayer.resume();
    }
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando Audios"),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (novoVolume) {
              setState(() {
                volume = novoVolume;
              });
              audioPlayer.setVolume(volume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: () async {
                    _executarAudio();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: () {
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: () {
                    _parar();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

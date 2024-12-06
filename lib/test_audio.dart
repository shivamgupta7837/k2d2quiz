import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TestAudio extends StatelessWidget {
  TestAudio({super.key});

  final player = AudioPlayer();

  void playAudio() async {
    final duration = await player.setAsset("assets/audios/quiz.mp3");
    await player.play();
  }

  void pauseAudio() async {
    final duration = await player.setAsset("assets/audios/quiz.mp3");
    await player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Audio"),
      ),
      body: Center(
        child: Column(
          children: [
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Audios()));}, child: Text("Play")),

          ],
        ),
      ),
    );
  }
}

class Audios extends StatefulWidget {
  const Audios({super.key});

  @override
  State<Audios> createState() => _AudiosState();
}

class _AudiosState extends State<Audios> {
  @override
  final player = AudioPlayer();

  void playAudio() async {
    final duration = await player.setAsset("assets/audios/quiz.mp3");
    await player.play();
    print("Duration: ${duration!.inMinutes}");
  }

  @override
  void initState() {
    playAudio();
    super.initState();
  }

  void pauseAudio() async {
    final duration = await player.setAsset("assets/audios/quiz.mp3");
    await player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Audio"),

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: playAudio, child: Text("Play")),
            ElevatedButton(onPressed: pauseAudio, child: Text("Pause")),
            TextButton(onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Dialog Title"),
                    content: Text("This is the dialog content."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          pauseAudio();
                          Navigator.pop(context);

                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            }, child: Icon(Icons.abc)),
          ],
        ),
      ),
    );
  }
}

import 'package:just_audio/just_audio.dart';

String? number = 'Chargement...';
AudioPlayer player = AudioPlayer();

Future repeat() => Future.delayed(
        const Duration(seconds: 60),
        () async {
          // debugPrint("####### Init Repeat");
          player.stop();
          player.setAsset("assets/audios/Phrase_3.mp3");
          player.play();
          // debugPrint("###### Final Repeat");
        },
      );

import 'package:audioplayers/audioplayers.dart';

class PlayerModel {
  late AudioPlayer audioPlayer;
  AudioCache audioCache = AudioCache();

  late int newSoundId;
  late bool isPlaying;
}

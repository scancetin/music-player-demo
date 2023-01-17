import 'package:audioplayers/audioplayers.dart';

class PlayerModel {
  late AudioPlayer audioPlayer;
  AudioCache audioCache = AudioCache();

  int playingSoundPlaylistId;
  int playingSoundId;
  bool isPlaying;

  PlayerModel({
    this.playingSoundPlaylistId = -1,
    this.playingSoundId = -1,
    this.isPlaying = false,
  });
}

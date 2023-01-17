// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';

class PlayerController extends GetxController {
  final _player = PlayerModel().obs;

  int get playingSoundId => _player.value.playingSoundId;
  bool get isPlaying => _player.value.isPlaying;
  AudioPlayer get audioPlayer => _player.value.audioPlayer;
  AudioCache get audioCache => _player.value.audioCache;

  void soundControl(String sound, int soundId) {
    if (soundId == playingSoundId) {
      print("same song");
    } else if (!isPlaying && playingSoundId == -1) {
      playLocal(sound, soundId);
    } else {
      stopAudio();
      playLocal(sound, soundId);
    }
  }

  void playLocal(String sound, int soundId) async {
    _player.update((val) {
      val!.isPlaying = true;
      val.playingSoundId = soundId;
    });

    _player.update((val) async => val!.audioPlayer = await audioCache.play(sound));
  }

  void pauseAudio() async {
    _player.update((val) => val!.isPlaying = false);
    await audioPlayer.pause();
  }

  void resumeAudio() async {
    _player.update((val) => val!.isPlaying = true);
    await audioPlayer.resume();
  }

  void stopAudio() async {
    _player.update((val) {
      val!.isPlaying = false;
      val.playingSoundId = -1;
    });
    await audioPlayer.stop();
  }
}

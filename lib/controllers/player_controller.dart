// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';

class PlayerController extends GetxController {
  final _player = PlayerModel().obs;

  PlayerController({required newSoundId}) {
    _player.update((val) {
      val!.newSoundId = newSoundId;
      val.isPlaying = true;
    });
  }

  int get newSoundId => _player.value.newSoundId;
  bool get isPlaying => _player.value.isPlaying;
  AudioPlayer get audioPlayer => _player.value.audioPlayer;
  AudioCache get audioCache => _player.value.audioCache;

  // void soundControl(String sound, int newSoundId) {
  //   if (newSoundId != newSoundId) {
  //     stopAudio();
  //     playLocal(sound);
  //   } else if (!isPlaying) {
  //     playLocal(sound);
  //   } else {
  //     print("same song");
  //   }
  // }

  void playLocal(String sound) async {
    print("play");
    _player.update((val) async {
      val!.audioPlayer = await audioCache.play(sound);
      val.isPlaying = true;
    });
    print("is playing $isPlaying");
  }

  void pauseAudio() async {
    print(audioPlayer.playerId);
    print(isPlaying);
    await audioPlayer.pause().then((value) => _player.update((val) => val!.isPlaying = false));
  }

  void resumeAudio() async {
    await audioPlayer.resume().then((value) => _player.update((val) => val!.isPlaying = true));
  }

  void stopAudio() async {
    await audioPlayer.stop().then((value) => _player.update((val) => val!.isPlaying = false));
  }
}

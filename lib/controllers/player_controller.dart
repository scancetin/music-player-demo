// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';

class PlayerController extends GetxController {
  final _player = PlayerModel().obs;

  int get playingSoundId => _player.value.playingSoundId;
  int get playingSoundPlaylistId => _player.value.playingSoundPlaylistId;
  bool get isPlaying => _player.value.isPlaying;
  AudioPlayer get audioPlayer => _player.value.audioPlayer;
  AudioCache get audioCache => _player.value.audioCache;

  void soundControl(String sound, int soundId, int playlistId) {
    if (soundId == playingSoundId && playlistId == playingSoundPlaylistId) {
      print("same song");
    } else if (!isPlaying && playingSoundId == -1) {
      print("else if");
      playLocal(sound, soundId, playlistId);
    } else {
      print("else");
      stopAudio();
      playLocal(sound, soundId, playlistId);
    }
  }

  void playLocal(String sound, int soundId, int playlistId) async {
    _player.update((val) {
      val!.isPlaying = true;
      val.playingSoundId = soundId;
      val.playingSoundPlaylistId = playlistId;
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
      val.playingSoundPlaylistId = -1;
    });
    await audioPlayer.stop();
  }
}

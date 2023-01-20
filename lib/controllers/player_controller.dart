// ignore_for_file: avoid_print
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';

class PlayerController extends GetxController {
  late Timer timer = Timer(const Duration(seconds: 1), () {});
  final _player = PlayerModel().obs;
  final assetsAudioPlayer = AssetsAudioPlayer();

  int get playingSoundId => _player.value.playingSoundId;
  int get playingSoundPlaylistId => _player.value.playingSoundPlaylistId;
  bool get isPlaying => _player.value.isPlaying;
  int get timerDuration => _player.value.timerDuration;
  int get currentDuration => _player.value.currentDuration;
  int get remainDuration => _player.value.timerDuration - _player.value.currentDuration;

  void setDuration(int duration) {
    _player.update((val) {
      val!.timerDuration = duration;
      val.currentDuration = 0;
    });
  }

  void soundControl(String sound, int soundId, int playlistId) {
    if (soundId == playingSoundId && playlistId == playingSoundPlaylistId) {
      if (!isPlaying) {
        resumeAudio();
      }
    } else {
      stopAudio();
      timerHandler();
      playLocal(sound, soundId, playlistId);
    }
  }

  void timerHandler() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _player.update((val) => _player.value.currentDuration++);
      print("currentDuration: $currentDuration");
      print("timerDuration: $timerDuration");
      print("timerTick: ${timer.tick}");
      if (timerDuration == currentDuration) {
        timer.cancel();
        stopAudio();
      }
    });
  }

  void playLocal(String sound, int soundId, int playlistId) async {
    _player.update((val) {
      val!.isPlaying = true;
      val.playingSoundId = soundId;
      val.playingSoundPlaylistId = playlistId;
    });

    await assetsAudioPlayer.open(
      Audio.network("https://file-examples.com/storage/fe2879c03363c669a9ef954/2017/11/file_example_MP3_700KB.mp3"),
      loopMode: LoopMode.single,
    );
  }

  void pauseAudio() async {
    _player.update((val) {
      val!.isPlaying = false;
    });
    assetsAudioPlayer.pause();
    timer.cancel();
  }

  void resumeAudio() async {
    _player.update((val) => val!.isPlaying = true);

    timerHandler();
    assetsAudioPlayer.play();
  }

  void stopAudio() async {
    _player.update((val) {
      val!.isPlaying = false;
      val.playingSoundId = -1;
      val.playingSoundPlaylistId = -1;
      val.currentDuration = 0;
    });
    timer.cancel();
    assetsAudioPlayer.stop();
  }
}

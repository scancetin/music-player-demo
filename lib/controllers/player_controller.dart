// ignore_for_file: avoid_print
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import '../models/player_model.dart';
import 'sound_controller.dart';
import 'package:music_player_demo/constaints.dart' as K;

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

  void soundControl(SoundController soundCon, int playlistId) {
    if (soundCon.id == playingSoundId && playlistId == playingSoundPlaylistId) {
      if (!isPlaying) {
        resumeAudio();
      }
    } else {
      stopAudio();
      timerHandler();
      playLocal(soundCon, playlistId);
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

  void playLocal(SoundController soundCon, int playlistId) async {
    _player.update((val) {
      val!.isPlaying = true;
      val.playingSoundId = soundCon.id;
      val.playingSoundPlaylistId = playlistId;
    });

    await assetsAudioPlayer.open(
      Audio.network(
        "https://file-examples.com/storage/fe7122043963cd639947840/2017/11/file_example_MP3_700KB.mp3",
        metas: Metas(title: soundCon.name, artist: K.playlists[playlistId], album: K.playlists[playlistId], image: MetasImage.asset(soundCon.image)),
      ),
      loopMode: LoopMode.single,
      showNotification: true,
      notificationSettings: NotificationSettings(
        prevEnabled: false,
        nextEnabled: false,
        customPlayPauseAction: (player) => isPlaying ? pauseAudio() : resumeAudio(),
        customStopAction: (player) => stopAudio(),
      ),
    );

    // assetsAudioPlayer.open(
    //   Audio("assets/sounds/example.wav"),
    // );
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

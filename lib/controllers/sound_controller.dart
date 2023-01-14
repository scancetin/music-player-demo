// ignore_for_file: unused_field, library_prefixes

import 'package:get/get.dart';
import '../models/sound_model.dart';
import 'package:music_player_demo/constaints.dart' as K;

class SoundController extends GetxController {
  final _sound = SoundModel().obs;

  SoundController({required id}) {
    _sound.update((val) {
      if (id > 2) {
        val!.id = id;
        val.name = "Rain";
        // val.isPlaying = true;
        val.location = "sounds/sample.wav";
        val.image = "assets/images/sample.jpg";
      } else {
        val!.id = id;
        val.name = K.name[id];
        // val.isPlaying = true;
        val.location = K.location[id];
        val.image = K.image[id];
      }
    });
  }

  int get id => _sound.value.id;
  String get name => _sound.value.name;
  // bool get isPlaying => _sound.value.isPlaying;
  String get image => _sound.value.image;
  String get location => _sound.value.location;
}

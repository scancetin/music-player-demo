// ignore_for_file: unused_field, library_prefixes

import 'package:get/get.dart';
import '../models/sound_model.dart';
import 'package:music_player_demo/constaints.dart' as K;

class SoundController {
  final _sound = SoundModel();

  SoundController({required id}) {
    if (id > 2) {
      _sound.id = id;
      _sound.name = "Rain";
      _sound.location = "sounds/sample.wav";
      _sound.image = "assets/images/sample.jpg";
    } else {
      _sound.id = id;
      _sound.name = K.name[id];
      _sound.location = K.location[id];
      _sound.image = K.image[id];
    }
  }

  int get id => _sound.id;
  String get name => _sound.name;
  String get image => _sound.image;
  String get location => _sound.location;
}

// ignore_for_file: unused_field

import 'package:get/get.dart';

import '../models/sound_model.dart';

class SoundController extends GetxController {
  final _sound = SoundModel().obs;

  SoundController({required id}) {
    _sound.update((val) {
      val!.id = id;
      val.name = "Rain";
      val.isPlaying = true;
      val.image = "assets/images/sample.jpg";
    });
  }

  int get id => _sound.value.id;
  String get name => _sound.value.name;
  bool get isPlaying => _sound.value.isPlaying;
  String get image => _sound.value.image;
}

import '../models/sound_model.dart';
import 'package:music_player_demo/constaints.dart' as K;

class SoundController {
  final _sound = SoundModel();

  SoundController({required id, required playlistId}) {
    _sound.id = id;
    _sound.name = K.playlistSounds[playlistId][id]["name"];
    _sound.location = K.playlistSounds[playlistId][id]["location"];
    _sound.image = K.playlistSounds[playlistId][id]["image"];
  }

  int get id => _sound.id;
  String get name => _sound.name;
  String get image => _sound.image;
  String get location => _sound.location;
}

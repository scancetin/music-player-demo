// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_demo/controllers/sound_controller.dart';
import 'package:music_player_demo/constaints.dart' as K;

import '../controllers/player_controller.dart';

class PlayView extends StatelessWidget {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    int soundId = Get.arguments;
    final playerCon = Get.put(PlayerController());
    final SoundController soundCon = SoundController(id: soundId);

    playerCon.soundControl(soundCon.location, soundCon.id);

    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const Spacer(flex: 2),
          soundImage(soundCon.image),
          const Spacer(flex: 1),
          soundUtils(),
          const Spacer(flex: 1),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 50,
            child: const Text("temp"),
          )
        ],
      )),
    );
  }

  ClipRRect soundImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: Get.height * 0.75,
        width: Get.width * 0.9,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Center(
          child: CircleAvatar(
            radius: Get.width * 0.15,
            backgroundColor: Colors.black54,
            child: Text("30", style: TextStyle(color: Colors.white, fontSize: Get.width * 0.15)),
          ),
        ),
      ),
    );
  }

  SizedBox soundUtils() {
    return SizedBox(
      height: Get.height * 0.1,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: Get.width * 0.07,
          ),
          GetX<PlayerController>(builder: (playerCon) {
            return CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: Get.width * 0.07,
              child: IconButton(
                onPressed: () => playerCon.isPlaying ? playerCon.pauseAudio() : playerCon.resumeAudio(),
                icon: playerCon.isPlaying ? const Icon(Icons.pause_rounded) : const Icon(Icons.play_arrow_rounded),
                iconSize: Get.width * 0.09,
                color: Colors.white,
              ),
            );
          }),
          IconButton(
            onPressed: () => print("soname"),
            icon: const Icon(Icons.timer_outlined),
            iconSize: Get.width * 0.07,
          ),
        ],
      ),
    );
  }
}

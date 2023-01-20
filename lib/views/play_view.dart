// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_demo/controllers/sound_controller.dart';
import '../controllers/player_controller.dart';
import '../utils.dart';

class PlayView extends StatefulWidget {
  const PlayView({super.key});

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  final int soundId = Get.arguments[0];
  final int playlistId = Get.arguments[1];
  final playerCon = Get.put(PlayerController());
  late SoundController soundCon;

  @override
  void initState() {
    soundCon = SoundController(id: soundId, playlistId: playlistId);
    playerCon.soundControl(soundCon.location, soundCon.id, playlistId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: GetX<PlayerController>(
            builder: (playerCon) {
              return CircleAvatar(
                radius: Get.width * 0.15,
                backgroundColor: Colors.black54,
                child: Text(playerCon.remainDuration >= 0 ? playerCon.remainDuration.toString() : "", style: TextStyle(color: Colors.white, fontSize: Get.width * 0.15)),
              );
            },
          ),
        ),

        // child: Center(
        //   child: Obx(() {
        //     return CircleAvatar(
        //       radius: Get.width * 0.15,
        //       backgroundColor: Colors.black54,
        //       child: SimpleCircularProgressBar(
        //         progressColors: const [Colors.cyan],
        //         // animationDuration: playerCon.timerDuration,
        //         // startAngle: playerCon.currentDuration.toDouble(),
        //         maxValue: playerCon.timerDuration.toDouble(),
        //         size: Get.width * 0.30,
        //         valueNotifier: ValueNotifier(playerCon.remainDuration.toDouble()),
        //         onGetText: (p0) => Text(playerCon.remainDuration.toString()),
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }

  SizedBox soundUtils() {
    Utils utils = Utils();

    return SizedBox(
      height: Get.height * 0.1,
      width: Get.width,
      child: GetX<PlayerController>(builder: (playerCon) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              iconSize: Get.width * 0.07,
            ),
            CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: Get.width * 0.07,
              child: IconButton(
                onPressed: () => playerCon.isPlaying ? playerCon.pauseAudio() : playerCon.resumeAudio(),
                icon: playerCon.isPlaying ? const Icon(Icons.pause_rounded) : const Icon(Icons.play_arrow_rounded),
                iconSize: Get.width * 0.09,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => utils.setTimerDialog(),
              icon: const Icon(Icons.timer_outlined),
              iconSize: Get.width * 0.07,
            ),
          ],
        );
      }),
    );
  }
}

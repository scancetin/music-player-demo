// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_demo/controllers/sound_controller.dart';

class PlayView extends StatefulWidget {
  const PlayView({super.key});

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  late AudioPlayer audioPlayer;
  AudioCache audioCache = AudioCache();

  playLocal() async {
    print("play");
    audioPlayer = await audioCache.play("sounds/sample.wav");
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  resumeAudio() async {
    await audioPlayer.resume();
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  void initState() {
    playLocal();
    super.initState();
  }

  @override
  void dispose() {
    // stopAudio();
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const Spacer(flex: 2),
          soundImage(),
          const Spacer(flex: 1),
          // customSlider(),
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

  ClipRRect soundImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GetX<SoundController>(builder: (soundCon) {
        return Container(
          height: Get.height * 0.75,
          width: Get.width * 0.9,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(soundCon.image), fit: BoxFit.cover)),
          child: Center(
            child: CircleAvatar(
              radius: Get.width * 0.15,
              backgroundColor: Colors.black54,
              child: Text("30", style: TextStyle(color: Colors.white, fontSize: Get.width * 0.15)),
            ),
          ),
        );
      }),
    );
  }

  Widget customSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Slider(
            min: 0,
            max: 180,
            value: 15,
            onChanged: ((value) => print("changed")),
            onChangeEnd: ((value) => print("end")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("00:00"),
              const Text("03:00"),
            ],
          )
        ],
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
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: Get.width * 0.07,
            child: IconButton(
              onPressed: () => playLocal(),
              icon: const Icon(Icons.play_arrow_rounded),
              iconSize: Get.width * 0.09,
              color: Colors.white,
            ),
          ),
          GetX<SoundController>(builder: (soundCon) {
            return IconButton(
              onPressed: () => print(soundCon.name),
              icon: const Icon(Icons.timer_outlined),
              iconSize: Get.width * 0.07,
            );
          }),
        ],
      ),
    );
  }
}

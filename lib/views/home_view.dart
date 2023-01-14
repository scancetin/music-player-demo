// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/sound_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: settings(),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  playlistTemplate(),
                  playlistTemplate(),
                  playlistTemplate(),
                  playlistTemplate(),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 50,
              child: const Text("temp"),
            )
          ],
        ));
  }

  Column settings() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(backgroundColor: Colors.blue, onPressed: (() => print("timer")), child: const Icon(Icons.timer_outlined, color: Colors.white)),
        const SizedBox(height: 10),
        // FloatingActionButton(backgroundColor: Colors.red, onPressed: (() => print("favorites")), child: const Icon(Icons.heart_broken_sharp, color: Colors.white)),
        // const SizedBox(height: 10),
        // FloatingActionButton(backgroundColor: Colors.black, onPressed: (() => print("settings")), child: const Icon(Icons.settings, color: Colors.white)),
      ],
    );
  }

  Column playlistTemplate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(left: Get.width * 0.1, top: Get.height * 0.08, bottom: 10),
            alignment: Alignment.topLeft,
            child: const Text("Nature", textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
        playlistRow(),
        playlistRow(),
        playlistRow(),
      ],
    );
  }

  Row playlistRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SoundCard(soundId: 0),
        SoundCard(soundId: 1),
        SoundCard(soundId: 2),
      ],
    );
  }
}

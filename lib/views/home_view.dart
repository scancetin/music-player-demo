// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/player_controller.dart';
import 'widgets/sound_card.dart';
import 'package:music_player_demo/constaints.dart' as K;
import '../utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final playerCon = Get.put(PlayerController());

    return SafeArea(
      child: Scaffold(
          floatingActionButton: settings(),
          body: Container(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: K.playlists.length,
                    itemBuilder: (context, playlistIndex) => playlistTemplate(playlistIndex),
                  ),
                ),
                // Container(
                //   color: Colors.black,
                //   width: double.infinity,
                //   height: 50,
                //   child: const Text("temp"),
                // )
              ],
            ),
          )),
    );
  }

  Column settings() {
    Utils utils = Utils();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: "timer",
          backgroundColor: Colors.red,
          onPressed: (() => utils.setTimerDialog()),
          child: const Icon(Icons.timer_outlined, color: Colors.white),
        ),
        // const SizedBox(height: 10),
        // FloatingActionButton(
        //   heroTag: "gift",
        //   backgroundColor: Colors.red,
        //   onPressed: (() => print("gift - total hours spent")),
        //   child: const Icon(Icons.card_giftcard_rounded, color: Colors.white),
        // ),
        // const SizedBox(height: 10),
        // FloatingActionButton(
        //   heroTag: "settings",
        //   backgroundColor: Colors.black,
        //   onPressed: (() => print("settings - theme, notifications")),
        //   child: const Icon(Icons.settings, color: Colors.white),
        // ),
      ],
    );
  }

  Widget playlistTemplate(int playlistIndex) {
    List<Map> playlist = K.playlistSounds[playlistIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.03, bottom: Get.height * 0.03),
          child: Text(K.playlists[playlistIndex], textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
        ),
        SizedBox(
          height: Get.width * 0.5 * (playlist.length / 2).ceil(),
          width: Get.width * 0.9,
          child: GridView.builder(
            itemCount: playlist.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => SoundCard(sound: playlist[index], playlistId: playlistIndex),
          ),
        ),
        SizedBox(
          width: Get.width * 0.9,
          height: Get.height * 0.015,
          child: Card(color: Colors.black54),
        ),
      ],
    );
  }
}

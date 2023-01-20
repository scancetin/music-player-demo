// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/player_controller.dart';
import 'widgets/sound_card.dart';
import 'package:music_player_demo/constaints.dart' as K;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final playerCon = Get.put(PlayerController());

    return Scaffold(
        floatingActionButton: settings(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: K.playlists.length,
                itemBuilder: (context, playlistIndex) => playlistTemplate(playlistIndex),
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

  Widget playlistTemplate(int playlistIndex) {
    List<Map> playlist = K.playlistSounds[playlistIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(left: Get.width * 0.1, top: Get.height * 0.03, bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(K.playlists[playlistIndex], textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
        SizedBox(
          height: Get.height * 0.11 * (playlist.length / 3).ceil(),
          width: Get.width * 0.9,
          child: GridView.builder(
            itemCount: playlist.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => SoundCard(sound: playlist[index], playlistId: playlistIndex),
          ),
        ),
      ],
    );
  }
}

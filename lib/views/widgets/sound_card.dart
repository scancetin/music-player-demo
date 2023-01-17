import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_demo/constaints.dart' as K;

class SoundCard extends StatelessWidget {
  final int soundId;

  const SoundCard({Key? key, required this.soundId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/play", arguments: soundId),
      child: Container(
        height: Get.height * 0.11,
        width: Get.width * 0.26,
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(K.image[soundId]), fit: BoxFit.cover),
            ),
            child: Center(child: Text(K.name[soundId].toString(), style: const TextStyle(backgroundColor: Colors.black87))),
          ),
        ),
      ),
    );
  }
}

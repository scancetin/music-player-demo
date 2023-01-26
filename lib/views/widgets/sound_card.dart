import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoundCard extends StatelessWidget {
  final Map sound;
  final int playlistId;
  const SoundCard({Key? key, required this.sound, required this.playlistId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Get.toNamed("/play", arguments: [sound["id"], playlistId]),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(sound["image"]), fit: BoxFit.cover),
                ),
                // child: Center(child: Text(sound["name"], style: const TextStyle(backgroundColor: Colors.black87, fontSize: 10))),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            sound["name"],
            style: const TextStyle(backgroundColor: Colors.black87, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

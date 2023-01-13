
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoundCard extends StatelessWidget {
  const SoundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/play"),
      child: Container(
        height: Get.height * 0.11,
        width: Get.width * 0.26,
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/sample.jpg"), fit: BoxFit.cover),
            ),
            child: const Center(child: Text("Mature", style: TextStyle(backgroundColor: Colors.black87))),
          ),
        ),
      ),
    );
  }
}
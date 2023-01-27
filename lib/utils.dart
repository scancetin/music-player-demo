import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/player_controller.dart';

class Utils {
  final playerCon = Get.put(PlayerController());

  dynamic setTimerDialog() {
    return Get.defaultDialog(
        title: "",
        middleText: "Set duration",
        middleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        contentPadding: const EdgeInsets.only(bottom: 20),
        actions: [
          TextButton(
              onPressed: () {
                playerCon.setDuration(0);
                Get.back();
                Get.snackbar("Duration setted", "to endless");
              },
              child: const Text("Endless")),
          TextButton(
              onPressed: () {
                playerCon.setDuration(30);
                Get.back();
                Get.snackbar("Duration setted", "to 30 minutes");
              },
              child: const Text("30 minutes")),
          TextButton(
              onPressed: () {
                playerCon.setDuration(60);
                Get.back();
                Get.snackbar("Duration setted", "to 1 hour");
              },
              child: const Text("1 hour")),
          TextButton(
              onPressed: () {
                playerCon.setDuration(120);
                Get.back();
                Get.snackbar("Duration setted", "to 2 hours");
              },
              child: const Text("2 hours")),
          TextButton(
              onPressed: () {
                playerCon.setDuration(180);
                Get.back();
                Get.snackbar("Duration setted", "to 3 hours");
              },
              child: const Text("3 hours")),
        ]);
  }
}

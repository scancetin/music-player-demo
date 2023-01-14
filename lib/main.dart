// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_demo/views/home_view.dart';
import 'package:music_player_demo/views/play_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      getPages: [
        GetPage(name: "/home", page: () => const HomeView()),
        GetPage(name: "/play", page: () => const PlayView(), transition: Transition.downToUp),
      ],
    );
  }
}

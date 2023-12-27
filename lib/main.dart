import 'package:flutter/material.dart';
import 'package:number_game/route/routes.dart';
import 'package:number_game/ui/game_screen.dart';
import 'package:number_game/ui/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: '숫자 맞추기 게임',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
    );
  }
}

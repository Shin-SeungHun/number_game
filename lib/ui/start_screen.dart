import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/number_game_start.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '숫자 맞추기 게임',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.push('/gameScreen');
                  },
                  child: const Text('게임 시작')),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text('게임 종료')),
            ],
          ),
        ),
      ),
    );
  }
}

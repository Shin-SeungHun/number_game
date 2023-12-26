import 'package:flutter/material.dart';

import 'model/game_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '숫자 맞추기 게임',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> {
  GameData _gameData = GameData.initial();
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF212d3b),
      appBar: AppBar(
        title: const Text(
          '숫자 맞추기 게임',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF212d3b),
      ),
      body: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '기회: ${_gameData.lifeCount} 번',
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            Text(
              _gameData.resultText,
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: '숫자를 입력하세요 1 ~ 100',
                labelStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // 원하는 색상으로 변경
                    // disabledBackgroundColor: Colors.white10
                  ),
                  child: const Text(
                    '시작',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // 원하는 색상으로 변경
                  ),
                  child: const Text(
                    '정답',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed:  null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // 원하는 색상으로 변경
                  ),
                  child: const Text(
                    '초기화',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

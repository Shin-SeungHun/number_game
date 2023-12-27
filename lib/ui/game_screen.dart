import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/game_data.dart';

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
        height: 350,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
            ),
            const SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _gameData.isGameActive ? _resetGame : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // 원하는 색상으로 변경
                      disabledBackgroundColor: Colors.white10),
                  child: const Text(
                    '초기화',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _gameData.isGameActive ? null : _startGame,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // 원하는 색상으로 변경
                      disabledBackgroundColor: Colors.white10),
                  child: const Text(
                    '시작',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _gameData.isGameActive ? _checkNumber : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // 원하는 색상으로 변경
                      disabledBackgroundColor: Colors.white10),
                  child: const Text(
                    '정답',
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

  void _startGame() {
    setState(() {
      _gameData = _gameData.copyWith(
        isGameActive: true,
        randomNumber: _gameData.generateRandomNumber(),
        min: 1,
        max: 100,
        lifeCount: 10,
        resultText: '${_gameData.min} ~ ${_gameData.max}',
      );
    });
    if (kDebugMode) {
      print('랜덤 숫자: ${_gameData.randomNumber}');
    }
  }

  void _resetGame() {
    setState(() {
      _gameData = GameData.initial();
      _controller.clear();
    });
  }

  void _checkNumber() {
    if (_gameData.lifeCount > 0) {
      int? inputNumber = int.tryParse(_controller.text);

      if (inputNumber == null) {
        _showToast('숫자를 입력하세요');
        return;
      }

      _gameData = _gameData.copyWith(lifeCount: _gameData.lifeCount - 1);

      if (inputNumber > _gameData.randomNumber) {
        _gameData = _gameData.copyWith(
          resultText: '${_gameData.min} ~ $inputNumber',
          max: inputNumber,
        );
      } else if (inputNumber < _gameData.randomNumber) {
        _gameData = _gameData.copyWith(
          resultText: '$inputNumber ~ ${_gameData.max}',
          min: inputNumber,
        );
      } else {
        _gameData = _gameData.copyWith(
          resultText: '정답: $inputNumber',
          isGameActive: false,
        );
        _showToast('정답입니다.');
      }

      _controller.clear();
      setState(() {});
    } else {
      _showToast('게임 종료');
      _gameData = _gameData.copyWith(isGameActive: false);
      setState(() {});
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
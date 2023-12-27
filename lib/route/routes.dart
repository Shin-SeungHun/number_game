import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:number_game/ui/game_screen.dart';
import 'package:number_game/ui/start_screen.dart';


final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const StartScreen(),
  ),
  GoRoute(
      path: '/gameScreen',
    builder: (context, state) => const GameScreen(),
      // builder: (context, state) {
      //   final userBmiData = UserBmiData.fromJson(
      //       jsonDecode(state.uri.queryParameters['userBmiData']!));
      //
      //   return ResultScreen(
      //     userBmiData: userBmiData,
      //   );
      // },
  ),
]);

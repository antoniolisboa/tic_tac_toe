import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/game_board.dart';
import 'package:tic_tac_toe/components/game_mode.dart';
import 'package:tic_tac_toe/components/turn_indicator.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  final Color firstColor = const Color(0xFFECE2D0);
  final Color secondColor = const Color(0xFF000501);
  final Color thirdColor = const Color(0xFFF26419);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            GameMode(
              firstColor: firstColor,
              secondColor: secondColor,
              thirdColor: thirdColor,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TurnIndicator(
              firstColor: firstColor,
              secondColor: secondColor,
            ),
            const SizedBox(height: 60),
            GameBoard(
              firstColor: firstColor,
              secondColor: secondColor,
            ),
          ],
        ),
      ]),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/turn_indicator.dart';
import 'package:tic_tac_toe/screens/winner_screen.dart';

class GameBoard extends StatefulWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  const GameBoard({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  });

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // In memory 1 = X and -1 = O
  final List _memory = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  bool currentPlayer = true; // true → X, false → O

  void changeWinnerScreen(int count) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WinnerScreen(
            firstColor: widget.firstColor,
            secondColor: widget.secondColor,
            thirdColor: widget.thirdColor,
            winner: count,
        ))
    );

    _memory[0] = [0, 0, 0];
    _memory[1] = [0, 0, 0];
    _memory[2] = [0, 0, 0];

    currentPlayer = true;
  }

  void isWinner() {
    int count = 0;

    // Check lines
    for(int i in [0, 1, 2]) {
      for(int j in [0, 1, 2]) {
        if(_memory[i][j] == 1) {
          count++;
        }
        else if(_memory[i][j] == -1) {
          count--;
        }
      }
      if (count == 3 || count == -3) changeWinnerScreen(count); // Winner
      count = 0;
    }

    // Check columns
    for(int i in [0, 1, 2]) {
      for(int j in [0, 1, 2]) {
        if(_memory[j][i] == 1) {
          count++;
        } else if(_memory[j][i] == -1) {
          count--;
        }
      }
      if (count == 3 || count == -3) changeWinnerScreen(count); // Winner
      count = 0;
    }

    // Check leading diagonal
    for(int i in [0, 1, 2]) {
      if(_memory[i][i] == 1) {
        count++;
      } else if(_memory[i][i] == -1) {
        count--;
      }
    }

    if (count == 3 || count == -3) changeWinnerScreen(count); // Winner
    count = 0;

    // Check secondary diagonal
    for(int i in [0, 1, 2]) {
      if(_memory[i][2-i] == 1) {
        count++;
      } else if(_memory[i][2-i] == -1) {
        count--;
      }
    }

    if (count == 3 || count == -3) changeWinnerScreen(count); // Winner
    count = 0;

    // Tie in the game
    for (int i in [0, 1, 2]) {
      for(int j in [0, 1, 2]) {
        if(_memory[i][j] != 0) count++;
      }
    }

    if (count == 9) changeWinnerScreen(count); // Tie
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TurnIndicator(
          firstColor: widget.firstColor,
          secondColor: widget.secondColor,
          currentPlayer: currentPlayer,
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _memory[0][0] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[0][0] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[0][0] == 0
                  ? Container()
                  : Icon(
                      _memory[0][0] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
            Container(
              height: 100,
              width: 2,
              color: widget.secondColor,
            ),
            OutlinedButton(
              onPressed: _memory[0][1] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[0][1] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[0][1] == 0
                  ? Container()
                  : Icon(
                      _memory[0][1] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
            Container(
              height: 100,
              width: 2,
              color: widget.secondColor,
            ),
            OutlinedButton(
              onPressed: _memory[0][2] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[0][2] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[0][2] == 0
                  ? Container()
                  : Icon(
                      _memory[0][2] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
          ],
        ),
        Container(
          height: 2,
          width: 300,
          color: widget.secondColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _memory[1][0] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[1][0] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[1][0] == 0
                  ? Container()
                  : Icon(
                      _memory[1][0] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
            Container(
              height: 100,
              width: 2,
              color: widget.secondColor,
            ),
            OutlinedButton(
              onPressed: _memory[1][1] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[1][1] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[1][1] == 0
                  ? Container()
                  : Icon(
                      _memory[1][1] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
            Container(
              height: 100,
              width: 2,
              color: widget.secondColor,
            ),
            OutlinedButton(
              onPressed: _memory[1][2] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[1][2] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[1][2] == 0
                  ? Container()
                  : Icon(
                      _memory[1][2] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
          ],
        ),
        Container(
          height: 2,
          width: 300,
          color: widget.secondColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _memory[2][0] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[2][0] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[2][0] == 0
                  ? Container()
                  : Icon(
                      _memory[2][0] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
            Container(
              height: 100,
              width: 2,
              color: widget.secondColor,
            ),
            OutlinedButton(
              onPressed: _memory[2][1] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[2][1] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[2][1] == 0
                  ? Container()
                  : Icon(
                      _memory[2][1] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
            Container(
              height: 100,
              width: 2,
              color: widget.secondColor,
            ),
            OutlinedButton(
              onPressed: _memory[2][2] != 0
                  ? null
                  : () {
                      setState(() {
                        _memory[2][2] = currentPlayer ? 1 : -1;
                        currentPlayer = !currentPlayer;
                      });
                      isWinner();
                    },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: widget.firstColor,
                foregroundColor: widget.firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: _memory[2][2] == 0
                  ? Container()
                  : Icon(
                      _memory[2][2] == 1
                          ? Icons.close
                          : Icons.radio_button_unchecked,
                      size: 52,
                      color: widget.secondColor,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

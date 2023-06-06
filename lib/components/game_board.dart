import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/turn_indicator.dart';
import 'package:tic_tac_toe/data/game_mode_inherited.dart';
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
  final List<List<int>> _memory = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  bool currentPlayer = true; // true → X, false → O
  bool mode = false;

  void changeWinnerScreen(int count) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WinnerScreen(
                  firstColor: widget.firstColor,
                  secondColor: widget.secondColor,
                  thirdColor: widget.thirdColor,
                  winner: count,
                )
        )
    );

    _memory[0] = [0, 0, 0];
    _memory[1] = [0, 0, 0];
    _memory[2] = [0, 0, 0];

    currentPlayer = true;
  }

  int checkResult(List<List<int>> memory, {bool isMinimax = false}) {
    int count = 0;

    // Check lines
    for (int i in [0, 1, 2]) {
      for (int j in [0, 1, 2]) {
        if (memory[i][j] == 1) {
          count++;
        } else if (memory[i][j] == -1) {
          count--;
        }
      }
      // Winner?
      if (count.abs() == 3) {
        if (isMinimax) return count~/count.abs();
        changeWinnerScreen(count);
      }
      count = 0;
    }

    // Check columns
    for (int i in [0, 1, 2]) {
      for (int j in [0, 1, 2]) {
        if (memory[j][i] == 1) {
          count++;
        } else if (memory[j][i] == -1) {
          count--;
        }
      }
      // Winner?
      if (count.abs() == 3) {
        if (isMinimax) return count~/count.abs();
        changeWinnerScreen(count);
      }
      count = 0;
    }

    // Check leading diagonal
    for (int i in [0, 1, 2]) {
      if (memory[i][i] == 1) {
        count++;
      } else if (memory[i][i] == -1) {
        count--;
      }
    }
    // Winner?
    if (count.abs() == 3) {
      if (isMinimax) return count~/count.abs();
      changeWinnerScreen(count);
    }
    count = 0;

    // Check secondary diagonal
    for (int i in [0, 1, 2]) {
      if (memory[i][2 - i] == 1) {
        count++;
      } else if (memory[i][2 - i] == -1) {
        count--;
      }
    }
    // Winner?
    if (count.abs() == 3) {
      if (isMinimax) return count~/count.abs();
      changeWinnerScreen(count);
    }
    count = 0;

    // Tie in the game
    for (int i in [0, 1, 2]) {
      for (int j in [0, 1, 2]) {
        if (memory[i][j] != 0) count++;
      }
    }
    // Tie?
    if (count == 9) {
      if (isMinimax) return count-count;
      changeWinnerScreen(count);
    }
    count = 10;

    return count;
  }

  double minimax(int depth, bool player) {
    // 0: Tie, 1: X, -1: O
    int result = checkResult(_memory, isMinimax: true);

    // Finish game
    if (result != 10) return result.toDouble();

    // Sets the starting score to maximize or minimize
    double bestScore;
    if (player) {
      bestScore = -double.infinity;
    } else {
      bestScore = double.infinity;
    }

    // Generate tree of possibilities
    for (int i in [0, 1, 2]) {
      for (int j in [0, 1, 2]) {
        if (_memory[i][j] == 0) {
          if (player) {
            _memory[i][j] = 1; // X
          } else {
            _memory[i][j] = -1; // O
          }

          double score = minimax(depth + 1, !player);

          // Undo the move
          _memory[i][j] = 0;

          // Update the best move
          if (player) {
            bestScore = score>bestScore ? score : bestScore; // Max
          } else {
            bestScore = score<bestScore ? score : bestScore; // Min
          }
        }
      }
    }

    return bestScore;
  }

  void findTheBestMove() {

    if (currentPlayer) return;

    double bestScore = 1;
    double score = 0;

    int line = -1;
    int column = -1;

    for (int i in [0, 1, 2]) {
      for (int j in [0, 1, 2]) {
        if (_memory[i][j] == 0) {
          _memory[i][j] = -1; // O
          score = minimax(0, !currentPlayer); // True: X
          _memory[i][j] = 0;

          if (score<bestScore) {
            line = i;
            column = j;
            bestScore = score;
          }
        }
      }
    }

    if (line != -1 && column != -1) {
      _memory[line][column] = -1;
      currentPlayer = !currentPlayer;
    }
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

                        mode = GameModeInherited.of(context).mode;
                        if(!currentPlayer && mode) {
                          findTheBestMove();
                        }

                      });
                      checkResult(_memory);
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

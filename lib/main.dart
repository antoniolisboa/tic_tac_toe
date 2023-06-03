import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/tic_toc_toe_screen.dart';
import 'package:tic_tac_toe/screens/winner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Tic Tac Toe',
      home: const TicTacToeScreen(),
    );
  }
}

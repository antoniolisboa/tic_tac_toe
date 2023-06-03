import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WinnerScreen extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  final int winner;

  const WinnerScreen({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
    required this.winner,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      appBar: AppBar(
        backgroundColor: firstColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                size: 40,
              ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              winner == 9? 'No Winner':
              'Winner',
              style: GoogleFonts.getFont(
                'Lobster',
                textStyle: TextStyle(
                  fontSize: 75,
                  color: thirdColor,
                )
              ),
            ),
            const SizedBox(width: 20),
            AnimatedOpacity(
              opacity: winner == 9? 0 : 1,
              duration: const Duration(milliseconds: 0),
              child: Container(
                height: 100,
                width: 75,
                decoration: BoxDecoration(
                  color: firstColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: secondColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  winner == 3? Icons.close:
                  Icons.radio_button_unchecked,
                  size: 46,
                  color: secondColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

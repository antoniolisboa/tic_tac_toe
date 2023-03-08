import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;

  const GameBoard({
    super.key,
    required this.firstColor,
    required this.secondColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
            Container(
              height: 100,
              width: 2,
              color: secondColor,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
            Container(
              height: 100,
              width: 2,
              color: secondColor,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
          ],
        ),
        Container(
          height: 2,
          width: 300,
          color: secondColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
            Container(
              height: 100,
              width: 2,
              color: secondColor,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
            Container(
              height: 100,
              width: 2,
              color: secondColor,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
          ],
        ),
        Container(
          height: 2,
          width: 300,
          color: secondColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
            Container(
              height: 100,
              width: 2,
              color: secondColor,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
            Container(
              height: 100,
              width: 2,
              color: secondColor,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(100, 100),
                backgroundColor: firstColor,
                foregroundColor: firstColor,
                side: const BorderSide(color: Colors.transparent),
                shape: const RoundedRectangleBorder(),
                enableFeedback: false,
              ),
              child: Icon(
                Icons.close,
                size: 52,
                color: secondColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

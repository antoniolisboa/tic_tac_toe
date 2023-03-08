import 'package:flutter/material.dart';

class TurnIndicator extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;

  const TurnIndicator({
    super.key,
    required this.firstColor,
    required this.secondColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
            Icons.close,
            size: 46,
            color: secondColor,
          ),
        ),
        const SizedBox(width: 20),
        Container(
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
            Icons.radio_button_unchecked,
            size: 46,
            color: secondColor,
          ),
        ),
      ],
    );
  }
}

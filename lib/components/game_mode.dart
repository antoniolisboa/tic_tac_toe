import 'package:flutter/material.dart';

class GameMode extends StatefulWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  const GameMode({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  });

  @override
  State<GameMode> createState() => _GameModeState();
}

class _GameModeState extends State<GameMode> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.group,
          size: 38,
          color: widget.secondColor,
        ),
        const SizedBox(width: 5),
        Switch(
          value: _switchValue,
          onChanged: (changed) {
            setState(() {
              _switchValue = !_switchValue;
            });
          },
          activeColor: widget.secondColor,
          activeTrackColor: widget.thirdColor,
          inactiveThumbColor: widget.secondColor,
          inactiveTrackColor: widget.firstColor,
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.person,
          size: 38,
          color: widget.secondColor,
        ),
      ],
    );
  }
}

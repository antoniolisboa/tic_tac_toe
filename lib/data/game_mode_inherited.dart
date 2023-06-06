import 'package:flutter/material.dart';

class GameModeInherited  extends InheritedWidget {
  bool mode = false; // Two players

  GameModeInherited({
    super.key,
    required super.child,
  });

  static GameModeInherited of(BuildContext context) {
    final GameModeInherited? result;
    result = context.dependOnInheritedWidgetOfExactType<GameModeInherited>();

    assert(result != null, 'No GameModeInherited found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(GameModeInherited oldWidget) {
    return oldWidget.mode != mode;
  }
}
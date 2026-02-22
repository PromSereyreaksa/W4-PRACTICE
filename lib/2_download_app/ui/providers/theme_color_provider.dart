import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ThemeColor {
  blue(color: Color.fromARGB(255, 34, 118, 229)),
  green(color: Color.fromARGB(255, 229, 158, 221)),
  pink(color: Color.fromARGB(255, 156, 202, 8));

  const ThemeColor({required this.color});

  final Color color;
  Color get backgroundColor => color.withAlpha(100);
}

//make a theme notifier
class ThemeColorProvider extends ChangeNotifier {
  ThemeColor _current = ThemeColor.blue;

  ThemeColor get current => _current;

  set current(ThemeColor newColor) {
    _current = newColor;
    notifyListeners(); // tell the ui to rebuild with ThemeColor currentThemeColor = ThemeColor.blue;the new color.
  }
}

/**
 * Created by Burhan Shaheen
 * https://github.com/burhanrepos
 */
import 'package:flutter/material.dart';

class UI with ChangeNotifier {
  double _fontSize = 0.5;
  Color _textColor = Colors.black;

  set fontSize(newValue) {
    _fontSize = newValue;
    notifyListeners();
  }

  set textColor(newValue) {
    _textColor = newValue;
    notifyListeners();
  }

  double get fontSize => _fontSize * 30;

  Color get textColor => _textColor;

  double get sliderFontSize => _fontSize;
}

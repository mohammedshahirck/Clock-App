import 'dart:async';

import 'package:flutter/material.dart';

class ClockViewProvider extends ChangeNotifier {
  DateTime currentTime = DateTime.now();
  late Timer timer;

  void clock() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime = DateTime.now();
      notifyListeners();
    });
  }
}

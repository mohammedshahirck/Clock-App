import 'package:flutter/material.dart';

class ClockViewProvider extends ChangeNotifier {
  // ClockViewProvider() {
  //   time();
  // }
  // void time() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     notifyListeners();
  //   });
  // }

  // dynamic datetime() {
  //   var dateTime = DateTime.now();
  //   notifyListeners();
  //   return dateTime;
  // }
  DateTime _currentTime = DateTime.now();

  DateTime get currentTime => _currentTime;
  set currentTime(DateTime value) {
    _currentTime = value;
    notifyListeners();
  }

  void updatetime() {
    currentTime = DateTime.now();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProviderCounter extends ChangeNotifier {
  int count = 0;
  ProviderCounter() {
    _loadCounter();
  }

  increCount() {
    count++;
    _saveCounter();
    notifyListeners();
  }

  decreCount() {
    count--;
    if (count < 0) {
      Fluttertoast.showToast(
        msg: "Count Can't be negative",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      count = 0;
    }
    _saveCounter();
    notifyListeners();
  }

  resetCount() {
    count = 0;
    _saveCounter();
    notifyListeners();
  }

  Future<void> _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    count = prefs.getInt('counter') ?? 0;
    Fluttertoast.showToast(
      msg: 'Loaded count from cache: $count',
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  Future<void> _saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', count);
  }
}

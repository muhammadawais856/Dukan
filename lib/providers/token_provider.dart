import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String _token = '';

  void setToken(String val) {
    _token = val;
    notifyListeners();
  }

  String getToken() => _token;
}
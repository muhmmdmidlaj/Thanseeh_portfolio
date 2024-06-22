import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepageprovider extends ChangeNotifier {
  bool istaped = false;
  void ontapfunction() {
    istaped = true;
    istaped2 = false;
    istaped3 = false;

    notifyListeners();
  }

  bool istaped2 = false;
  void ontapfunction2() {
    istaped2 = true;
    istaped3 = false;
    istaped = false;
    notifyListeners();
  }

  bool istaped3 = false;
  void ontapfunction3() {
    istaped3 = true;
    istaped = false;

    istaped2 = false;
    notifyListeners();
  }

  onExit() {
    istaped = false;
    istaped2 = false;
    istaped3 = false;
    notifyListeners();
  }
}

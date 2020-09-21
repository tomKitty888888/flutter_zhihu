import 'package:flutter/material.dart';

class CurrentIndexProvider with ChangeNotifier{

  int currentIndex = 0;

  setCurrentIndex(int index){
    this.currentIndex = index;
    notifyListeners();
  }
}

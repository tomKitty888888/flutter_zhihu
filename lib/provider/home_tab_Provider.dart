import 'package:flutter/material.dart';

class HomeTabProvider with ChangeNotifier{

  int index = 0;

  setTabIndex(int index){
    this.index = index;
    notifyListeners();
  }

}
import 'package:flutter/cupertino.dart';

class EffectSwiper with ChangeNotifier{

  late  int selectedIndex;
  EffectSwiper(){
    selectedIndex = 0;
  }

  get getIndex => selectedIndex;

  set setIndex(int index)
  {
    selectedIndex = index;
    notifyListeners();
  }

}
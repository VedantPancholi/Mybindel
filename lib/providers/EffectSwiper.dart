// it is used for changing colors of border , filter and adjust bars 

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
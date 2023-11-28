

// for showing and changing color of which item is selected in post-enhancement page

import 'package:flutter/material.dart';

class Enhancementprovider with ChangeNotifier{

  late  int selectedIndex;
  Enhancementprovider(){
    selectedIndex = 0;
  }

  get getIndex => selectedIndex;

  set setIndex(int index)
  {
    selectedIndex = index;
    notifyListeners();
  }

}
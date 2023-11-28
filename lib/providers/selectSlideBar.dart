
/* show which slidebar is selected in adjust of post-enhancement screen. */


import 'package:flutter/material.dart';

class Slidebarprovider with ChangeNotifier{
  int selectedSlidebar =  0 ;

  int get getsliderbarIndex => selectedSlidebar;

  set changeslidebarIndex(index){
    selectedSlidebar = index;
    notifyListeners();
  }


}
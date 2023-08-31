
import 'package:flutter/material.dart';

class Slidebarprovider with ChangeNotifier{
  int selectedSlidebar =  0 ;

  int get getsliderbarIndex => selectedSlidebar;

  set changeslidebarIndex(index){
    selectedSlidebar = index;
    notifyListeners();
  }


}
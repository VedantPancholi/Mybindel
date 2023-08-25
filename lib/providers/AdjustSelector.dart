
import 'package:flutter/cupertino.dart';

class AdujustSelector with ChangeNotifier{
  int selectedSlidebar =  0 ;

  int get getsliderbarIndex => selectedSlidebar;

  set changeslidebarIndex(index){
    selectedSlidebar = index;
    notifyListeners();
  }


}
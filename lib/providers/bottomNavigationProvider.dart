import 'package:flutter/foundation.dart';

class Navigationprovider with ChangeNotifier{

  late int current_index;

  Navigationprovider(){
    current_index = 0;
  }

  changeIndex(int index){
    current_index = index;
    notifyListeners();
  }

  get currentIndex => current_index;

}
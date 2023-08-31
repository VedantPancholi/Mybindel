import 'package:flutter/foundation.dart';
import '../models/Friend.dart';

class Friendsprovider with ChangeNotifier {
  List<Friend> _friends = [];


  List<Friend> get getItem => _friends;

  addItem(value){
    _friends.add(value);
    notifyListeners();
  }

  removeItem(index){
    _friends.removeAt(index);
    notifyListeners();
  }

}

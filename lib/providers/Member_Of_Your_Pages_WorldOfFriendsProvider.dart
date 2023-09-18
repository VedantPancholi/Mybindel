import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';

class Member_Of_Your_Pages_WorldOfFriendsProvider extends ChangeNotifier{

  final List<Friend> _Friends = [

  ];

    List<Friend> get getItem => _Friends;

  addItem(value){
    _Friends.add(value);
    notifyListeners();
  }

  removeItem(index){
    _Friends.removeAt(index);
    notifyListeners();
  }
}

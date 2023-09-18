
import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';

class Member_of_GroupsProvider extends ChangeNotifier{

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

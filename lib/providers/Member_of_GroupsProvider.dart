import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';

class Member_of_GroupsProvider extends ChangeNotifier{

  final List<Friend> _friends = [

  ];

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
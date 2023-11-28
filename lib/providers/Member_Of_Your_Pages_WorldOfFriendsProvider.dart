import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';

class Member_Of_Your_Pages_WorldOfFriendsProvider extends ChangeNotifier{

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
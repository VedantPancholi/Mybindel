import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Member_Of_Your_Pages_WordOfFriends.dart';

class Member_Of_Your_Pages_WordOfFriendsProvider extends ChangeNotifier{

  final List<Member_Of_Your_Pages_WordOfFriend> _member_Of_Your_Pages_WordOfFriends = [

  ];

    List<Member_Of_Your_Pages_WordOfFriend> get getItem => _member_Of_Your_Pages_WordOfFriends;

  addItem(value){
    _member_Of_Your_Pages_WordOfFriends.add(value);
    notifyListeners();
  }

  removeItem(index){
    _member_Of_Your_Pages_WordOfFriends.removeAt(index);
    notifyListeners();
  }
}

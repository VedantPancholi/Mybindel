
import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Member_of_Group.dart';

class Member_of_GroupsProvider extends ChangeNotifier{

  final List<Member_of_Group> _member_of_Groups = [

  ];

    List<Member_of_Group> get getItem => _member_of_Groups;

  addItem(value){
    _member_of_Groups.add(value);
    notifyListeners();
  }

  removeItem(index){
    _member_of_Groups.removeAt(index);
    notifyListeners();
  }
}

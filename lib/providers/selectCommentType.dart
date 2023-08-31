
import 'package:flutter/foundation.dart';

class Commenttypeprovider with ChangeNotifier {
  bool reply = false;
  int pushIndex = -1;


  bool get isreply{
    return reply;
  }

  set changecommentType(bool flag){
     reply = flag;
     notifyListeners();
  }

  int get getPushIndex{
    return pushIndex;
  }

  set setPushIndex(index){
    pushIndex = index;
  }


}
import '../models/FriendRequest.dart';

class FriendRequests {
  List<FriendRequest> friendrequests = [
    FriendRequest(
        name: "Eric W.",
        occupation: 'Artist',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 51,
        duration: '5h'),
    FriendRequest(
        name: "Watson",
        occupation: 'Baller',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 17,
        duration: '12h'),
    FriendRequest(
        name: "Emma",
        occupation: 'Doctor',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 21,
        duration: '6h'),
    FriendRequest(
        name: "Emily",
        occupation: 'Librarian',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 61,
        duration: '4h'),
    FriendRequest(
        name: "Jack",
        occupation: 'Singer',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 21,
        duration: '1h'),
    FriendRequest(
        name: "Roman",
        occupation: 'Racer',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 31,
        duration: '2h'),
    FriendRequest(
        name: "Bob",
        occupation: 'Thief',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 11,
        duration: '15m'),
    FriendRequest(
        name: "Hagrid",
        occupation: 'Watchman',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 2,
        duration: '2m'),
  ];
  List<FriendRequest> suggestions = [
    FriendRequest(
        name: "Eric W.",
        occupation: 'Artist',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 51,
        duration: '5h'),
    FriendRequest(
        name: "Watson",
        occupation: 'Baller',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 17,
        duration: '12h'),
    FriendRequest(
        name: "Emma",
        occupation: 'Doctor',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 21,
        duration: '6h'),
    FriendRequest(
        name: "Emily",
        occupation: 'Librarian',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 61,
        duration: '4h'),
    FriendRequest(
        name: "Jack",
        occupation: 'Singer',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 21,
        duration: '1h'),
    FriendRequest(
        name: "Roman",
        occupation: 'Racer',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 31,
        duration: '2h'),
    FriendRequest(
        name: "Bob",
        occupation: 'Thief',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 11,
        duration: '15m'),
    FriendRequest(
        name: "Hagrid",
        occupation: 'Watchman',
        picture: 'asset/images/user_logo.png',
        mutualfriends: 2,
        duration: '2m'),
  ];
  List<FriendRequest> get getfriendRequest {
    return friendrequests;
  }
  List<FriendRequest> get getsuggestion {
    return suggestions;
  }

  void removefriendrequest( int index){
    friendrequests.removeAt(index);
  }

  void removesuggestion( int index){
    suggestions.removeAt(index);
  }

}

FriendRequests friendRequestobj = FriendRequests();
FriendRequests getfriendRequestobj() {
  return friendRequestobj;
}

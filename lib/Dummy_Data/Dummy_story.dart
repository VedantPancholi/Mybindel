import '../models/Story.dart';
import '../models/User.dart';

class Stories {
  List<singleUserStory> stories = [
    singleUserStory(
        user: User(name: 'Maharshi', picture: 'asset/images/user_logo.png' , occupation: 'Artist'),
        stories: [
          Story(
            url:
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            mediaType: MediaType.image,
          ),
          Story(
            url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            mediaType: MediaType.video,
          ),

          Story(
            url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            mediaType: MediaType.video,
          ),
          Story(
            url: 'https://picsum.photos/250?image=9',
            mediaType: MediaType.image,
          ),
        ]),
    singleUserStory(
        user: User(name: 'vedant', picture: 'asset/images/user_logo.png', occupation: 'writer'),
        stories: [
          Story(
            url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            mediaType: MediaType.video,
          ),
          Story(
            url:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            mediaType: MediaType.video,
          ),
        ])
  ];

  List<singleUserStory> get getstories {
    return stories;
  }
}

Stories storyobj = Stories();
Stories getstoryobj() {
  return storyobj;
}

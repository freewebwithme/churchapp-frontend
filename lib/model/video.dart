import 'package:flutter/cupertino.dart';

class Video extends ChangeNotifier {
  String title;
  String description;
  String date;
  String thumbnailUrl;
  String videoId;
  String channelTitle;
  Video(this.title, this.description, this.date, this.thumbnailUrl,
      this.videoId, this.channelTitle);

  String get videoTitle => title;
  String get videoDescriptioin => description;
  String get videoDate => date;
  String get videoThumbnailUrl => thumbnailUrl;
  String get videoVideoId => videoId;
  String get videoChannelTitle => channelTitle;

  setVideo(String title, String description, String date, String thumbnailUrl,
      String videoId, String channelTitle) {
    this.title = title;
    this.description = description;
    this.date = date;
    this.thumbnailUrl = thumbnailUrl;
    this.videoId = videoId;
    this.channelTitle = channelTitle;

    notifyListeners();
  }
}

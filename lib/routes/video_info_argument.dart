import 'package:flutter/material.dart';

class VideoInfoArgument {
  final String title;
  final String description;
  final String date;
  final String thumbnailUrl;
  final String videoId;
  final String channelTitle;
  VideoInfoArgument(
      this.title, this.description, this.date, this.thumbnailUrl, this.videoId, this.channelTitle);
}

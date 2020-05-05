import 'package:churchapp/model/latest_videos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_list.dart';

class LatestVideosTab extends StatelessWidget {
  LatestVideosTab({
    Key key,
    this.count,
  }) : super(key: key);
  final int count;

  Widget build(BuildContext context) {
    return Consumer<LatestVideos>(builder: (context, latestVideos, child) {
      return VideoList(itemCount: count, items: latestVideos.latestVideos);
    });
  }
}

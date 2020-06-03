import 'package:churchapp/model/latest_videos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_list.dart';

class LatestVideosTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<LatestVideos>(builder: (context, latestVideos, child) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: VideoList(itemCount: latestVideos.latestVideos.length, items: latestVideos.latestVideos),
      );
    });
  }
}

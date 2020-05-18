import 'package:churchapp/model/latest_videos.dart';
import 'package:churchapp/widgets/news_card.dart';
import 'package:churchapp/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_horizontal_list.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          SectionTitle(
            title: "최신 설교",
          ),
          Consumer<LatestVideos>(
            builder: (context, latestVideos, child) {
              return Container(
                height: 250,
                child: VideoHorizontalList(
                  itemCount: 5,
                  items: latestVideos.latestVideos,
                ),
              );
            },
          ),
          SectionTitle(
            title: "교회 소식",
          ),
          Expanded(
            child: NewsCard(),
          ),
        ],
      ),
    );
  }
}

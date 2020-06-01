import 'package:churchapp/model/latest_videos.dart';
import 'package:churchapp/model/news.dart';
import 'package:churchapp/widgets/news_card.dart';
import 'package:churchapp/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_horizontal_list.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context);
    
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
                  itemCount: latestVideos.latestVideos.length >= 5 ? 5 : latestVideos.latestVideos.length,
                  items: latestVideos.latestVideos,
                ),
              );
            },
          ),
          SectionTitle(
            title: "교회 소식",
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              shrinkWrap: true,
              // Show only 10 news in home page
              itemCount: news.churchNews.length >= 10 ? 10 : news.churchNews.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(
                  id: news.churchNews[index]["id"],
                  content: news.churchNews[index]["content"],
                  date: news.churchNews[index]["createdAt"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

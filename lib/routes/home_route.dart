import 'package:churchapp/model/latest_videos.dart';
import 'package:churchapp/widgets/news_card.dart';
import 'package:churchapp/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/video_horizontal_list.dart';

const List<String> news = [
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
];

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
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              shrinkWrap: true,
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(content: news[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

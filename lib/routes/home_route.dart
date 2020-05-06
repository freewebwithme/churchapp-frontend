import 'package:churchapp/model/latest_videos.dart';
import 'package:churchapp/widgets/video_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/carousel.dart';
import '../widgets/news_card.dart';
import '../widgets/section_title.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselForHome(),
        SectionTitle(title: "교회소식"),
        Container(
          //height: 150,
          child: NewsCard(),
        ),
        SectionTitle(title: "최신 설교"),
        Expanded(child:
            Consumer<LatestVideos>(builder: (context, latestVideos, child) {
          return VideoList(itemCount: 2, items: latestVideos.latestVideos);
        })),
      ],
    );
  }
}

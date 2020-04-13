import 'package:flutter/material.dart';
import '../widgets/carousel.dart';
import '../widgets/news_card.dart';
import '../widgets/section_title.dart';
import '../queries/video_query.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselForHome(),
        SectionTitle(title: "교회소식"),
        Container(
          height: 150,
          child: NewsCard(),
        ),
        SectionTitle(title: "최신 설교"),
        Expanded(
          child: VideoQuery(count: 2),
        ),
      ],
    );
  }
}

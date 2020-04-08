import 'package:flutter/material.dart';
import '../widgets/carousel.dart';
import '../widgets/news_card.dart';
import '../widgets/section_title.dart';
import '../queries/home_query.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          child: HomeQuery(),
        ),
      ],
    );
  }
}

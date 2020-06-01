import 'package:churchapp/model/news.dart';
import 'package:churchapp/widgets/intro_title_widget.dart';
import 'package:churchapp/widgets/news_card.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroTitle(
          title: "최근 교회 소식",
          assetLocation: "images/icons/news.svg",
        ),
        Expanded(
          child: ListView.builder(
            itemCount: news.churchNews.length,
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
    );
  }
}

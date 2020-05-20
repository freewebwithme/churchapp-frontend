
import 'package:churchapp/widgets/intro_title_widget.dart';
import 'package:churchapp/widgets/news_card.dart';
import 'package:flutter/widgets.dart';

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

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroTitle(
          title: "최근 교회 소식",
          assetLocation: "images/icons/news.svg",
        ),
        Expanded(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(content: news[index]);
            },
          ),
        ),
      ],
    );
  }
}

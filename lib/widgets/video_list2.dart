
import 'package:flutter/material.dart';
import '../widgets/video_card.dart';

class VideoList extends StatelessWidget {
  VideoList({Key key, this.itemCount, this.items}) : super(key: key);

  final int itemCount;
  final List items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      padding: EdgeInsets.all(3.0),
      itemBuilder: (context, index) {
        print('printing item index: $index');
        final item = items[index];
        return VideoCard(
          title: item['title'],
          description: item['description'],
          date: item['publishedAt'],
          thumbnailUrl: item['thumbnailUrl'],
          videoId: item['videoId'],
          channelTitle: item['channelTitle'],
        );
      },
    );
  }
}

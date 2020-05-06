import 'package:flutter/material.dart';
import '../widgets/video_card.dart';

class VideoList extends StatelessWidget {
  VideoList({Key key, this.itemCount, this.items}) : super(key: key);

  final int itemCount;
  final List items;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0 || items.length == 0) {
      return Center(
        child: Text('최신 영상이 없습니다.'),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
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
}

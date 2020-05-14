import 'package:flutter/material.dart';
import '../widgets/video_horizontal_card.dart';

class VideoHorizontalList extends StatelessWidget {
  final int itemCount;
  final List items;

  const VideoHorizontalList({Key key, this.itemCount, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0 || items.length == 0) {
      return Center(
        child: Text('최신 영상이 없습니다.'),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          print('printing item index: $index');
          final item = items[index];
          return VideoHorizontalCard(
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

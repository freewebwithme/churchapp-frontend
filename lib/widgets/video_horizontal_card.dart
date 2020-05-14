import 'package:flutter/material.dart';
import '../model/video.dart';
import '../constants.dart';

class VideoHorizontalCard extends StatelessWidget {
  VideoHorizontalCard({
    Key key,
    this.title,
    this.description,
    this.date,
    this.thumbnailUrl,
    this.videoId,
    this.channelTitle,
  }) : super(key: key);

  final String title;
  final String description;
  final String date;
  final String thumbnailUrl;
  final String videoId;
  final String channelTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/video-detail',
          arguments: Video(
              title, description, date, thumbnailUrl, videoId, channelTitle),
        );
      },
      child: SizedBox(
        height: 230,
        width: 200,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 230,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                color: Colors.pink[600].withOpacity(.3),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 225,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                color: Colors.white,
              ),
            ),
            Container(
              height: 220,
              width: 190,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100].withOpacity(.5),
                borderRadius: BorderRadius.circular(34),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: NetworkImage('$thumbnailUrl'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: titleTextStyle.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$date',
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

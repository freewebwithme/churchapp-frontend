import 'package:flutter/material.dart';
import '../constants.dart';

class NewsCard extends StatelessWidget {
  final String content;

  const NewsCard({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext conext) {
    return Card(
      elevation: 1.0,
      child: InkWell(
        onTap: () {
          print('Card tapped.');
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            leading: Icon(
              Icons.chrome_reader_mode,
              color: cPrimaryAccentColor,
            ),
            subtitle: Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}

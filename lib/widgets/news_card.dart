import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/news_argument.dart';

class NewsCard extends StatelessWidget {
  final String content;
  final String date;
  final String id;

  const NewsCard({Key key, this.content, this.date, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: InkWell(
        onTap: () {
          print('Card tapped.');
          Navigator.pushNamed(
            context,
            '/news-detail',
            arguments: NewsArgument(
              id: id,
              date: date,
              content: content,
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            leading: Icon(
              Icons.chrome_reader_mode,
              color: cPrimaryAccentColor,
            ),
            title: Text(
              content,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

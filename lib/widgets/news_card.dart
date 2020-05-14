import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext conext) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(3.0),
      children: <Widget>[
        Card(
          elevation: 2.0,
          margin: EdgeInsets.only(right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.fiber_new, color: Colors.amber[800].withOpacity(.7)),
                subtitle:
                Text(
                  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 2.0,
          margin: EdgeInsets.only(right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.fiber_new, color: Colors.amber[800].withOpacity(.7)),
                subtitle:
                Text(
                  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 2.0,
          margin: EdgeInsets.only(right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.fiber_new, color: Colors.amber[800].withOpacity(.7)),
                subtitle:
                Text(
                  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 2.0,
          margin: EdgeInsets.only(right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.fiber_new, color: Colors.amber[800].withOpacity(.7)),
                subtitle:
                Text(
                  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 2.0,
          margin: EdgeInsets.only(right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.fiber_new, color: Colors.amber[800].withOpacity(.7)),
                subtitle:
                Text(
                  "이번주는 고난주간입니다. 이번주 4월 12일에는 부활주일입니다. 성찬식이 있습니다.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

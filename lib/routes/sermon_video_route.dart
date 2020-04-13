import 'package:flutter/material.dart';
import '../queries/video_query.dart';
import '../queries/playlist_query.dart';

class SermonVideoRoute extends StatelessWidget {
  final List<Tab> sermonTabs = <Tab>[
    Tab(
      text: "최근 설교",
    ),
    Tab(
      text: "채널",
    ),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sermonTabs.length,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TabBar(
                tabs: sermonTabs,
                labelColor: Colors.black45,
                indicatorColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            VideoQuery(count: 25),
            PlaylistQuery(),
          ],
        ),
      ),
    );
  }
}

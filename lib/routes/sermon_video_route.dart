import 'package:flutter/material.dart';
import '../widgets/latest_videos_tab.dart';
import '../queries/playlist_query.dart';

class SermonVideoRoute extends StatelessWidget {
  final List<Tab> sermonTabs = <Tab>[
    Tab(
      text: "최신 설교",
    ),
    Tab(
      text: "재생 목록별",
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
            LatestVideosTab(count: 25),
            PlaylistQuery(),
          ],
        ),
      ),
    );
  }
}

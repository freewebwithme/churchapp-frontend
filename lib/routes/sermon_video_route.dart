import 'package:flutter/material.dart';
import '../tabs/latest_videos_tab.dart';
import '../queries/playlist_query.dart';
import '../constants.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: sermonTabs,
              labelColor: Colors.black45,
              indicatorColor: cPrimaryAccentColor,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TabBarView(
                  children: <Widget>[
                    LatestVideosTab(),
                    PlaylistQuery(),
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

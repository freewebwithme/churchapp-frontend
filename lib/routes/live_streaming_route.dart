import 'package:flutter/material.dart';
import '../constants.dart';
import '../tabs/live_video_tab.dart';

class LiveStreamingRoute extends StatelessWidget {
  final List<Tab> liveVideoTab = <Tab>[
    Tab(text: "생방송 영상"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: liveVideoTab.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: liveVideoTab,
              labelColor: Colors.black45,
              indicatorColor: cPrimaryAccentColor,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TabBarView(children: <Widget>[
                  LiveVideoTab(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

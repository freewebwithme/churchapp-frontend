import 'package:flutter/material.dart';
import '../constants.dart';
import '../tabs/news_tab.dart';

class NewsRoute extends StatelessWidget {
  final List<Tab> newsTab = <Tab>[
    Tab(text: "교회 소식"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: newsTab.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: newsTab,
              labelColor: titleTextColor,
              indicatorColor: cPrimaryAccentColor,
            ),
            Expanded(
              child: Material(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      children: <Widget>[
                        NewsTab(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

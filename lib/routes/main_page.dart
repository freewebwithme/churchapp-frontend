import 'package:churchapp/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants.dart';
import 'intro_route.dart';
import 'sermon_video_route.dart';
import 'offering_route.dart';
import 'news_route.dart';
import 'live_streaming_route.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void onMenuTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeRoute(),
    IntroRoute(),
    SermonVideoRoute(),
    OfferingRoute(),
    NewsRoute(),
    LiveStreamingRoute(),
  ];

  static String churchName = DotEnv().env["CHURCH_NAME"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Material(
            elevation: 5,
            shadowColor: cPrimaryAccentColor,
            child: Container(
              // Height of the container is 45% of our total height
              height: size.height * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [cPrimaryColor, cPrimaryAccentColor],
                ),
                // backgroundBlendMode: BlendMode.overlay,
                image: DecorationImage(
                  alignment: Alignment(1.5, 0.0),
                  image: AssetImage("images/cross.png"),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: Text(
                  churchName,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: cPrimaryAccentColor,
                      height: 1,
                      width: 180,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                onMenuTapped(0);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "처음",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 0
                                          ? titleTextColor
                                          : titleTextColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                onMenuTapped(1);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "소개",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 1
                                          ? titleTextColor
                                          : titleTextColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                onMenuTapped(2);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "설교",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 2
                                          ? titleTextColor
                                          : titleTextColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                onMenuTapped(3);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "연보",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 3
                                          ? titleTextColor
                                          : titleTextColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                onMenuTapped(4);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "소식",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 4
                                          ? titleTextColor
                                          : titleTextColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                onMenuTapped(5);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 50,
                                child: Text(
                                  "생방송",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 5
                                          ? titleTextColor
                                          : titleTextColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // Main body Start
              Expanded(
                child: _screens[_selectedIndex],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

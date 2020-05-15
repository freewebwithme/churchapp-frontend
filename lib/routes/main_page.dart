import 'package:churchapp/routes/home_route.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'intro_route.dart';
import 'sermon_video_route.dart';
import 'offering_route.dart';


class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeRoute(),
    IntroRoute(),
    SermonVideoRoute(),
    OfferingRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Height of the container is 45% of our total height
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8).withOpacity(.7),
              // backgroundBlendMode: BlendMode.overlay,
              image: DecorationImage(
                alignment: Alignment(1.5, 0.0),
                image: AssetImage("images/cross.png"),
                //fit: BoxFit.cover,
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
                  "동부 장로 교회",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //  Container(
                    //    color: cPinkA700.withOpacity(0.5),
                    //    height: 2,
                    //    width: 200,
                    //  ),
                    //  SizedBox(
                    //    height: 10,
                    //  ),
                    Container(
                      color: cPinkA700,
                      height: 1,
                      width: 150,
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
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "처음",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 0
                                          ? cPrimaryColor
                                          : cPrimaryColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "소개",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 1
                                          ? cPrimaryColor
                                          : cPrimaryColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "설교",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 2
                                          ? cPrimaryColor
                                          : cPrimaryColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 3;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "연보",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 3
                                          ? cPrimaryColor
                                          : cPrimaryColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 4;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: Text(
                                  "소식",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 4
                                          ? cPrimaryColor
                                          : cPrimaryColor.withOpacity(.4)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 5;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 70,
                                height: 50,
                                child: Text(
                                  "생방송",
                                  style: menuTextStyle.copyWith(
                                      color: _selectedIndex == 5
                                          ? cPrimaryColor
                                          : cPrimaryColor.withOpacity(.4)),
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

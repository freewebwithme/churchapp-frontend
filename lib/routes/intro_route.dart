import 'package:flutter/material.dart';
import '../tabs/church_intro.dart';
import '../tabs/employee_info.dart';
import '../tabs/service_info.dart';
import '../tabs/contact_info.dart';
import '../constants.dart';


class IntroRoute extends StatelessWidget {
  final List<Tab> introTabs = <Tab>[
    Tab(
      text: "교회소개",
    ),
    Tab(
      text: "섬기는 분들",
    ),
    Tab(
      text: "예배 안내",
    ),
    Tab(
      text: "연락처",
    ),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: introTabs.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: introTabs,
              isScrollable: true,
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TabBarView(
                        children: <Widget>[
                          ChurchIntro(),
                          EmployeeInfo(),
                          ServiceInfo(),
                          ContactInfo(),
                        ],
                      ),
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


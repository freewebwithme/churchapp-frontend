import 'dart:convert';

import 'package:churchapp/model/church.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/intro_title_widget.dart';

class ServiceInfo extends StatelessWidget {
  // It is hard to display LazyCacheMap
  // this is ugly implementation.
  // TODO: Improve this function

  List<Widget> _scheduleText(church) {
    var newSchedules = new Map();
    church.schedules.forEach((schedule) {
      // LazyCacheMap...here
      var scheduleList = schedule.values.toList();
      // set order number as key and insert list as value.
      newSchedules[scheduleList[0]] = scheduleList;
    });

    List<Widget> scheduleTexts = [];
    for (var i = 1; i <= newSchedules.length; i++) {
      scheduleTexts.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "- " + newSchedules[i][1] + "   " + newSchedules[i][2],
          maxLines: 2,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ));
    }

    return scheduleTexts;
  }

  Widget _serviceInfo(church) {
    final serviceInfoLength = church.schedules.length;
    if (serviceInfoLength == 0 || church.schedules == null) {
      return Text("등록된 예배 안내가 없습니다");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _scheduleText(church),
    );
  }

  @override
  Widget build(BuildContext context) {
    final church = Provider.of<Church>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroTitle(
          title: "예배 안내",
          assetLocation: "images/icons/service-info.svg",
        ),
        Expanded(
          child: _serviceInfo(church),
        ),
      ],
    );
  }
}

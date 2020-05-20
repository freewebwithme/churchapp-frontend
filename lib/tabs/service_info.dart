import 'package:flutter/material.dart';
import '../widgets/intro_title_widget.dart';

const List<String> schedules = [
  "주일 오전 예배 오전 11:00",
  "주일 오후 예배 오후 2:00",
  "금요 예배 저녁 7:00",
  "초등부 예배 오전 10:30",
  "초등부 예배 오전 10:30",
  "초등부 예배 오전 10:30",
  "주일 오전 예배 오전 11:00",
  "주일 오전 예배 오전 11:00",
  "주일 오후 예배 오후 2:00",
  "금요 예배 저녁 7:00",
  "초등부 예배 오전 10:30",
  "초등부 예배 오전 10:30",
  "초등부 예배 오전 10:30",
  "주일 오후 예배 오후 2:00",
  "금요 예배 저녁 7:00",
  "초등부 예배 오전 10:30",
  "초등부 예배 오전 10:30",
  "초등부 예배 오전 10:30",
];

class ServiceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (schedules.length == 0 || schedules == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IntroTitle(
            title: "예배 안내",
            assetLocation: "images/icons/service-info.svg",
          ),
          Expanded(
            child: Center(
              child: Text(
                "등록된 예배 안내가 없습니다",
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IntroTitle(
            title: "예배 안내",
            assetLocation: "images/icons/service-info.svg",
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: schedules.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    schedules[index],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}

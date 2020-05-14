import 'package:flutter/material.dart';
import '../widgets/curved_header.dart';
import '../widgets/employee_card.dart';
import '../constants.dart';

class IntroRoute extends StatelessWidget {
  final List<Widget> employees2 = [
    EmployeeCard(
        image: "images/kimjungoh.png",
        name: "김정오 목사1",
        intro:
            "동부 장로 교회 담임 목사 김정오 입니다. 동동부 장로 교회 담임 목사 김정오 입니다.부 장로 교회 담임 목사 김정오 입니다.동부 장로 교회 담임 목사 김정오 입니다."),
    EmployeeCard(
        image: "images/kimjungoh.png",
        name: "김정오 목사2",
        intro:
            "동부 장로 교회 담임 목사 김정오 입니다. 동동부 장로 교회 담임 목사 김정오 입니다.부 장로 교회 담임 목사 김정오 입니다.동부 장로 교회 담임 목사 김정오 입니다."),
    EmployeeCard(
        image: "images/kimjungoh.png",
        name: "김정오 목사3",
        intro:
            "동부 장로 교회 담임 목사 김정오 입니다. 동동부 장로 교회 담임 목사 김정오 입니다.부 장로 교회 담임 목사 김정오 입니다.동부 장로 교회 담임 목사 김정오 입니다."),
    EmployeeCard(
        image: "images/kimjungoh.png",
        name: "김정오 목사4",
        intro:
            "동부 장로 교회 담임 목사 김정오 입니다. 동동부 장로 교회 담임 목사 김정오 입니다.부 장로 교회 담임 목사 김정오 입니다.동부 장로 교회 담임 목사 김정오 입니다."),
    EmployeeCard(
        image: "images/kimjungoh.png",
        name: "김정오 목사5",
        intro:
            "동부 장로 교회 담임 목사 김정오 입니다. 동동부 장로 교회 담임 목사 김정오 입니다.부 장로 교회 담임 목사 김정오 입니다.동부 장로 교회 담임 목사 김정오 입니다."),
  ];

  Widget build(BuildContext context) {
    print("Employee length ${employees2.length}");
    return Text("Intro Route");
  }
}

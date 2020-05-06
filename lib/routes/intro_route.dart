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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CurvedHeader(
            textTop: "동부 장로 교회",
            textBottom: "예수께서 나아와 말씀하여 이르시되 하늘과 땅의 모든 권세를 내게 주셨으니그러므로 너희는 가서 모든 민족을 제자로 삼아 아버지와 아들과 성령의 이름으로 세례를 베풀고내가 너희에게 분부한 모든 것을 가르쳐 지키게 하라 볼지어다 내가 세상 끝날까지 너희와 항상 함께 있으리라 하시니라 ",
            offset: 1.0
          ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("섬기는 분들", style: titleTextStyle),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: employees2.length,
                        itemBuilder: (BuildContext context, int index) {
                          return employees2[index];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

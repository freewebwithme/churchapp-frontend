import 'package:carousel_slider/carousel_slider.dart';
import 'package:churchapp/widgets/section_title.dart';
import 'package:flutter/material.dart';
import '../widgets/employee_card.dart';
import '../constants.dart';

const List employees = [
  EmployeeCard(image: "images/kimjungoh.png", title: "담임 목사", name: "김정오 목사"),
  EmployeeCard(image: "images/kimjungoh.png", title: "부목사", name: "박세덕 목사"),
  EmployeeCard(image: "images/kimjungoh.png", title: "담임 목사", name: "김정오 목사"),
  EmployeeCard(image: "images/kimjungoh.png", title: "담임 목사", name: "김정오 목사"),
];

class IntroRoute extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionTitle(
            title: "섬기는 분들",
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 0.8,
            ),
            itemCount: employees.length,
            itemBuilder: (context, index) {
              return employees[index];
            },
          ),
          Text(
            "교회 정보",
            style: titleTextStyle.copyWith(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 3),
            child: Container(
              width: 110,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.black54.withOpacity(.6),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 3),
            child: Container(
              width: 80,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.black54.withOpacity(.3),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("주소"),
                            Text("4270 W. 6th St.\n\nLos Angeles, CA 90010"),
                          ],
                        ),
                        Container(
                          width: 2,
                          height: MediaQuery.of(context).size.height * .25,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("예배 시간"),
                            Spacer(),
                            Text("주일 오전 예배: 11:00 am"),
                            Spacer(),
                            Text("주일 오후 예배: 2:00 pm"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}

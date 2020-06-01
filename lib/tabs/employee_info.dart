import 'package:churchapp/widgets/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:churchapp/model/employee.dart';
import '../widgets/intro_title_widget.dart';

const List employees = [
  EmployeeCard(image: "images/kimjungoh.png", title: "담임 목사", name: "김정오 목사"),
  EmployeeCard(image: "images/kimjungoh.png", title: "부목사", name: "박세덕 목사"),
  EmployeeCard(image: "images/kimjungoh.png", title: "담임 목사", name: "김정오 목사"),
  EmployeeCard(image: "images/kimjungoh.png", title: "담임 목사", name: "김정오 목사"),
];

class EmployeeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employees = Provider.of<Employee>(context);
    if (employees.churchEmployees.length == 0 || employees == null) {
      return Column(
        children: <Widget>[
          IntroTitle(
            title: "섬기는 분들",
            assetLocation: "images/icons/employee.svg",
          ),
          Expanded(
            child: Center(
              child: Text(
                "등록된 교역자가 없습니다.",
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          IntroTitle(
            title: "섬기는 분들",
            assetLocation: "images/icons/employee.svg",
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: employees.churchEmployees.length,
              itemBuilder: (BuildContext context, int index) {
                return EmployeeCard(
                  image: employees.churchEmployees[index]["profileImage"],
                  title: employees.churchEmployees[index]["position"],
                  name: employees.churchEmployees[index]["name"],
                );
              },
            ),
          ),
        ],
      );
    }
  }
}

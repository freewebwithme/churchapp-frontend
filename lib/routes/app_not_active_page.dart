import 'package:flutter/material.dart';

class AppNotActivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Calling AppNotActivePage");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("앱이 활성화 되어 있지 않습니다. 관리자에게 연락하세요."),
        ],
      ),
    );
  }
}

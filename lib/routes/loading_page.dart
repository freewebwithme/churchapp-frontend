import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("교회 정보를 불러오는 중입니다...."),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                semanticsLabel: "불러오는 중....",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

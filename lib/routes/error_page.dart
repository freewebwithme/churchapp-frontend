import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("데이터를 불러오는데 실패했습니다. 다시 시도하세요"),
      ),
    );
  }
}

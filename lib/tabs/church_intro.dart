import 'package:churchapp/model/church.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/intro_title_widget.dart';
import '../constants.dart';

class ChurchIntro extends StatelessWidget {
  Widget _churchIntro(church) {
    if (church.churchIntro == null || church.churchIntro == "") {
      return Text("교회 소개가 없습니다");
    }

    return Text(
      "     " + church.churchIntro,
    style: introDescTextStyle,);
  }

  @override
  Widget build(BuildContext context) {
    final church = Provider.of<Church>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroTitle(title: "동부 장로 교회", assetLocation: "images/icons/cross.svg"),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _churchIntro(church),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

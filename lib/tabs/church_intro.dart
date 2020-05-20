import 'package:flutter/material.dart';
import '../widgets/intro_title_widget.dart';
import '../constants.dart';

class ChurchIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroTitle(
            title: "동부 장로 교회", assetLocation: "images/icons/cross.svg"),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "      " +
                      "인간은 아담이 타락한 이후 죄의 영향으로 인해 총체적으로 부패하여 하나님의 은혜가 없이는 절대로 스스로를 죄와 죄에 대한 하나님의 심판으로부터 구원할수 없는 전적으로 무능한 존재라는 것을 믿습니다. (전적 타락)인간은 아담이 타락한 이후 죄의 영향으로 인해 총체적으로 부패하여 하나님의 은혜가 없이는 절대로 스스로를 죄와 죄에 대한 하나님의 심판으로부터 구원할수 없는 전적으로 무능한 존재라는 것을 믿습니다. (전적 타락)인간은 아담이 타락한 이후 죄의 영향으로 인해 총체적으로 부패하여 하나님의 은혜가 없이는 절대로 스스로를 죄와 죄에 대한 하나님의 심판으로부터 구원할수 없는 전적으로 무능한 존재라는 것을 믿습니다. (전적 타락)인간은 아담이 타락한 이후 죄의 영향으로 인해 총체적으로 부패하여 하나님의 은혜가 없이는 절대로 스스로를 죄와 죄에 대한 하나님의 심판으로부터 구원할수 없는 전적으로 무능한 존재라는 것을 믿습니다. (전적 타락)인간은 아담이 타락한 이후 죄의 영향으로 인해 총체적으로 부패하여 하나님의 은혜가 없이는 절대로 스스로를 죄와 죄에 대한 하나님의 심판으로부터 구원할수 없는 전적으로 무능한 존재라는 것을 믿습니다. (전적 타락)인간은 아담이 타락한 이후 죄의 영향으로 인해 총체적으로 부패하여 하나님의 은혜가 없이는 절대로 스스로를 죄와 죄에 대한 하나님의 심판으로부터 구원할수 없는 전적으로 무능한 존재라는 것을 믿습니다. (전적 타락)",
                  style: introDescTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

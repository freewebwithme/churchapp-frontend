
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class IntroTitle extends StatelessWidget {
  final String title;
  final String assetLocation;

  const IntroTitle({
      Key key,
      this.title,
      this.assetLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(assetLocation),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: introTitleTextStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            width: 200,
            height: 2,
            decoration: BoxDecoration(
              color: cPrimaryAccentColor,
            ),
          ),
        ),
      ],
    );
  }
}

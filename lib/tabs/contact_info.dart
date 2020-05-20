import 'package:churchapp/widgets/section_title.dart';
import 'package:flutter/material.dart';
import '../widgets/intro_title_widget.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroTitle(
          title: "교회 주소 및 연락처",
          assetLocation: "images/icons/contact.svg",
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SectionTitle(title: "교회 주소"),
              Text("4270 W 6th St."),
              Text("Los Angeles, CA 90010"),
              SectionTitle(title: "연락처"),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Text("전화번호"),
                    SizedBox(width: 20),
                    Text("(213) 505-5819"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Text("이메일"),
                    SizedBox(width: 20),
                    Text("redleopard81@gmail.com"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

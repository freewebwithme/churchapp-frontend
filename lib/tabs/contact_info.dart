import 'package:churchapp/model/church.dart';
import 'package:churchapp/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/intro_title_widget.dart';

class ContactInfo extends StatelessWidget {
  Widget _churchAddressLineOne(church) {
    if (church.churchAddressLineOne == null ||
        church.churchAddressLineOne == "") {
      return Text("등록된 정보가 없습니다");
    }
    return Text(church.churchAddressLineOne);
  }

  Widget _churchAddressLineTwo(church) {
    if (church.churchAddressLineTwo == null ||
        church.churchAddressLineTwo == "") {
      return Text("");
    }
    return Text(church.churchAddressLineTwo);
  }

  Widget _churchEmail(church) {
    if (church.churchEmail == null || church.churchEmail == "") {
      return Text("등록된 이메일이 없습니다.");
    }
    return Text(church.churchEmail);
  }

  Widget _churchPhoneNumber(church) {
    if (church.churchPhoneNumber == null || church.churchPhoneNumber == "") {
      return Text("등록된 전화번호 없습니다.");
    }
    final length = church.churchPhoneNumber.length;
    final areaCode = church.churchPhoneNumber.substring(0, 3);
    final firstThreeDigit = church.churchPhoneNumber.substring(3, 6);
    final lastFourDigit = church.churchPhoneNumber.substring(6, length);

    return Text("($areaCode) $firstThreeDigit-$lastFourDigit");
  }

  @override
  Widget build(BuildContext context) {
    final church = Provider.of<Church>(context);
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
              _churchAddressLineOne(church),
              _churchAddressLineTwo(church),
              SectionTitle(title: "연락처"),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Text("전화 번호"),
                    SizedBox(width: 20),
                    _churchPhoneNumber(church),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Text("이메일"),
                    SizedBox(width: 20),
                    _churchEmail(church),
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

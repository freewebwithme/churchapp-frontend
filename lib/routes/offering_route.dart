import 'dart:convert';

import 'package:churchapp/widgets/curved_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/rounded_button.dart';

class OfferingRoute extends StatefulWidget {
  OfferingRoute({Key key}) : super(key: key);

  @override
  _OfferingRouteState createState() => _OfferingRouteState();
}

class _OfferingRouteState extends State<OfferingRoute> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CurvedHeader(
            textTop: "연보",
            textBottom:
                "또 어떤 가난한 과부가 두 렙돈 넣는 것을 보시고이르시되 내가 참으로 너희에게 말하노니 이 가난한 과부가 다른 모든 사람보다 많이 넣었도다저들은 그 풍족한 중에서 헌금을 넣었거니와 이 과부는 그 가난한 중에서 자기가 가지고 있는 생활비 전부를 넣었느니라 하시니라 ",
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: RoundedButton(
                      text: "카드 정보 입력",
                      fontSize: 20,
                      press: () {
                        Navigator.pushNamed(context, '/card-detail');
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

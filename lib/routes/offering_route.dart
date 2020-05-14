import 'dart:convert';

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

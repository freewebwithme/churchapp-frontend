import 'dart:convert';

import 'package:churchapp/widgets/curved_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';

class OfferingRoute extends StatefulWidget {
  OfferingRoute({Key key}) : super(key: key);

  @override
  _OfferingRouteState createState() => _OfferingRouteState();
}

class _OfferingRouteState extends State<OfferingRoute> {
  String paymentMethodId;
  static String publishableKey = DotEnv().env["STRIPE_PUBLISHABLE_KEY"];
  @override
  void initState() {
    super.initState();
    Stripe.init(publishableKey);
  }

  Widget build(BuildContext context) {
    final paymentMethods =
        Provider.of<PaymentMethodStore>(context, listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CurvedHeader(
            textTop: "연보",
            textBottom:
                "또 어떤 가난한 과부가 두 렙돈 넣는 것을 보시고이르시되 내가 참으로 너희에게 말하노니 이 가난한 과부가 다른 모든 사람보다 많이 넣었도다저들은 그 풍족한 중에서 헌금을 넣었거니와 이 과부는 그 가난한 중에서 자기가 가지고 있는 생활비 전부를 넣었느니라 하시니라 ",
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 6,
              child: RoundedButton(
                text: "연보하기",
                fontSize: 20,
                press: () {
                  AddPaymentMethodScreen.withoutSetupIntent(paymentMethods);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double verticalPadding;
  final double fontSize;

  const RoundedButton(
      {Key key,
      this.text,
      this.press,
      this.verticalPadding = 16,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 16),
        padding:
            EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 30,
              color: Color(0xFF666666).withOpacity(.11),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

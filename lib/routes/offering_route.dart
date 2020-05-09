import 'dart:convert';

import 'package:churchapp/widgets/curved_header.dart';
import 'package:flutter/material.dart';
import '../stripe/payment_service.dart';

class OfferingRoute extends StatefulWidget {
  OfferingRoute({Key key}) : super(key: key);

  @override
  _OfferingRouteState createState() => _OfferingRouteState();
}

class _OfferingRouteState extends State<OfferingRoute> {
  String paymentMethodId;
  String cardNumber;
  int expMonth;
  int expYear;
  String cvc;
  String amount;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  Future<void> _showMyDialog(String message, bool success) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: success ? Text("확인하세요") : Text("에러"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: success ? Text("취소하기") : Text("닫기"),
                  onPressed: () {
                    if (success) {
                      print("결제를 취소 했습니다.");
                    } else {
                      print("창을 닫습니다.");
                      Navigator.of(context).pop();
                    }
                  }),
              success
                  ? FlatButton(
                      child: Text("결제하기"),
                      onPressed: () {
                        // confirm payment
                        print("결제를 진행합니다.");
                      },
                    )
                  : null,
            ],
          );
        });
  }

  makeOffering() async {
    var result = await StripeService.createPaymentMethod(
        cardNumber, expMonth, expYear, cvc, amount);
    if (result.success == true) {
      // Show modal to confirm payment
      print("Payment method success");
      await _showMyDialog(result.message, result.success);
    } else {
      // Show modal with error message
      print("Payment method success");
      await _showMyDialog(result.message, result.success);
    }
  }

  Widget build(BuildContext context) {
    print("Prinitng width: ${MediaQuery.of(context).size.width}");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CurvedHeader(
            textTop: "연보",
            textBottom:
                "또 어떤 가난한 과부가 두 렙돈 넣는 것을 보시고이르시되 내가 참으로 너희에게 말하노니 이 가난한 과부가 다른 모든 사람보다 많이 넣었도다저들은 그 풍족한 중에서 헌금을 넣었거니와 이 과부는 그 가난한 중에서 자기가 가지고 있는 생활비 전부를 넣었느니라 하시니라 ",
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("헌금하기"),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "헌금 액수를 입력 하세요";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: RoundedButton(
                      text: "연보하기",
                      fontSize: 20,
                      press: () {
                        makeOffering();
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripe_payment/stripe_payment.dart';
import '../stripe/payment_service.dart';
import '../widgets/rounded_button.dart';
import '../model/card_info.dart';
import '../constants.dart';

class OfferingDetailRoute extends StatefulWidget {
  OfferingDetailRoute({Key key}) : super(key: key);
  @override
  _OfferingDetailRouteState createState() => _OfferingDetailRouteState();
}

class _OfferingDetailRouteState extends State<OfferingDetailRoute> {
  String email;
  String amount;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  Future<void> _showMyDialog(
      String message, bool success, PaymentMethod paymentMethod) async {
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
                  Navigator.of(context).pop();
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("결제를 취소 했습니다."),
                      backgroundColor: const Color(0xFFEF5350),
                    ),
                  );
                } else {
                  print("창을 닫습니다.");
                  Navigator.of(context).pop();
                }
              },
            ),
            success
                ? FlatButton(
                    child: Text("결제하기"),
                    onPressed: () {
                      // confirm payment
                      print("결제를 진행합니다.");
                      Navigator.of(context).pop();
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text("결제를 진행합니다."),
                        ),
                      );
                    },
                  )
                : null,
          ],
        );
      },
    );
  }

  makeOffering(String cardNumber, int expMonth, int expYear, String cvc) async {
    var result = await StripeService.createPaymentMethod(
        cardNumber, expMonth, expYear, cvc, amount);
    if (result.success == true) {
      // Show modal to confirm payment
      print("Payment method success");
      await _showMyDialog(result.message, result.success, result.paymentMethod);
    } else {
      // Show modal with error message
      print("Payment method error");
      await _showMyDialog(result.message, result.success, result.paymentMethod);
    }
  }

  @override
  Widget build(BuildContext context) {
    final CardInfo cardInfo = ModalRoute.of(context).settings.arguments;
    print("Printing cardinfo: ${cardInfo.cardNumber}");
    print("Printing cardinfo: ${cardInfo.cardExpMonth}");
    print("Printing cardinfo: ${cardInfo.cardExpYear}");
    print("Printing cardinfo: ${cardInfo.cardCvc}");

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("상세 정보 입력")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "헌금 상세 정보",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 40,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: "이메일을 입력하세요.",
                  ),
                  validator: (value) {
                    final RegExp regex = new RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                    if (regex.hasMatch(value)) {
                      return null;
                    }
                    return "이메일 형식이 잘못됬습니다. 다시 입력하세요";
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                new TextFormField(
                  style: TextStyle(fontSize: 24),
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.attach_money),
                    hintText: "헌금 액수를 입럭하세요.",
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value.length == 0) {
                      return "헌금액수를 입력하세요.";
                    }
                    int numValue = int.parse(value);
                    if (numValue == 0 || numValue < 5) {
                      return "헌금은 5불이 최소 금액입니다.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      amount = value;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                RoundedButton(
                  text: "헌금하기",
                  fontSize: 20,
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      // form is validated
                      // get a payment method id from stripe and show the result
                      // in dialog
                      print("Initiating Payment.....");
                      makeOffering(cardInfo.cardNumber, cardInfo.cardExpMonth,
                          cardInfo.cardExpYear, cardInfo.cardCvc);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

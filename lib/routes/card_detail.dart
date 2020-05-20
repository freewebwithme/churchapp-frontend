import 'package:churchapp/model/offering_info.dart';
import 'package:churchapp/queries/make_offering_mutation.dart';
import 'package:churchapp/stripe/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart' as AwesomeCard;
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stripe_payment/stripe_payment.dart';
import '../widgets/rounded_button.dart';
import '../widgets/custom_appbar.dart';

// This class takes care of offering.
// This a screen that make a payment finally.

class CardDetailRoute extends StatefulWidget {
  CardDetailRoute({Key key}) : super(key: key);
  @override
  _CardDetailRouteState createState() => _CardDetailRouteState();
}

class _CardDetailRouteState extends State<CardDetailRoute> {
  String cardNumber = "";
  String expDate = "";
  String cvc = "";
  bool showBack = false;

  FocusNode _focusNode;
  var cardNumberFormatter = MaskTextInputFormatter(
      mask: "#### #### #### ####", filter: {"#": RegExp(r'[0-9]')});
  var expDateFormatter =
      MaskTextInputFormatter(mask: "##/##", filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });

    StripeService.init();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _showErrorDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("에러"),
          content: Text("결제정보가 정확하지 않습니다. 다시 확인해보고 시도하세요."),
          actions: <Widget>[
            FlatButton(
              child: Text("창 닫기"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog(
      String message, bool success, PaymentMethod paymentMethod, String amount, String email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MakeOfferingMutation(
            paymentMethodId: paymentMethod.id,
            email: email,
            amount: amount,
            success: success,
            message: message,
            scaffoldKey: _scaffoldKey);
      },
    );
  }

  makeOffering(String cardNumber, int expMonth, int expYear, String cvc,
      String amount, String email) async {
    var result = await StripeService.createPaymentMethod(
        cardNumber, expMonth, expYear, cvc, amount);
    if (result.success == true) {
      // Show modal to confirm payment
      print("Payment method success");
      await _showMyDialog(result.message, result.success, result.paymentMethod, amount, email);
    } else {
      // Show modal with error message
      print("Payment method error");
      await _showErrorDialog(result.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("printing cardnumber ${cardNumberFormatter.getUnmaskedText()}");

    final OfferingInfo offeringInfo = ModalRoute.of(context).settings.arguments;
    print("Printing offering info : email: ${offeringInfo.email}");
    print("Printing offering info : amount: ${offeringInfo.amount}");

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: "카드 정보"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            AwesomeCard.CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expDate,
              cvv: cvc,
              showBackSide: showBack,
              frontBackground: AwesomeCard.CardBackgrounds.black,
              backBackground: AwesomeCard.CardBackgrounds.white,
              showShadow: true,
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.credit_card),
                        hintText: "카드 번호를 입럭하세요",
                      ),
                      maxLength: 19,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        cardNumberFormatter,
                      ],
                      onChanged: (value) {
                        setState(() {
                          cardNumber = value;
                        });
                      },
                      validator: (value) {
                        if (value.length < 19) {
                          return "카드 넘버를 확인해주세요.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: "카드 만기 날짜를 입력하세요 (month/year)",
                      ),
                      maxLength: 5,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        expDateFormatter,
                      ],
                      onChanged: (value) {
                        setState(() {
                          expDate = value;
                        });
                      },
                      validator: (value) {
                        if (value.length < 5) {
                          return "카드 만기 날짜를 확인해주세요.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.credit_card),
                        hintText: "CVC를 입력하세요",
                      ),
                      maxLength: 3,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      focusNode: _focusNode,
                      onChanged: (value) {
                        setState(() {
                          cvc = value;
                        });
                      },
                      validator: (value) {
                        if (value.length < 3) {
                          return "CVC 넘버를 확인해주세요.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: RoundedButton(
                      text: "다음",
                      fontSize: 20,
                      press: () {
                        if (_formKey.currentState.validate()) {
                          var exp = expDate.split("/");
                          var cardExpMonth = exp[0];
                          var cardExpYear = exp[1];
                          makeOffering(cardNumber, int.parse(cardExpMonth), int.parse(cardExpYear),
                              cvc, offeringInfo.amount, offeringInfo.email);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

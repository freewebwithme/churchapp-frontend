import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../widgets/rounded_button.dart';
import '../model/card_info.dart';

class CardDetailRoute extends StatefulWidget {
  CardDetailRoute({Key key}) : super(key: key);
  @override
  _CardDetailRouteState createState() => _CardDetailRouteState();
}

class _CardDetailRouteState extends State<CardDetailRoute> {
  String cardNumber = "";
  String expDate = "";
  String cvv = "";
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
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("printing cardnumber ${cardNumberFormatter.getUnmaskedText()}");

    return Scaffold(
      appBar: AppBar(title: Text("카드 정보 입력")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expDate,
              cvv: cvv,
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
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
                        hintText: "CVV를 입력하세요",
                      ),
                      maxLength: 3,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      focusNode: _focusNode,
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                      validator: (value) {
                        if (value.length < 3) {
                          return "CVV 넘버를 확인해주세요.";
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
                          Navigator.pushNamed(
                            context,
                            '/offering-detail',
                            arguments: CardInfo(
                                cardNumberFormatter.getUnmaskedText(),
                                int.parse(cardExpMonth),
                                int.parse(cardExpYear),
                                cvv),
                          );
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

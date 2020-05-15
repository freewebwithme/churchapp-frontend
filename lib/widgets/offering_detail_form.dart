import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/rounded_button.dart';
import '../model/offering_info.dart';
import '../constants.dart';

class OfferingDetailForm extends StatefulWidget {
  OfferingDetailForm({Key key}) : super(key: key);
  @override
  _OfferingDetailFormState createState() => _OfferingDetailFormState();
}

class _OfferingDetailFormState extends State<OfferingDetailForm> {
  String email;
  String amount;

  @override
  void initState() {
    super.initState();
    amount = "0";
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                "\$ $amount",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 48,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "이메일",
                icon: const Icon(
                  Icons.email,
                  color: cPinkA700,
                ),
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
            TextFormField(
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
                  if (value == null || value == "") {
                    amount = "0";
                  } else {
                    amount = value;
                  }
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "다 음",
                fontSize: 20,
                press: () async {
                  if (_formKey.currentState.validate()) {
                    // form is validated
                    // get a payment method id from stripe and show the result
                    // in dialog
                    Navigator.pushNamed(
                      context,
                      '/card-detail',
                      arguments: OfferingInfo(
                        email,
                        amount,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

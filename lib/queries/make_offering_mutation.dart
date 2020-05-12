import 'package:churchapp/model/church.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
import './mutation.dart';

class MakeOfferingMutation extends StatefulWidget {
  final String paymentMethodId;
  final String email;
  final String amount;
  final bool success;
  final String message;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MakeOfferingMutation(
      {Key key,
      this.paymentMethodId,
      this.email,
      this.amount,
      this.success,
      this.message,
      this.scaffoldKey})
      : super(key: key);

  @override
  _MakeOfferingMutationState createState() => _MakeOfferingMutationState();
}

class _MakeOfferingMutationState extends State<MakeOfferingMutation> {
  Widget build(BuildContext context) {
    print(
        "Printing from mutation widget: paymentMethodId: ${widget.paymentMethodId}");
    print("Printing from mutation widget: email: ${widget.email}");
    print("Printing from mutation widget: amount: ${widget.amount}");
    return Consumer<Church>(
      builder: (context, church, child) {
        return Mutation(
          options: MutationOptions(
            documentNode: gql(makeOffering),
            onCompleted: (dynamic resultData) {
              print("결제 완료");
              print(resultData);
              showDialog<AlertDialog>(
                context: widget.scaffoldKey.currentContext,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("결제 완료"),
                    content: Text("결제를 성공적으로 마쳤습니다. 헌금에 감사를 드립니다."),
                    actions: <Widget>[
                      SimpleDialogOption(
                        child: const Text("창닫기"),
                        onPressed: () {
                          //Navigator.pop(widget.scaffoldKey.currentContext);
                          Navigator.pushNamed(
                              widget.scaffoldKey.currentContext, "/");
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          builder: (
            RunMutation makeOffering,
            QueryResult result,
          ) {
            if (result.loading) {
              print("결제를 진행중입니다");
              return AlertDialog(
                title: Text("진행중"),
                content: Text("결제를 진행중입니다...."),
                actions: null,
              );
            }
            if (result.hasException) {
              print("에러가 발생했습니다");
              return AlertDialog(
                title: Text("에러"),
                content: Text("결제를 진행중에 문제가 발생했습니다. 결제를 중지합니다."),
                actions: <Widget>[
                  FlatButton(
                    child: Text("창 닫기"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/card-detail");
                    },
                  ),
                ],
              );
            }
            return AlertDialog(
              title: widget.success ? Text("확인하세요") : Text("에러"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(widget.message),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: widget.success ? Text("취소하기") : Text("닫기"),
                  onPressed: () {
                    if (widget.success) {
                      Navigator.of(context).pop();
                      widget.scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text("결제를 취소 했습니다."),
                          backgroundColor: Theme.of(context).errorColor,
                        ),
                      );
                    } else {
                      print("창을 닫습니다.");
                      Navigator.of(context).pop();
                    }
                  },
                ),
                widget.success
                    ? FlatButton(
                        child: Text("헌금 결제 하기"),
                        onPressed: () {
                          makeOffering({
                            "paymentMethodId": widget.paymentMethodId,
                            "email": widget.email,
                            "amount": widget.amount,
                            "churchId": church.id,
                          });
                          Navigator.of(context).pop();
                        },
                      )
                    : null,
              ],
            );
          },
        );
      },
    );
  }
}

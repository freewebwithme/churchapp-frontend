import 'package:churchapp/model/news_argument.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../constants.dart';

class NewsDetailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsArgument args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: CustomAppBar(title: "교회소식"),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Material(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    args.content,
                    style: titleTextStyle.copyWith(
                      fontWeight:  FontWeight.normal,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    args.date,
                    style: titleTextStyle
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

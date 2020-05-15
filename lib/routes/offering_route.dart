import 'dart:convert';

import 'package:flutter/material.dart';
import '../widgets/offering_detail_form.dart';

class OfferingRoute extends StatefulWidget {
  OfferingRoute({Key key}) : super(key: key);

  @override
  _OfferingRouteState createState() => _OfferingRouteState();
}

class _OfferingRouteState extends State<OfferingRoute> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OfferingDetailForm(),
          ],
        ),
      ),
    );
  }
}

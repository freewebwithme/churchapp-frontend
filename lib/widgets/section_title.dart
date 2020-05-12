import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key key, this.title, this.link}) : super(key: key);

  final String title;
  final String link;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          FlatButton(
            child: Text("더보기"),
            onPressed: () {
              Navigator.of(context).pushNamed(link);
            },
          )
        ],
      ),
    );
  }
}

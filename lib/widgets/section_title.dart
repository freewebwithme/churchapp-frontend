import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)), 
      ),
    );
  }
}


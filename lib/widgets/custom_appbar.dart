import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  CustomAppBar({Key key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    print('Printing toolbar height: ${widget.preferredSize}');
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 50,
                height: 30,
                child: SvgPicture.asset("images/icons/arrow-left.svg"),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.title,
              style: appBarTextStyle,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CurvedHeader extends StatefulWidget {
  final String textTop;
  final String textBottom;
  final double offset;

  const CurvedHeader({Key key, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _CurvedHeaderState createState() => _CurvedHeaderState();
}

class _CurvedHeaderState extends State<CurvedHeader> {
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF8BB076),
              Color(0xFF5E9341),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              "${widget.textTop}", 
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            SizedBox(height: 30),
            Text(
              "${widget.textBottom}", 
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

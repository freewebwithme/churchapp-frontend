import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselForHome extends StatefulWidget {
  @override
  _CarouselForHomeState createState() => _CarouselForHomeState();
}

class _CarouselForHomeState extends State<CarouselForHome> {
  final List<Widget> _child = [
    Image(image: AssetImage('images/berit-1.png'), height: 250),
    Image(image: AssetImage('images/berit-2.png'), height: 250), 
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        height: 200,
        viewportFraction: 1.5,
        aspectRatio: 4/3,
        items: _child,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 7),
        enlargeCenterPage: true,
      ),
    ]);
  }
}

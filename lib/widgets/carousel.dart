import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../model/church.dart';

class CarouselForHome extends StatefulWidget {
  @override
  _CarouselForHomeState createState() => _CarouselForHomeState();
}

class _CarouselForHomeState extends State<CarouselForHome> {
  List<Widget> _buildSlideImage(church) {
    List<Widget> _child = [];
    final urls = [
      church.slideImageOne,
      church.slideImageTwo,
      church.slideImageThree
    ];
    print("printing $urls");
    for (var url in urls) {
      if (url != null) {
        _child.add(Image(image: NetworkImage(url), height: 250));
      }
    }
    return _child;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Consumer<Church>(
        builder: (context, church, child) {
          return CarouselSlider(
            height: 200,
            viewportFraction: 1.5,
            aspectRatio: 4 / 3,
            items: _buildSlideImage(church),
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 7),
            enlargeCenterPage: true,
          );
        },
      ),
    ]);
  }
}

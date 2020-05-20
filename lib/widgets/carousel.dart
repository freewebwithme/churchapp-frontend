import 'package:cached_network_image/cached_network_image.dart';
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
        //_child.add(Image(image: NetworkImage(url), height: 250));
        _child.add(CachedNetworkImage(
          imageUrl: url,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ));
      }
    }
    return _child;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<Church>(
          builder: (context, church, child) {
            return CarouselSlider(
              items: _buildSlideImage(church),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 7),
                enlargeCenterPage: true,
                height: 280,
                viewportFraction: 1.4,
                aspectRatio: 4 / 3,
              ),
            );
          },
        ),
      ],
    );
  }
}

//CarouselSlider.builder(
//  options: CarouselOptions(
//    enlargeCenterPage: true,
//    enableInfiniteScroll: false,
//    viewportFraction: 0.8,
//  ),
//  itemCount: employees.length,
//  itemBuilder: (context, index) {
//    return employees[index];
//  },
//),

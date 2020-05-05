import 'package:flutter/foundation.dart';

class Church extends ChangeNotifier {
  Church(
      {this.name,
      this.intro,
      this.channelId,
      this.slideImageOne,
      this.slideImageTwo,
      this.slideImageThree});
  String name;
  String intro;
  String channelId;
  String slideImageOne;
  String slideImageTwo;
  String slideImageThree;

  String get churchName => name;
  String get churchIntro => intro;
  String get churchChannelId => channelId;
  String get churchSlideImageOne => slideImageOne;
  String get churchSlideImageTwo => slideImageTwo;
  String get churchSlideImageThree => slideImageThree;

  void setChurch(String name, String intro, String channelId, String slideImageOne,
      String slideImageTwo, String slideImageThree) {
    this.name = name;
    this.intro = intro;
    this.channelId = channelId;
    this.slideImageOne = slideImageOne;
    this.slideImageTwo = slideImageTwo;
    this.slideImageThree = slideImageThree;

    notifyListeners();
  }
}

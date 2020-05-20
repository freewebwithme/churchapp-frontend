import 'package:flutter/foundation.dart';

class Church extends ChangeNotifier {
  Church({
    this.id,
    this.name,
    this.intro,
    this.channelId,
  });
  String id;
  String name;
  String intro;
  String channelId;

  String get churchId => id;
  String get churchName => name;
  String get churchIntro => intro;
  String get churchChannelId => channelId;

  void setChurch(
    String id,
    String name,
    String intro,
    String channelId,
  ) {
    this.id = id;
    this.name = name;
    this.intro = intro;
    this.channelId = channelId;

    notifyListeners();
  }
}

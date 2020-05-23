import 'package:flutter/foundation.dart';

class Church extends ChangeNotifier {
  Church(
      {this.id,
      this.name,
      this.intro,
      this.channelId,
      this.addressLineOne,
      this.addressLineTwo,
      this.email,
      this.phoneNumber,
      this.schedules});
  String id;
  String name;
  String intro;
  String channelId;
  String addressLineOne;
  String addressLineTwo;
  String email;
  String phoneNumber;
  List schedules;

  String get churchId => id;
  String get churchName => name;
  String get churchIntro => intro;
  String get churchChannelId => channelId;
  String get churchAddressLineOne => addressLineOne;
  String get churchAddressLineTwo => addressLineTwo;
  String get churchEmail => email;
  String get churchPhoneNumber => phoneNumber;
  List get churchSchedules => schedules;

  void setChurch(
      String id,
      String name,
      String intro,
      String channelId,
      String addressLineOne,
      String addressLineTwo,
      String email,
      String phoneNumber,
      List schedules) {
    this.id = id;
    this.name = name;
    this.intro = intro;
    this.channelId = channelId;
    this.addressLineOne = addressLineOne;
    this.addressLineTwo = addressLineTwo;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.schedules = schedules;

    notifyListeners();
  }
}

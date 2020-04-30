import 'package:flutter/foundation.dart';

class Church {
  static final Church _instance = new Church._internal();

  factory Church() {
    return _instance;
  }

  @protected
  String _name;
  @protected
  String _intro;
  @protected
  String _slideImageOne;
  @protected
  String _slideImageTwo;
  @protected
  String _slideImageThree;

  String get churchName => _name;
  String get churchIntro => _intro;
  String get churchSlideImageOne => _slideImageOne;
  String get churchSlideImageTwo => _slideImageTwo;
  String get churchSlideImageThree => _slideImageThree;

  void setChurch(String name, String intro, String slideImageOne,
      String slideImageTwo, String slideImageThree) {
    this._name = name;
    this._intro = intro;
    this._slideImageOne = slideImageOne;
    this._slideImageTwo = slideImageTwo;
    this._slideImageThree = slideImageThree;
  }

  Church._internal();
}

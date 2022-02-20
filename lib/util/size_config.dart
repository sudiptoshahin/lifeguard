
import 'dart:math';

import 'package:flutter/material.dart';

class SizeConfig {

  final _divisor = 400;

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeFactorHorizontal;

  static late double _safeAreaVertical;
  static late double _safeFactorVertical;

  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double _safeAreaTextScalingFactor = min(_safeFactorHorizontal, _safeFactorHorizontal);

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100.0;
    blockSizeVertical = screenHeight / 100.0;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    _safeFactorHorizontal = (screenWidth - _safeAreaHorizontal) / _divisor;
    _safeFactorVertical = (screenHeight - _safeAreaVertical) / _divisor;


  }

}
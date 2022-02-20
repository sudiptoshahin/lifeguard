
import 'package:flutter/material.dart';

class TextScalingFactors {

  final double display4ScaledSize;
  final double display3ScaledSize;
  final double display2ScaledSize;
  final double display1ScaledSize;

  final double headlineScaledSize0;
  final double titleScaledSize0;
  final double subtitleScaledSize0;

  final double body2ScaledSize;
  final double body1ScaledSize;

  final double captionScaledSize;
  final double buttonScaledSize;

  TextScalingFactors(
      this.display4ScaledSize,
      this.display3ScaledSize,
      this.display2ScaledSize,
      this.display1ScaledSize,
      this.headlineScaledSize0,
      this.titleScaledSize0,
      this.subtitleScaledSize0,
      this.body2ScaledSize,
      this.body1ScaledSize,
      this.captionScaledSize,
      this.buttonScaledSize);

}

// TextTheme _buildAppTextTheme(TextTheme _customTextTheme, TextScalingFactors _scaledText) {
//   return _customTextTheme.copyWith(
//     display4: _customTextTheme.display4.copyWith(fontSize: _scaledText.display4ScaledSize);
//   );
// }
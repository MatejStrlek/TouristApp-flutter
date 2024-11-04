import 'package:faks/style/text_styles.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

extension StyleExtensions on BuildContext {
  Color get colorGradientBegin => Theme.of(this).extension<AppColors>()!.gradientBegin!;
  Color get colorGradientEnd => Theme.of(this).extension<AppColors>()!.gradientEnd!;
  Color get colorText => Theme.of(this).extension<AppColors>()!.text!;

  TextStyle get textButton => Theme.of(this).textTheme.buttonTextStyle;
  TextStyle get textSubtitle => Theme.of(this).textTheme.subtitleTextStyle;
}
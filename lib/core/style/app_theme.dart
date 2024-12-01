import 'package:flutter/material.dart';

import 'colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: backgroundColorLight,
  extensions: const [
    AppColors(
      text: textColorLight,
      background: backgroundColorLight,
      border: borderColorLight,
      error: errorColorLight,
      gradientBegin: gradientBeginColorLight,
      gradientEnd: gradientEndColorLight,
      cardText: cardTextColorLight,
    ),
  ],
);

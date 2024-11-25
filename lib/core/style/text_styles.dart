import 'package:flutter/material.dart';

const _buttonTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
const _subtitleTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
const _titleTextStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
const _descriptionTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

extension CustomTextStyle on TextTheme {
  TextStyle get buttonTextStyle => _buttonTextStyle;
  TextStyle get subtitleTextStyle => _subtitleTextStyle;
  TextStyle get titleTextStyle => _titleTextStyle;
  TextStyle get descriptionTextStyle => _descriptionTextStyle;
}
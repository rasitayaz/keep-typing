import 'package:flutter/material.dart';
import 'package:keep2yourself/utils/colors.dart';

const font = TextStyle(fontFamily: 'Poppins');

extension TextStyleExtension on TextStyle {
  TextStyle get light => copyWith(color: Colors.white);
  TextStyle get dark => copyWith(color: Colors.black);
  TextStyle get grey => copyWith(color: AppColors.grey);

  TextStyle get s16 => copyWith(fontSize: 16);
  TextStyle get s32 => copyWith(fontSize: 32);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
}

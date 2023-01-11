import 'package:flutter/material.dart';
import 'package:keep_typing/utils/font.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Poppins',
    textTheme: TextTheme(bodyText2: font.light),
    iconTheme: const IconThemeData(color: Colors.white),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white,
      contentTextStyle: font.dark,
    ),
  );
}

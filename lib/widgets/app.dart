import 'package:flutter/material.dart';
import 'package:keep_typing/utils/theme.dart';
import 'package:keep_typing/widgets/landing_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.account,
  });

  final GoogleSignInAccount account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(account.displayName ?? account.email)),
    );
  }
}

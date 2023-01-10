import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final oauth = useMemoized(GoogleSignIn.new);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final account = await oauth.signIn();
            if (account != null) {
              print(account.displayName);
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}

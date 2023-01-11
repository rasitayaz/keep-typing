import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:keep_typing/extensions/context_extension.dart';
import 'package:keep_typing/utils/colors.dart';
import 'package:keep_typing/utils/font.dart';
import 'package:keep_typing/utils/gap.dart';
import 'package:keep_typing/widgets/bouncing.dart';
import 'package:keep_typing/widgets/button.dart';
import 'package:keep_typing/widgets/home_page.dart';

class LandingPage extends HookWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = useMemoized(GoogleSignIn.new);

    void redirect(GoogleSignInAccount? account) {
      if (account != null) {
        context.pushAndClear(HomePage(account: account));
      } else {
        context.showError(
          'Authentication failed, please try again later.',
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Gap.large),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Keep', style: font.s32.extraBold),
                    const SizedBox(width: Gap.small),
                    const FaIcon(FontAwesomeIcons.solidPenToSquare),
                  ],
                ),
                const SizedBox(height: Gap.large),
                Button(
                  label: const Text('Sign in with'),
                  suffix: const FaIcon(FontAwesomeIcons.google),
                  onPressed: () async {
                    final account = await auth.signIn();
                    redirect(account);
                  },
                ),
                const Spacer(),
                Bouncing(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.github,
                        color: AppColors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: Gap.tiny),
                      Text.rich(
                        TextSpan(
                          style: font.grey,
                          children: [
                            const TextSpan(text: 'Created by '),
                            TextSpan(text: 'Raşit Ayaz', style: font.extraBold),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

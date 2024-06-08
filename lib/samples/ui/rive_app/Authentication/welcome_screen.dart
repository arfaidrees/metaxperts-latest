import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/Authentication/signin_screen.dart';
import 'package:flutter_samples/samples/ui/rive_app/Authentication/signup_screen.dart';
import '../../../../themee/theme.dart';
import '../../../../widgets/custom_scaffold.dart';
import '../../../../widgets/welcome_button.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 40.0,
            ),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome bookers!\n',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                      '\nPlease enter your personal details to create your employee account.',
                      style: TextStyle(
                        fontSize: 20,
                        color: lightColorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

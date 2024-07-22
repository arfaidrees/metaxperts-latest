import 'package:flutter/material.dart';
import '../../../../themee/theme.dart';
import '../../../../widgets/custom_scaffold.dart';
import '../../../../widgets/welcome_button.dart';
import '../theme.dart';
import 'companyregisteration.dart';
import 'signin_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
                        fontFamily: "avenir next",
                        color: RiveAppTheme.accentColor,
                      ),
                    ),
                    TextSpan(
                      text:
                      '\nPlease enter your personal details to create your employee account.',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "avenir next",
                        color: RiveAppTheme.accentColor,
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
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Log in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: RiveAppTheme.accentColor,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Register',
                      onTap: const CompanyRegistration(),
                      color: RiveAppTheme.accentColor,
                      textColor: Colors.white,
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

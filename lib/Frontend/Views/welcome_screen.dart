import 'package:flutter/material.dart';
import '../Ignore/custom_scaffold.dart';
import '../Components/theme.dart';
import '../Components/welcome_button.dart';
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
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome Bookers!\n',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "avenir next",
                      color: RiveAppTheme.purple,
                    ),
                  ),
                  TextSpan(
                    text:
                    '\nPlease enter your personal details to create your employee account.',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "avenir next",
                      color: RiveAppTheme.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 1),
          const Flexible(
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
                      textColor: RiveAppTheme.purple,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Register',
                      onTap: CompanyRegistration(),
                      color: RiveAppTheme.purple,
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

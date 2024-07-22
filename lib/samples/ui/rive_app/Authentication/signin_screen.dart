import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/Authentication/companyregisteration.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../themee/theme.dart';
import '../../../../widgets/custom_scaffold.dart';
import '../home.dart';
import '../theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          child: Form(
            key: _formSignInKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.0),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: RiveAppTheme.accentColor,
                    fontFamily: "avenir next",
                  ),
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: RiveAppTheme.accentColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: RiveAppTheme.accentColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberPassword = value!;
                            });
                          },
                          activeColor: lightColorScheme.primary,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Text(
                        'Forget password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: RiveAppTheme.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formSignInKey.currentState!.validate() &&
                          rememberPassword) {
                        // Navigate to Menu.dart using GetX
                        Get.to(() => const RiveAppHome());
                      } else if (!rememberPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please agree to the processing of personal data')),
                        );
                      }
                    },
                    child: const Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RiveAppTheme.accentColor, // Button color
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompanyRegistration(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: RiveAppTheme.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

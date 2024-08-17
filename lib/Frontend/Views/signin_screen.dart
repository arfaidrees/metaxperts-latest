import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../Components/home.dart';
import '../Components/theme.dart';
import 'companyregisteration.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool _isPasswordVisible = false;

  InputDecoration buildInputDecoration(String labelText, IconData icon, {bool isPassword = false}) {
    return InputDecoration(
      hintText: labelText,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontSize: 14.0,
      ),
      prefixIcon: Icon(icon, color: RiveAppTheme.purple),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: RiveAppTheme.purple,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: RiveAppTheme.purple,
        ),
      ),
      suffixIcon: isPassword
          ? IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: RiveAppTheme.purple,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: RiveAppTheme.purple,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Log in',
          style: TextStyle(
            fontFamily: 'Avenir Next',
            fontSize: 17,
            color: RiveAppTheme.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(27.0, 10.0, 27.0, 20.0),
          child: Form(
            key: _formSignInKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80.0),
                TextFormField(
                  decoration: buildInputDecoration('Email', Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: buildInputDecoration('Password', Icons.lock, isPassword: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
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
                          activeColor: RiveAppTheme.purple,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            fontFamily: 'Avenir Next',
                            color: Colors.black45,
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: const Text(
                        'Forget password?',
                        style: TextStyle(
                          fontFamily: 'Avenir Next',
                          fontWeight: FontWeight.bold,
                          color: RiveAppTheme.purple,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7.0),
                SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    width: 50, // Set the desired width
                    height: 40, // Set the desired height
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formSignInKey.currentState!.validate() && rememberPassword) {
                          Get.to(() => const RiveAppHome());
                        } else if (!rememberPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please agree to the processing of personal data'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: RiveAppTheme.purple,
                        padding: EdgeInsets.zero, // Remove default padding
                        textStyle: const TextStyle(fontSize: 14), // Adjust font size
                      ),
                      child: const Text('Sign in'),
                    ),
                  ),
                ),
                const SizedBox(height: 9.0),
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
                const SizedBox(height: 7.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontFamily: 'Avenir Next',
                        fontSize: 14.0,
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
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: RiveAppTheme.purple,
                          fontFamily: 'Avenir Next',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

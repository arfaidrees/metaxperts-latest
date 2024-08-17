import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../Components/theme.dart';
import 'signin_screen.dart';

class CompanyRegistration extends StatefulWidget {
  const CompanyRegistration({super.key});

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  bool _isPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;

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
          'Company Registeration',
          style: TextStyle(
            fontFamily: 'Avenir Next',
            fontSize: 17,
            color: RiveAppTheme.purple,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
          child: Form(
            key: _formSignupKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: buildInputDecoration('Company Name', Icons.business),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Company Address
                TextFormField(
                  decoration: buildInputDecoration('Company Address', Icons.location_on),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Company Email
                TextFormField(
                  decoration: buildInputDecoration('Company Email', Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Owner Name
                TextFormField(
                  decoration: buildInputDecoration('Owner Name', Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Owner Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Owner Email
                TextFormField(
                  decoration: buildInputDecoration('Owner Email', Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Owner Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Phone Number
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: buildInputDecoration('Phone Number', Icons.phone),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone Number';
                    } else if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid 11-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Alternative Phone Number
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: buildInputDecoration('Alternative Phone Number', Icons.phone_android),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Alternative Phone Number';
                    } else if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid 11-digit alternative phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // Password
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
                // Reconfirm Password
                TextFormField(
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: buildInputDecoration('Re-confirm Password', Icons.lock_outline, isPassword: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please reconfirm Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7.0),
                // I agree to the processing
                Row(
                  children: [
                    Checkbox(
                      value: agreePersonalData,
                      onChanged: (bool? value) {
                        setState(() {
                          agreePersonalData = value!;
                        });
                      },
                      activeColor: RiveAppTheme.purple,
                    ),
                    const Text(
                      'I agree to the process ',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        color: Colors.black45,
                        fontSize: 13.0,
                      ),
                    ),
                    const Text(
                      'Personal data',
                      style: TextStyle(
                        fontFamily: 'Avenir Next',
                        fontWeight: FontWeight.bold,
                        color: RiveAppTheme.purple,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7.0),
                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formSignupKey.currentState!.validate() && agreePersonalData) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                        } else if (!agreePersonalData) {
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
                      child: const Text('Register'),
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
                      'Already have an account? ',
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
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log in',
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

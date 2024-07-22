import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/ui/rive_app/Authentication/signin_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../themee/theme.dart';
import '../theme.dart';

class CompanyRegistration extends StatefulWidget {
  const CompanyRegistration({super.key});

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          child: Form(
            key: _formSignupKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                const Text(
                  'Company Registration',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: RiveAppTheme.background2,
                  ),
                ),
                const SizedBox(height: 40.0),
                // Company Name
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'Enter Company Name',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    prefixIcon: const Icon(Icons.business, color: RiveAppTheme.accentColor), // Icon for Company Name
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Company Address
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Company Address',
                    hintText: 'Enter Company Address',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    prefixIcon: const Icon(Icons.location_on, color: RiveAppTheme.accentColor), // Icon for Company Address
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Company Email
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Company Email',
                    hintText: 'Enter Company Email',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    prefixIcon: const Icon(Icons.email, color: RiveAppTheme.accentColor), // Icon for Company Email
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Owner Name
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Owner Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Owner Name',
                    hintText: 'Enter Owner Name',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    prefixIcon: const Icon(Icons.person, color: RiveAppTheme.accentColor), // Icon for Owner Name
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Owner Email
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Owner Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Owner Email',
                    hintText: 'Enter Owner Email',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    prefixIcon: const Icon(Icons.email, color: RiveAppTheme.accentColor), // Icon for Owner Email
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Phone Number
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone Number';
                    } else if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid 11-digit phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.phone, color: RiveAppTheme.accentColor), // Icon for Phone Number
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Alternative Phone Number
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Alternative Phone Number';
                    } else if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid 11-digit alternative phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Alternative Phone Number',
                    hintText: 'Enter Alternative Phone Number',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.phone, color: RiveAppTheme.accentColor), // Icon for Alternative Phone Number
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Password
                TextFormField(
                  obscureText: !_isPasswordVisible,
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
                    prefixIcon: const Icon(Icons.lock, color: RiveAppTheme.accentColor), // Icon for Password
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: RiveAppTheme.accentColor, // Eye icon color
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                // Reconfirm Password
                TextFormField(
                  obscureText: !_isConfirmPasswordVisible,
                  obscuringCharacter: '*',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please reconfirm Password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Re-confirm Password',
                    hintText: 'Re-confirm Password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: RiveAppTheme.accentColor,
                    ), // Icon for Re-confirm Password
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: RiveAppTheme.accentColor, // Eye icon color
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                          !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
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
                      activeColor: RiveAppTheme.accentColor, // Checkbox color
                    ),
                    const Text(
                      'I agree to the process ',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    const Text(
                      'Personal data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: RiveAppTheme.background2, // Personal data text color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formSignupKey.currentState!.validate() &&
                          agreePersonalData) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      } else if (!agreePersonalData) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please agree to the processing of personal data'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RiveAppTheme.accentColor, // Button background color
                    ),
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: 30.0),
                // Divider for "Sign up with"
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
                const SizedBox(height: 30.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black45,
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
                          color: RiveAppTheme.accentColor, // Log in text color
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

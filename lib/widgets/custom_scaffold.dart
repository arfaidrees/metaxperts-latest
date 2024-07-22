import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Set the background color to white
          ),
          Positioned(
            top: 290, // Adjust this value to move the GIF lower
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 300, // Specify the desired width
                height: 300, // Specify the desired height
                child: Image.asset(
                  'assets/images/1st.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}

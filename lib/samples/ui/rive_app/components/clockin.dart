import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class Clockin extends StatelessWidget {
  const Clockin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnalogClock(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            width: 230.0,
            isLive: true,
            hourHandColor: Colors.black,
            minuteHandColor: Colors.black,
            showSecondHand: false,
            numberColor: Colors.black87,
            showNumbers: true,
            showAllNumbers: false,
            textScaleFactor: 1.4,
            showTicks: true,
            showDigitalClock: false,
            datetime: DateTime(2024, 1, 1, 9, 12, 15),
          ),
        ),
      ),
    );
  }
}

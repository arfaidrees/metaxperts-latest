import 'dart:async';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

import '../Components/theme.dart';

class Clockin extends StatefulWidget {
  const Clockin({Key? key}) : super(key: key);

  @override
  State<Clockin> createState() => _ClockinState();
}

class _ClockinState extends State<Clockin> {
  String hoursString = "00", minuteString = "00", secondString = "00";
  int hours = 0, minutes = 0, seconds = 0;
  bool isTimerRunning = false, isResetButtonVisible = false;
  late Timer _timer;

  void startTimer() {
    setState(() {
      isTimerRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _startSecond();
    });
  }

  void pauseTimer() {
    _timer.cancel();
    setState(() {
      isTimerRunning = false;
    });
    isResetButtonVisible = checkValues();
  }

  void _startSecond() {
    setState(() {
      if (seconds < 59) {
        seconds++;
        secondString = seconds.toString().padLeft(2, '0');
      } else {
        _startMinute();
      }
    });
  }

  void _startMinute() {
    setState(() {
      if (minutes < 59) {
        seconds = 0;
        secondString = "00";
        minutes++;
        minuteString = minutes.toString().padLeft(2, '0');
      } else {
        _startHour();
      }
    });
  }

  void _startHour() {
    setState(() {
      seconds = 0;
      minutes = 0;
      secondString = "00";
      minuteString = "00";
      hours++;
      hoursString = hours.toString().padLeft(2, '0');
    });
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;
      secondString = "00";
      minuteString = "00";
      hoursString = "00";
      isResetButtonVisible = false;
    });
  }

  bool checkValues() {
    return seconds != 0 || minutes != 0 || hours != 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 180),
          Expanded(
            child: Center(
              child: AnalogClock(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: lightColorScheme.primary),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                width: 230.0,
                isLive: true,
                hourHandColor: const Color(0xFF416FDF),
                minuteHandColor: Colors.black,
                secondHandColor: Colors.red,
                showSecondHand: true,
                numberColor: Colors.black87,
                showNumbers: false,
                showAllNumbers: false,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: false,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hoursString,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF416FDF), // Blue color for hours
                      ),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    Text(
                      minuteString,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    Text(
                      secondString,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (isTimerRunning) {
                      pauseTimer();
                    } else {
                      startTimer();
                    }
                  },
                  child: Text(isTimerRunning ? "Clockout" : "Clock in"),
                ),
                const SizedBox(height: 20),
                isResetButtonVisible
                    ? ElevatedButton(
                  onPressed: resetTimer,
                  child: const Text("Reset"),
                )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

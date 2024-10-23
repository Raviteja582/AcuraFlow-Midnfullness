import 'package:flutter/material.dart';
import 'dart:async';

class QuickWalkScreen extends StatefulWidget {
  const QuickWalkScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuickWalkScreenState createState() => _QuickWalkScreenState();
}

class _QuickWalkScreenState extends State<QuickWalkScreen> {
  final int _initialDuration = 180; // 3 minutes (3 minutes * 60 seconds)
  int _duration = 180;
  bool _isTimerRunning = false;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration > 0) {
        setState(() {
          _duration--;
        });
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  void _pauseTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _duration = _initialDuration;
      _isTimerRunning = false;
    });
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Take a Quick Walk..',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              width: 250,
              height: 250,
              padding: const EdgeInsets.only(top: 3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Image.asset('assets/walking_2.gif'),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 5.0,
                right: 20.0,
                bottom: 0.0,
                left: 20.0,
              ),
              child: const Text(
                'Start the timer, step into serenity, and finish feeling recharged and mindful, one stride at a time..',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(
                top: 0.0,
                right: 20.0,
                bottom: 0.0,
                left: 20.0,
              ),
              child: Text(
                _formatDuration(_duration),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(70.0, 30.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    if (!_isTimerRunning) {
                      _startTimer();
                    }
                    setState(() {
                      _isTimerRunning = true;
                    });
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(70.0, 30.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    if (_isTimerRunning) {
                      _pauseTimer();
                    }
                    setState(() {
                      _isTimerRunning = false;
                    });
                  },
                  child: const Text(
                    'Pause',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(70.0, 30.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    if (_isTimerRunning) {
                      _pauseTimer();
                    }
                    _resetTimer();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

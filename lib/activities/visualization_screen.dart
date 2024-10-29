import 'package:flutter/material.dart';
import 'dart:async';

class AlarmPage extends StatefulWidget {
  const AlarmPage(this.title, {super.key});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
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
          title: Text(
            widget.title,
            style: const TextStyle(fontFamily: 'Playwrite'),
          ),
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Take a Quick Walk to outer world!!! IMAGINE',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Playwrite'),
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
                        child: Image.asset('assets/genjutsu.gif'),
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
                      'Start the timer, step into serenity of the world of genjutsu',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'Playwrite'),
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
                          color: Colors.white,
                          fontFamily: 'Playwrite'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(70, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.black,
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/button_bg.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 30,
                            child: const Text(
                              'start',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Playwrite'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (!_isTimerRunning) {
                            _startTimer();
                          }
                          setState(() {
                            _isTimerRunning = true;
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(70, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.black,
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/button_bg.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 30,
                            child: const Text(
                              'pause',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Playwrite'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_isTimerRunning) {
                            _pauseTimer();
                          }
                          setState(() {
                            _isTimerRunning = false;
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(70, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.black,
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/button_bg.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 30,
                            child: const Text(
                              'reset',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Playwrite'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_isTimerRunning) {
                            _pauseTimer();
                          }
                          _resetTimer();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

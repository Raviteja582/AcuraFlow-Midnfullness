import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlarmPage(),
    );
  }
}
class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  int _initialDuration = 180; // 3 minutes (3 minutes * 60 seconds)
  int _duration = 180;
  bool _isTimerRunning = false;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
            Container(
              child: const Text(
                'Take a Quick Walk to outer world!!! IMAGINE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 250,
              height: 250,
              padding: EdgeInsets.only(top: 3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Container(
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
                '${_formatDuration(_duration)}',
                style: TextStyle(
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

/*
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlarmPage(),
    );
  }
}

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late TimeOfDay selectedTime;
  bool isAlarmSet = false;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<dynamic> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // Handle notification when the app is in foreground
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification when user taps on it
  }

  Future<void> _scheduleNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_channel_id',
      'Alarm',
      'Scheduled alarm notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Alarm',
      'Time to wake up!',
      Time(selectedTime.hour, selectedTime.minute),
      platformChannelSpecifics,
    );
  }

  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                selectedTime = (await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ))!;
                if (selectedTime != null) {
                  setState(() {
                    isAlarmSet = true;
                  });
                  await _scheduleNotification();
                }
              },
              child: Text('Set Alarm'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (isAlarmSet) {
                  await _cancelNotification();
                  setState(() {
                    isAlarmSet = false;
                  });
                }
              },
              child: Text('Cancel Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
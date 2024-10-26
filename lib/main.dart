import 'package:flutter/material.dart';
import 'journalling_screen.dart';
import 'meditation_screen.dart';
import 'sleep_screen.dart';
import 'activities/activity_breaks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuraFlow - Mindfullness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AuraFlow - Mindfullness'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'Playwrite'),
        ),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              padding: const EdgeInsets.only(top: 3.0, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Image.asset('assets/mindfullness_home_image.png'),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MeditationScreen(),
                    ));
                  },
                  child: const Text(
                    'Meditation',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'Playwrite'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SleepScreen(),
                    ));
                  },
                  child: const Text(
                    'Sleep',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'Playwrite'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ActivityBreaksScreen(),
                    ));
                  },
                  child: const Text(
                    'Activity Breaks',
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Playwrite'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotepadScreen(),
                    ));
                  },
                  child: const Text(
                    'Journalling',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'Playwrite'),
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

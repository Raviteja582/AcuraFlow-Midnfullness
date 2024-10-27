import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'affirmation_model.dart';
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
      title: 'AuraFlow - Mindfulness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AuraFlow - Mindfulness'),
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
  late Future<Affirmation?> _affirmation;

  @override
  void initState() {
    super.initState();
    _affirmation = _getAffirmationForToday();
  }

  Future<Affirmation?> _getAffirmationForToday() async {
    final dbHelper = DatabaseHelper.instance;
    int? lastId = await dbHelper.getLastShownAffirmationId();
    int nextId = (lastId == null || lastId >= 9) ? 0 : lastId + 1;
    Affirmation? affirmation = await dbHelper.getAffirmation(nextId);
    await dbHelper.setLastShownAffirmationId(nextId);
    return affirmation;
  }

  void _showAffirmationPopup(Affirmation affirmation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Daily Affirmation'),
          content: Text(affirmation.text),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Affirmation?>(
      future: _affirmation,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (snapshot.data != null) _showAffirmationPopup(snapshot.data!);
          });
        }
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
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
                            child: Image.asset(
                                'assets/mindfullness_home_image.png'),
                          ),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(150, 70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.black,
                              side: const BorderSide(
                                  color: Colors.grey, width: 2.0),
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
                                width: 150,
                                height: 70,
                                child: const Text(
                                  'Meditation',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'Playwrite'),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MeditationScreen(),
                              ));
                            },
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(150, 70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.black,
                              side: const BorderSide(
                                  color: Colors.grey, width: 2.0),
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
                                width: 150,
                                height: 70,
                                child: const Text(
                                  'Sleep',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'Playwrite'),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SleepScreen(),
                              ));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(150, 70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.black,
                              side: const BorderSide(
                                  color: Colors.grey, width: 2.0),
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
                                width: 150,
                                height: 70,
                                child: const Text(
                                  'Activity',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'Playwrite'),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ActivityBreaksScreen(),
                              ));
                            },
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(150, 70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.black,
                              side: const BorderSide(
                                  color: Colors.grey, width: 2.0),
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
                                width: 150,
                                height: 70,
                                child: const Text(
                                  'Journalling',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontFamily: 'Playwrite'),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const NotepadScreen("Journalling"),
                              ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'stretch_screen.dart';
import 'desk_yoga.dart';
import 'quick_walk.dart';
import 'visualization_screen.dart';
import 'laughter_screen.dart';

class ActivityBreaksScreen extends StatefulWidget {
  const ActivityBreaksScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ActivityBreaksScreenState createState() => _ActivityBreaksScreenState();
}

class _ActivityBreaksScreenState extends State<ActivityBreaksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "Activites",
            style: TextStyle(fontFamily: 'Playwrite'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(250, 70),
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
                            width: 250,
                            height: 70,
                            child: const Text(
                              'Stretch',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Playwrite'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StretchScreen("Body Stretch"),
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
                          minimumSize: const Size(250, 70),
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
                            width: 250,
                            height: 70,
                            child: const Text(
                              'Desk Yoga',
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
                                const DeskYogaScreen("Desk Yoga"),
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
                          minimumSize: const Size(250, 70),
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
                            width: 250,
                            height: 70,
                            child: const Text(
                              'Quick Walk',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Playwrite'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const QuickWalkScreen(),
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
                          minimumSize: const Size(250, 70),
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
                            width: 250,
                            height: 70,
                            child: const Text(
                              'Visualization',
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
                                const AlarmPage("Visualization"),
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
                          minimumSize: const Size(250, 70),
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
                            width: 250,
                            height: 70,
                            child: const Text(
                              'Laughter',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'Playwrite'),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LaughterScreen(),
                          ));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ));
  }
}

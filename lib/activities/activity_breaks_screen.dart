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
          children: <Widget>[
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
                    fixedSize: const Size(250.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StretchScreen(),
                    ));
                  },
                  child: const Text(
                    'Stretch',
                    style: TextStyle(fontSize: 16.0),
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
                    fixedSize: const Size(250.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DeskYogaScreen(),
                    ));
                  },
                  child: const Text(
                    'Desk Yoga',
                    style: TextStyle(fontSize: 16.0),
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
                    fixedSize: const Size(250.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QuickWalkScreen(),
                    ));
                  },
                  child: const Text(
                    'Quick Walk',
                    style: TextStyle(fontSize: 16.0),
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
                    fixedSize: const Size(250.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AlarmPage(),
                    ));
                  },
                  child: const Text(
                    'Visualization',
                    style: TextStyle(fontSize: 16.0),
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
                    fixedSize: const Size(250.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LaughterScreen(),
                    ));
                  },
                  child: const Text(
                    'Laughter',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            /* Row(
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
                    fixedSize: const Size(250.0, 70.0),
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MusicScreen(),
                    ));
                  },
                  child: const Text(
                    'Gentle Music',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),*/
          ],
        ),
      ),
    );
  }
}

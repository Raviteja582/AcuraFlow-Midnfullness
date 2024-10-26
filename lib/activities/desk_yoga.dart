import 'package:flutter/material.dart';

List<String> instructions = [
  'Neck Stretch: Gently tilt your head to the right, bringing your right ear toward your right shoulder. Hold for 15 seconds, then switch to the left side.',
  'Shoulder Rolls: Shrug your shoulders up towards your ears, then roll them back and down. Repeat this motion for 30 seconds.',
  'Seated Forward Bend: Sit at the edge of your chair and extend your arms forward. Slowly bend at the hips, reaching towards your toes or the floor. Hold for 20 seconds.',
  'Seated Spinal Twist: Sit up straight, cross your right ankle over your left knee, and gently twist your upper body to the right. Hold for 15 seconds, then switch sides.',
  'Wrist and Finger Stretches: Extend your arms straight in front of you and make fists, then open your hands wide. Repeat this motion several times to relieve tension in your wrists and fingers.',
  'Seated Cat-Cow: While seated, arch your back as you inhale, then round your back as you exhale. Repeat for 30 seconds.',
  'Seated Ankle Rolls: Lift your feet off the ground and roll your ankles in both directions for 15 seconds on each side.',
];

class DeskYogaScreen extends StatelessWidget {
  const DeskYogaScreen(this.title, {super.key});
  final String title;
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
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.png'), // Specify the image path
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Text(
                        'Desk Yoga for Stress Relief..',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Playwrite',
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Sit comfortably in your chair with your feet flat on the ground and your back straight. Start with a few deep breaths to center yourself and relax.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Playwrite'),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      height: 235,
                      child: Image.asset('assets/Desk_Yoga_Image.jpg'),
                    ),
                  ]),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Instructions:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Playwrite',
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      ...instructions.map((instruction) => Text(
                            '• $instruction',
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Playwrite'),
                            textAlign: TextAlign.justify,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}

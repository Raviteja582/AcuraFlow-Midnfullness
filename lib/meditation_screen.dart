import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

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
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text(
              'Inner Harmony: Guided Meditation Journeys..',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              'Discover inner tranquility and transform your life through the power of meditation – find your calm within the chaos.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          VideoPlayerWidget(videoAsset: 'assets/video_1.mp4'),
          const SizedBox(height: 5.0),
          const Text(
            '5-Minute Meditation You Can Do Anywhere',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          VideoPlayerWidget(videoAsset: 'assets/video_2.mp4'),
          const SizedBox(height: 5.0),
          const Text(
            '10-Minute Meditation for Beginners',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          VideoPlayerWidget(videoAsset: 'assets/video_3.mp4'),
          const SizedBox(height: 5.0),
          const Text(
            '15-Minute Meditation for Self Love',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoAsset;

  VideoPlayerWidget({required this.videoAsset});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool _isVideoInitializing = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset(widget.videoAsset);
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9, // Adjust this to match your video's aspect ratio
      autoInitialize: true,
      autoPlay: false,
      looping: false,
    );

    if (mounted) {
      setState(() {
        _isVideoInitializing = false;
      });
    }
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 300.0, // Set a fixed width
            height: 200.0, // Set a fixed height
            child: _isVideoInitializing
                ? (Container(
                    width: 40.0, // Set a fixed width
                    height: 40.0, // Set a fixed height
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.black), // Set the color
                        strokeWidth: 3.0, // Set the stroke width
                      ),
                    ),
                  )) // Set the stroke width) // Display a loading indicator
                : Chewie(controller: _chewieController),
          ),
        ],
      ),
    );
  }
}

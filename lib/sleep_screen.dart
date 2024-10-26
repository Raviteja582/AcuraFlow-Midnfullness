import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

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
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text(
              'A Guide to a Restful Sleep',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Playwrite'
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              'Improve your concentration, emotional ressilence and overall well-being, enabling a more present and mindful life.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                fontFamily: 'Playwrite'
              ),
              textAlign: TextAlign.center,
            ),
          ),
          VideoPlayerWidget(videoAsset: 'assets/video_4.mp4'),
          SizedBox(height: 5.0),
          Text(
            'ULTIMATE DEEP SLEEP music- Healing INSOMNIA',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playwrite'
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          VideoPlayerWidget(videoAsset: 'assets/video_5.mp4'),
          SizedBox(height: 5.0),
          Text(
            '10-Minute Meditation for Sleep',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playwrite'
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoAsset;

  const VideoPlayerWidget({super.key, required this.videoAsset});

  @override
  // ignore: library_private_types_in_public_api
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
          SizedBox(
            width: 300.0, // Set a fixed width
            height: 200.0, // Set a fixed height
            child: _isVideoInitializing
                ? (const SizedBox(
                    width: 40.0, // Set a fixed width
                    height: 40.0, // Set a fixed height
                    child: Center(
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

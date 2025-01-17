import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "Meditation",
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
              child: ListView(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Text(
                      'Inner Harmony: Guided Meditation Journeys..',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Playwrite'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(
                      'Discover inner tranquility and transform your life through the power of meditation – find your calm within the chaos.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Playwrite'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  VideoPlayerWidget(videoAsset: 'assets/video_1.mp4'),
                  SizedBox(height: 5.0),
                  Text(
                    '5-Minute Meditation You Can Do Anywhere',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Playwrite'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  VideoPlayerWidget(videoAsset: 'assets/video_2.mp4'),
                  SizedBox(height: 5.0),
                  Text(
                    '10-Minute Meditation for Beginners',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Playwrite'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  VideoPlayerWidget(videoAsset: 'assets/video_3.mp4'),
                  SizedBox(height: 5.0),
                  Text(
                    '15-Minute Meditation for Self Love',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Playwrite'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            )
          ],
        ));
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoAsset;

  const VideoPlayerWidget({super.key, required this.videoAsset});

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
      aspectRatio: 16 / 9,
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
            width: 300.0,
            height: 200.0,
            child: _isVideoInitializing
                ? (const SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.black),
                        strokeWidth: 3.0,
                      ),
                    ),
                  ))
                : Chewie(controller: _chewieController),
          ),
        ],
      ),
    );
  }
}

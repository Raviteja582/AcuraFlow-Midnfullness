import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gentle Music",
          style: TextStyle(fontFamily: 'Playwrite'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Music can help you relax.',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playwrite'),
              textAlign: TextAlign.justify,
            ),
          ),
          const VideoPlayerWidget(videoAsset: 'assets/myvideo_4.mp4'),
          const SizedBox(height: 10.0),
          const VideoPlayerWidget(videoAsset: 'assets/myvideo_5.mp4'),
          const SizedBox(height: 10.0),
          const VideoPlayerWidget(videoAsset: 'assets/myvideo_6.mp4'),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(100, 30),
            ),
            child: const Text(
              "Back to Home",
              style: TextStyle(fontFamily: 'Playwrite'),
            ),
          ),
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
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }
}

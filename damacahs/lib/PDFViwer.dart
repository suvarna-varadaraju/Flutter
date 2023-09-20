import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';

class PDFViwer extends StatefulWidget {
  String type;
  PDFViwer({required this.type});

  @override
  State<PDFViwer> createState() => _VideoPlayerScreenState(type);
}

class _VideoPlayerScreenState extends State<PDFViwer> {
  final String myString;
  bool isListViewOpen = false;
  _VideoPlayerScreenState(this.myString);
  String imageVideo = "image";
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  late Future<void> _initializeVideoPlayerFuture;
  late List<String> casaCanal = [];
  late List<String> oneCanal = [];
  late List<String> oneCrescent = [];
  late List<String> serenity = [];
  late List<String> amara = [];
  late List<String> serene = [];
  late List<String> alzea = [];
  late List<String> sunRays = [];

  void initState() {
    super.initState();
    double _aspectRatio = 16 / 9;

    if(myString == "casacanal"){
      imageVideo = "video";
      _controller = VideoPlayerController.asset("assets/video/casacanal_5sec.mp4");
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        allowFullScreen: true,
        zoomAndPan: true,
        aspectRatio: _aspectRatio,
        showControls: false,
      );
      _chewieController.enterFullScreen();

      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    }else if(myString == "onecanal"){
      imageVideo = "video";
      _controller = VideoPlayerController.asset("assets/video/onecanal_5sec.mp4");
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        allowFullScreen: true,
        zoomAndPan: true,
        aspectRatio: _aspectRatio,
        showControls: false,
      );
      _chewieController.enterFullScreen();

      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    }else if(myString == "onecresent"){
      imageVideo = "video";
      _controller = VideoPlayerController.asset("assets/video/onecresent_5sec.mp4");
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        allowFullScreen: true,
        zoomAndPan: true,
        aspectRatio: _aspectRatio,
        showControls: false,
      );
      _chewieController.enterFullScreen();

      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    }else if(myString == "searenity"){
      imageVideo = "video";
      _controller = VideoPlayerController.asset("assets/video/serenity.mp4");
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        allowFullScreen: true,
        zoomAndPan: true,
        aspectRatio: _aspectRatio,
        showControls: false,
      );
      _chewieController.enterFullScreen();

      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ColorConstants.kPrimaryColor,// Left arrow icon
          onPressed: () {
            // Handle the back button press or navigation here
            Navigator.pop(context); // Example: Navigate back
          },
        ),
        title: const Text(
          'Residental',
          style: TextStyle(
            color: ColorConstants.kPrimaryColor,
            fontFamily: 'Montserrat',// Text color
            fontSize: 24, // Font size
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
        centerTitle: true, // Center the title horizontally
        backgroundColor: Colors.white, // Center-aligned text
        actions: [
          IconButton(
            icon: Icon(Icons.download,color: ColorConstants.kPrimaryColor), // Right-side image icon
            onPressed: () {
              // Handle the right-side image button press here
              // Example: Open a menu or perform an action
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://drive.google.com/uc?export=view&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS',
      ),
    );
  }

}


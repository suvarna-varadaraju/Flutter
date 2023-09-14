import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';

class Contactus extends StatefulWidget {
  Contactus({super.key});

  @override
  State<Contactus> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Contactus> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  PageController _pageController = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;

  void initState() {
    super.initState();
    double _aspectRatio = 16 / 9;
    _controller = VideoPlayerController.asset("assets/video/aboutcompany.mp4");
    _controller.initialize();
    _controller.setLooping(true);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      looping: true,
      aspectRatio: _aspectRatio,
      showControls: false,
    );

    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      // If the video is paused, play it.
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'About us',
            style: TextStyle(
              color: ColorConstants.kPrimaryColor,
              fontFamily: 'Montserrat',// Text color
              fontSize: 24, // Font size
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
          centerTitle: true, // Center the title horizontally
          backgroundColor: Colors.white, // AppBar background color
        ),
        body: SingleChildScrollView(
          child : Column(
            children: [
              Container(
                width: double.infinity,
                height: 280, // Set the height as needed
                child: VideoPlayer(_controller),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                child: const Column(
                    children: [
                      Text("PHONE", style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text("+971 44581821",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                child: Column(
                    children: [
                      Text("EMAIL", style: const TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text("info@ahsproperties.com",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                child: Column(
                    children: [
                      Text("LOCATION", style: const TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height:10),
                IntrinsicHeight(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center, // Vertically center the column
                                  children: <Widget>[
                                    Text(
                                      'CORPORATE OFFICE',
                                        textAlign: TextAlign.center,
                                     style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)
                                    ),
                                    SizedBox(height:10),
                                    Text(
                                      'Damac Executive \nHeights, 23rd floor \nTecom, Dubai',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.normal,color: ColorConstants.kLiteBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1,
                              width: 50,
                              color: ColorConstants.kPrimaryColor,
                            ),
                            Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center, // Vertically center the column
                                  children: <Widget>[
                                    Text(
                                      'SALES CENTER',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack),
                                    ),
                                    SizedBox(height:10),
                                    Text(
                                      'City Walk, Building 5, \nUnit 2, Happiness \nStreet, Dubai',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.normal,color: ColorConstants.kLiteBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,10.0,20.0,10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Divider(
                              color: ColorConstants.kPrimaryColor
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,10.0,20.0,10.0),
                child: Column(
                    children: [
                      Text("THE HISTROY OF AHS", style: const TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height:10),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text("AHS Group excels in real estate, prioritizing excellence, innovation, and service. A leading player, it provides remarkable value to stakeholders and clients.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
                      ),
                    ]),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 120.0,
                       // child: ProgressIndicatorWidget()
                    ),
                    Column(
                      children: <Widget>[
                        //CardWidget(image: "assets/image/history_2017.jpg"),
                        Container(
                          width: 200.0,
                          height: 200.0,
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "With a focus on excellence, innovation, and impeccable service, AHS Group has grown to establish itself as a leading player in the real estate and development industry, delivering exceptional value to all its stakeholders and clientele alike.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align row items
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 16, bottom: 16),
                      child: ProgressIndicatorWidget(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CardWidget(),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "With a focus on excellence, innovation, and impeccable service, AHS Group has grown to establish itself as a leading player in the real estate and development industry, delivering exceptional value to all its stakeholders and clientele alike.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),*/
              ),
            ],
          ),
        )
    );
  }
}
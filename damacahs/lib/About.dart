import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';

class About extends StatefulWidget {
  About({super.key});

  @override
  State<About> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<About> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  PageController _pageController = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;

  void initState() {
    super.initState();
    double _aspectRatio = 16 / 9;
    _controller = VideoPlayerController.asset("assets/video/histroy.mp4");
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
              // Second layout
              Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white, // Container background color
                    image: DecorationImage(
                      image: AssetImage('assets/image/band.jpg'), // Replace with your image asset path
                      fit: BoxFit.cover, // Adjust how the image fits the container
                    ),
                  ),
                  // You can add other child widgets here if needed
                  child: Center(child: Text(
                    "INSPIRING THROUGH INNOVATION AND \nGRANDEUR".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorConstants.kLiteBlack,
                      fontFamily: 'Montserrat',// Text color
                      fontSize: 16, // Font size
                      fontWeight: FontWeight.bold, // Font weight
                    ),
                  ),
                  )
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white, // Container background color
                  image: DecorationImage(
                    image: AssetImage('assets/image/casacanal_1.jpg'), // Replace with your image asset path
                    fit: BoxFit.cover, // Adjust how the image fits the container
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                child: const Column(
                    children: [
                      Text("AHS PROPERTIES", style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text("AHS Properties redefines luxury living, worth \$1.5B. In a year, they achieved milestones: sold 3 Palm Jumeirah villas for \$475M, launched another for \$45M. Leading ultra-luxury with new projects at \$700M in Dubai Water Canal, Palm Jumeirah. Sold 3 villas for \$75M, GDP stays at \$1.5B. Unveiled \$45M Emirates Hills mansion, a new opulent era.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white, // Container background color
                  image: DecorationImage(
                    image: AssetImage('assets/image/about_1.jpg'), // Replace with your image asset path
                    fit: BoxFit.cover, // Adjust how the image fits the container
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                child: Column(
                    children: [
                      Text("AHS VENTURES", style: const TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text("Established in 2017 under Mr. Abbas Sajwani's vision, AHS Group is a global real estate and investment leader. AHS Ventures, founded in 2018, drives diverse successful ventures, all aimed at enhancing residential communities worldwide.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white, // Container background color
                  image: DecorationImage(
                    image: AssetImage('assets/image/about_ahs.jpg'), // Replace with your image asset path
                    fit: BoxFit.cover, // Adjust how the image fits the container
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Container(
                child: Column(
                    children: [
                      Text("AHS INVESTMENTS", style: const TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height:10),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text("Founded in 2020, AHS Investments strives to create wealth and value through diverse investments in private and public equities. With a portfolio exceeding \$150 million, they exemplify commitment to innovation and expansion across various businesses and corporate entities.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
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
                        child: ProgressIndicatorWidget()
                    ),
                    Column(
                      children: <Widget>[
                        CardWidget(),
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
          /*Container(
            padding: EdgeInsets.all(2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleImageView(),
                      Divider(height: 60, color: ColorConstants.kPrimaryColor),
                      CircleImageView(),
                      Divider(height: 60, color: ColorConstants.kPrimaryColor),
                      CircleImageView(),
                      Divider(height: 60, color: ColorConstants.kPrimaryColor),
                      CircleImageView(),
                      Divider(height: 60, color: ColorConstants.kPrimaryColor),
                      CircleImageView(),
                      Divider(height: 60, color: ColorConstants.kPrimaryColor),
                      CircleImageView(),
                      Divider(height: 60, color: ColorConstants.kPrimaryColor),
                      CircleImageView(),
                    ],
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      YearText("2017"),
                      YearText("2018", marginTop: 64),
                      YearText("2019", marginTop: 65),
                      YearText("2020", marginTop: 66),
                      YearText("2021", marginTop: 65),
                      YearText("2022", marginTop: 66),
                      YearText("2023", marginTop: 66),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
            ],
          ),
        )
    );
  }
}

class ProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0,0.0,10.0,0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7, // Adjust the position of the line if needed
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.kPrimaryColor,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2017",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7,
            beforeLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.lite_gold,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2018",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7,
            beforeLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.lite_gold,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2019",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7,
            beforeLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.lite_gold,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2020",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7,
            beforeLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.lite_gold,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2021",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7,
            beforeLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.lite_gold,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2022",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.7,
            beforeLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            afterLineStyle: const LineStyle(
              color: ColorConstants.kPrimaryColor, // Change the line color here
              thickness: 2, // Adjust the line thickness
            ),
            isLast: true,
            indicatorStyle: IndicatorStyle(
              width: 25,
              color: ColorConstants.lite_gold,
            ),
            endChild: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "2023",
                style: TextStyle(
                  color: ColorConstants.kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adjust elevation as needed
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Column(
        children: [
          Image.asset(
            'assets/image/casacanal_1.jpg', // Replace with your image asset
            width: 260,
            height: 240,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class YearText extends StatelessWidget {
  final String text;
  final double marginTop;

  YearText(this.text, {this.marginTop = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.purple,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CircleImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.purple,
          width: 4,
        ),
      ),
      child: Icon(
        Icons.circle,
        color: Colors.blue,
        size: 26,
      ),
    );
  }
}
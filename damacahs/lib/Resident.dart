import 'package:chewie/chewie.dart';
import 'package:damacahs/Contactus.dart';
import 'package:damacahs/ProjectBrochures.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';

class Resident extends StatefulWidget {
  Resident({super.key});

  @override
  State<Resident> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Resident> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  PageController _pageController = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;

  void initState() {
    super.initState();
    double _aspectRatio = 16 / 9;
    _controller = VideoPlayerController.asset("assets/video/casacanal_5sec.mp4");
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
          'Residential',
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
                "Grandeur Elevated: Dubai's \nUltra-Luxury Residences".toUpperCase(),
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
          // Third layout
          Container(
            width: double.infinity,
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Horizontal ScrollView
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white, // Container background color
                          image: DecorationImage(
                            image: AssetImage('assets/image/casacanal_4.jpg'), // Replace with your image asset path
                            fit: BoxFit.cover, // Adjust how the image fits the container
                          ),
                        ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/casacanal_1.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/casacanal_2.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/casacanal_5.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, // Replace with the number of pages you have
                  (index) => buildIndicator(index),
            ),
          ),
          //fourth layout
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(10.0,10.0,0.0,20.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('CASA CANAL', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0,right: 10.0),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectBrochures(type: "casacanal"),
                                ),
                              );
                            },
                            child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.normal, color: ColorConstants.kPrimaryColor)),
                            style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                side: BorderSide(color: ColorConstants.kPrimaryColor)
                            ),
                          )
                        ),
                      ]),
                  SizedBox(height: 5),

                Row(
                    children: [
                  Text("Location", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                  Text(": Dubai Water Canal",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                ]),
                  SizedBox(height: 4),

                  Row(
                      children: [
                    Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                    Text(": \$800 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                  ]),

            Container(
              padding: EdgeInsets.fromLTRB(10.0,20.0,20.0,10.0),
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
                ],
              ),
            ),
          Container(
            width: double.infinity,
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Horizontal ScrollView
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecanal_new1.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecanal_new2.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecanal_new3.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecanal_6.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, // Replace with the number of pages you have
                  (index) => buildIndicator(index),
            ),
          ),
          //five layout
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0,10.0,0.0,20.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ONE CANAL RESIDENCES', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0,right: 10.0),
                          child: OutlinedButton(
                            onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectBrochures(type: "onecanal"),
                              ),
                            );},
                            child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.normal, color: ColorConstants.kPrimaryColor)),
                            style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                side: BorderSide(color: ColorConstants.kPrimaryColor)
                            ),
                          )
                      ),
                    ]),
                SizedBox(height: 5),

                Row(
                    children: [
                      Text("Location", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      Text(": Dubai Water Canal",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                    ]),
                SizedBox(height: 4),

                Row(
                    children: [
                      Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      Text(": \$350 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                    ]),

                Container(
                  padding: EdgeInsets.fromLTRB(10.0,20.0,20.0,10.0),
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
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Horizontal ScrollView
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecrescent_new.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecresecent_2.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecresecent_3.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white, // Container background color
                        image: DecorationImage(
                          image: AssetImage('assets/image/onecresecent_4.jpg'), // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust how the image fits the container
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, // Replace with the number of pages you have
                  (index) => buildIndicator(index),
            ),
          ),
          //five layout
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0,10.0,0.0,20.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ONE CRESCENT RESIDENCES', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0,right: 10.0),
                          child: OutlinedButton(
                            onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectBrochures(type: "onecresent"),
                              ),
                            );},
                            child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.normal, color: ColorConstants.kPrimaryColor)),
                            style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                side: BorderSide(color: ColorConstants.kPrimaryColor)
                            ),
                          )
                      ),
                    ]),
                SizedBox(height: 5),

                Row(
                    children: [
                      Text("Location", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      Text(": Palm Jumeirah",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                    ]),
                SizedBox(height: 4),

                Row(
                    children: [
                      Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      Text(": \$200 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                    ]),

                Container(
                  padding: EdgeInsets.fromLTRB(10.0,30.0,20.0,10.0),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Contactus()),
                      );
                    },
                    child: Text(
                      'ENQUIRE NOW',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      )
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage ? ColorConstants.kPrimaryColor : Colors.black12,
      ),
    );
  }
}
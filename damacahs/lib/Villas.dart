import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';

class Villas extends StatefulWidget {
  Villas({super.key});

  @override
  State<Villas> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Villas> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  PageController _pageController = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;

  void initState() {
    super.initState();
    double _aspectRatio = 16 / 9;
    _controller = VideoPlayerController.asset("assets/video/serenity.mp4");
    _controller.initialize();
    _controller.setLooping(true);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      allowFullScreen: false,
      aspectRatio: _aspectRatio,
      autoInitialize: true,
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
            'Villas',
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
                    "Grandeur Elevated: Dubai's \nUltra-Luxury Residences.".toUpperCase(),
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
                              image: AssetImage('assets/image/villa_serenity1.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_serenity.jpg'), // Replace with your image asset path
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
                children: List.generate(2, // Replace with the number of pages you have
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
                          Text('SEARENITY', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0,right: 10.0),
                              child: OutlinedButton(
                                onPressed: () {},
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
                          Text(": K70 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(": \$35 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" Plot 15,000S qFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                          Text("Status: Available", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          //Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
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
                              image: AssetImage('assets/image/villa_amara2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_amara1.jpg'), // Replace with your image asset path
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
                children: List.generate(2, // Replace with the number of pages you have
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
                          Text('AMARA', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0,right: 10.0),
                              child: OutlinedButton(
                                onPressed: () {},
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
                          Text(": L22 Emairate Hills",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(": \$45 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" BUA 45,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" Plot 45,000S qFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      //Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
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
                              image: AssetImage('assets/image/villa_sunrays2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_sunrays1.jpg'), // Replace with your image asset path
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
                children: List.generate(2, // Replace with the number of pages you have
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
                          Text('SUN RAYS', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0,right: 10.0),
                              child: OutlinedButton(
                                onPressed: () {},
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
                          Text(": C128 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(": \$25 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" BUA 13,500 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" Plot 10,500S qFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      //Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
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
                              image: AssetImage('assets/image/villa_serene2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_serene1.jpg'), // Replace with your image asset path
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
                children: List.generate(2, // Replace with the number of pages you have
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
                          Text('SERENE', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0,right: 10.0),
                              child: OutlinedButton(
                                onPressed: () {},
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
                          Text(": K73 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(": \$25 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" BUA 13,500 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" Plot 10,500S qFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      //Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
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
                              image: AssetImage('assets/image/villa_azalea2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_azalea1.jpg'), // Replace with your image asset path
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
                children: List.generate(2, // Replace with the number of pages you have
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
                          Text('AZALEA', textAlign: TextAlign.left,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kLiteBlack)),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0,right: 10.0),
                              child: OutlinedButton(
                                onPressed: () {},
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
                          Text(": N49 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(": \$25 Million",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" BUA 13,500 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                          Text(" Plot 10,500 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black)),
                      //Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
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
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';
import 'Contactus.dart';
import 'ProjectBrochures.dart';

class Villas extends StatefulWidget {
  Villas({super.key});

  @override
  State<Villas> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Villas> {
  late VideoPlayerController _controller;
  PageController _pageController = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  PageController _pageController1 = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  PageController _pageController2 = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  PageController _pageController3 = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  PageController _pageController4 = PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);
  int _currentPage = 0;
  int _currentPage1 = 0;
  int _currentPage2 = 0;
  int _currentPage3 = 0;
  int _currentPage4 = 0;
  double _scale = 1.0;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/serenity.mp4")
    ..initialize().then((value) => {setState(() {})});
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    _controller.play();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _scale = _scale == 1.0 ? 1.5 : 1.0; // Toggle between 1.0 and 1.5 scale
          _startAnimation();
        });
      }
      /* if (mounted) {
        setState(() {
          _isZoomed = !_isZoomed;
          _scale = _isZoomed ? 1.2 : 1.0;
          _startAnimation();
        });
      }*/
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _pageController1.dispose();
    _pageController2.dispose();
    _pageController3.dispose();
    _pageController4.dispose();
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
                height: 300, // Set the height as needed
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
                    "DISCOVER OPULENCE \n OUR Ultra-Luxury villas in dubai".toUpperCase(),
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
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_serenity2.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                         /* decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_serenity1.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
                        ),
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_serenity1.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                        /*  decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_serenity.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
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
                padding: const EdgeInsets.all(2.0),
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
                                onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectBrochures(type: "searenity"),
                                  ),
                                );},
                                child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kPrimaryColor)),
                                style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(color: ColorConstants.kPrimaryColor)
                                ),
                              )
                          ),
                        ]),

                    Row(
                        children: [
                          Text("Location", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": K70 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": \$35 Million",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size:", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text("  Plot 15,000 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                          Text("Status: Available", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
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
                      controller: _pageController1,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage1 = index;
                        });
                      },
                      children: [
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_amara2.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_amara2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
                        ),
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_amara1.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_amara1.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
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
                      (index) => buildIndicator1(index),
                ),
              ),
              //five layout
              Padding(
                padding: const EdgeInsets.all(2.0),
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
                                onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectBrochures(type: "amara"),
                                  ),
                                );},
                                child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kPrimaryColor)),
                                style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(color: ColorConstants.kPrimaryColor)
                                ),
                              )
                          ),
                        ]),

                    Row(
                        children: [
                          Text("Location", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": L22 Emairate Hills",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": \$45 Million",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size:", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(" BUA 45,000 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text("  Plot 45,000 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
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
                      controller: _pageController2,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage2 = index;
                        });
                      },
                      children: [
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_sunrays2.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_sunrays2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
                        ),
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_sunrays1.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_sunrays1.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
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
                      (index) => buildIndicator2(index),
                ),
              ),
              //five layout
              Padding(
                padding: const EdgeInsets.all(2.0),
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
                                onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectBrochures(type: "sunrays"),
                                  ),
                                );},
                                child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kPrimaryColor)),
                                style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(color: ColorConstants.kPrimaryColor)
                                ),
                              )
                          ),
                        ]),

                    Row(
                        children: [
                          Text("Location", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": C128 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": \$25 Million",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size:", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(" BUA 13,500 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text("  Plot 10,500 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
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
                      controller: _pageController3,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage3 = index;
                        });
                      },
                      children: [
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_serene2.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_serene2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
                        ),
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_serene1.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                         /* decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_serene1.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
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
                      (index) => buildIndicator3(index),
                ),
              ),
              //five layout
              Padding(
                padding: const EdgeInsets.all(2.0),
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
                                onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectBrochures(type: "serene"),
                                  ),
                                );},
                                child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kPrimaryColor)),
                                style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(color: ColorConstants.kPrimaryColor)
                                ),
                              )
                          ),
                        ]),

                    Row(
                        children: [
                          Text("Location", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": K73 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": \$25 Million",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size:", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(" BUA 13,500 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text("  Plot 10,500 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
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
                      controller: _pageController4,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage4 = index;
                        });
                      },
                      children: [
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_azalea1.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                         /* decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_azalea1.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
                        ),
                        Container(
                          width: double.infinity,
                          child: TweenAnimationBuilder(
                            duration: Duration(seconds: 9),
                            tween: Tween<double>(begin: 1.0, end: _scale),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              'assets/image/villa_azalea2.jpg', // Replace with your image URL
                              width: double.infinity, // Set the initial width of the image
                              height: 200, // Set the initial height of the image
                              fit: BoxFit.cover,
                            ),
                          ),
                          /*decoration: const BoxDecoration(
                            color: Colors.white, // Container background color
                            image: DecorationImage(
                              image: AssetImage('assets/image/villa_azalea2.jpg'), // Replace with your image asset path
                              fit: BoxFit.cover, // Adjust how the image fits the container
                            ),
                          ),*/
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
                      (index) => buildIndicator4(index),
                ),
              ),
              //five layout
              Padding(
                padding: const EdgeInsets.all(2.0),
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
                                onPressed: () { Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectBrochures(type: "azalea"),
                                  ),
                                );},
                                child: Text('View Project',textAlign: TextAlign.center,style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: ColorConstants.kPrimaryColor)),
                                style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(color: ColorConstants.kPrimaryColor)
                                ),
                              )
                          ),
                        ]),

                    Row(
                        children: [
                          Text("Location", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": N49 Palm Jumeirah",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black))
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Project Value", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(": \$25 Million",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(
                        children: [
                          Text("Size:", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text(" BUA 13,500 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    Row(
                        children: [
                          Text("       ", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                          Text("  Plot 10,500 SqFt",style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w300,color: Colors.black)),
                        ]),
                    SizedBox(height: 4),

                    Row(children: [
                      Text("Status: Sold", style: const TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Colors.black)),
                      //Text(" BUA 17,000 SqFt",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.black)),
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

  Widget buildIndicator1(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage1 ? ColorConstants.kPrimaryColor : Colors.black12,
      ),
    );
  }

  Widget buildIndicator2(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage2 ? ColorConstants.kPrimaryColor : Colors.black12,
      ),
    );
  }

  Widget buildIndicator3(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage3 ? ColorConstants.kPrimaryColor : Colors.black12,
      ),
    );
  }

  Widget buildIndicator4(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _currentPage4 ? ColorConstants.kPrimaryColor : Colors.black12,
      ),
    );
  }
}
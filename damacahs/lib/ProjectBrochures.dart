import 'package:chewie/chewie.dart';
import 'package:damacahs/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';
import 'PDFViwer.dart';

class ProjectBrochures extends StatefulWidget {
  String type;
  ProjectBrochures({required this.type});

  @override
  State<ProjectBrochures> createState() => _VideoPlayerScreenState(type);
}

class _VideoPlayerScreenState extends State<ProjectBrochures> {
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

    if (myString == "casacanal") {
      imageVideo = "video";
      _controller =
          VideoPlayerController.asset("assets/video/casacanal_5sec.mp4");
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
    } else if (myString == "onecanal") {
      imageVideo = "video";
      _controller =
          VideoPlayerController.asset("assets/video/onecanal_5sec.mp4");
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
    } else if (myString == "onecresent") {
      imageVideo = "video";
      _controller =
          VideoPlayerController.asset("assets/video/onecresent_5sec.mp4");
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
    } else if (myString == "searenity") {
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
          color: ColorConstants.kPrimaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          getTitleBasedOnString(myString),
          style: TextStyle(
            color: ColorConstants.kPrimaryColor,
            fontFamily: 'Montserrat', // Text color
            fontSize: 24, // Font size
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
        centerTitle: true, // Center the title horizontally
        backgroundColor: Colors.white, // AppBar background color
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            imageVideo == "image" ?
            _getImageBackground() :
            _getVideoBackground(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  void initCasaCanalList() {
    casaCanal.add("Project Brouchure");
    casaCanal.add("Fact Sheet");
    casaCanal.add("3 Bedroom sky villa");
    casaCanal.add("4 Bedroom sky villa");
    casaCanal.add("5 Bedroom sky villa");
    casaCanal.add("6 Bedroom sky villa mansion");
    casaCanal.add("Location");
    casaCanal.add("Website");
  }

  void initOneCanalList() {
    oneCanal.add("Project Brouchure");
    oneCanal.add("Fact Sheet");
    oneCanal.add("Location");
    oneCanal.add("Website");
  }

  void initOneCresecentList() {
    oneCrescent.add("Project Brouchure");
    oneCrescent.add("Fact Sheet");
    oneCrescent.add("6 Bedroom sky palace villa");
    oneCrescent.add("Location");
    oneCrescent.add("Website");
  }

  void initSerenityList() {
    serenity.add("Project Brouchure");
    serenity.add("Location");
    serenity.add("Website");
  }

  void initAmaraList() {
    amara.add("Project Brouchure");
    amara.add("Location");
    amara.add("Website");
  }

  void initSunraysList() {
    sunRays.add("Project Brouchure");
    sunRays.add("Location");
    sunRays.add("Website");
  }

  void initSereneList() {
    serene.add("Project Brouchure");
    serene.add("Location");
    serene.add("Website");
  }

  void initAlzeaList() {
    alzea.add("Project Brouchure");
    alzea.add("Location");
    alzea.add("Website");
  }

  _getVideoBackground() {
    return Container(
      child: VideoPlayer(_controller),
    );
  }

  _getImageBackground() {
    return Container(
      width: double.infinity, // Adjust the width as needed
      height: double.infinity,
      child: Image.asset(
        getBackgroundImageBasedOnString(),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              // Toggle the visibility of the ListView
              isListViewOpen = !isListViewOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: ColorConstants.transparent, // Set your desired color here
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: SvgPicture.asset(getImageBasedOnString(),
                      semanticsLabel: 'My SVG Picture',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/image/menu.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        if (isListViewOpen)
          Expanded(
              child: getCard(getProjectTypeBasedOnList())),
      ],
    );
  }

  String getTitleBasedOnString(String myString) {
    if (myString == "searenity") {
      return "Villas";
    } else if (myString == "amara") {
      return "Villas";
    } else if (myString == "sunrays") {
      return "Villas";
    } else if (myString == "serene") {
      return "Villas";
    } else if (myString == "azalea") {
      return "Villas";
    } else {
      return "Residential"; // You can provide a default title for other cases
    }
  }

  String getImageBasedOnString() {
    if (myString == "searenity") {
      return "assets/image/searenity_01.svg";
    } else if (myString == "amara") {
      return "assets/image/amara_01.svg";
    } else if (myString == "sunrays") {
      return "assets/image/sunrays_01.svg";
    } else if (myString == "serene") {
      return "assets/image/serene_01.svg";
    } else if (myString == "azalea") {
      return "assets/image/azalea_01.svg";
    } else if (myString == "casacanal") {
      return "assets/image/casacanal_01.svg";
    } else if (myString == "onecanal") {
      return "assets/image/onecanal_01.svg";
    } else if (myString == "onecresent") {
      return "assets/image/onecrescent_01.svg";
    } else {
      return "assets/image/casacanal_01.svg";
    }
  }

  List<String> getProjectTypeBasedOnList() {
    if (myString == "casacanal") {
      casaCanal.clear();
      initCasaCanalList();
      return casaCanal;
    } else if (myString == "amara") {
      amara.clear();
      initAmaraList();
      return amara;
    } else if (myString == "sunrays") {
      sunRays.clear();
      initSunraysList();
      return sunRays;
    } else if (myString == "serene") {
      serene.clear();
      initSereneList();
      return serene;
    } else if (myString == "azalea") {
      alzea.clear();
      initAlzeaList();
      return alzea;
    } else if (myString == "searenity") {
      serenity.clear();
      initSerenityList();
      return serenity;
    } else if (myString == "onecanal") {
      oneCanal.clear();
      initOneCanalList();
      return oneCanal;
    } else if (myString == "onecresent") {
      oneCrescent.clear();
      initOneCresecentList();
      return oneCrescent;
    } else {
      casaCanal.clear();
      initCasaCanalList();
      return casaCanal;
    }
  }

  String getBackgroundImageBasedOnString() {
    if (myString == "amara") {
      return "assets/image/villa_amara1.jpg";
    } else if (myString == "sunrays") {
      return "assets/image/villa_sunrays1.jpg";
    } else if (myString == "serene") {
      return "assets/image/villa_serene1.jpg";
    } else if (myString == "azalea") {
      return "assets/image/villa_azalea1.jpg";
    } else {
      return "assets/image/villa_amara1.jpg";
    }
  }

  getCard(List<String> projectType) {
    print('pdfUrl email projectType : $projectType');
    if (myString == "casacanal") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS")));
                } else if (projectType[index] == 'Fact Sheet') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1oGXsanurgp6_MMiJtsb7E7qT8FT5rppX',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1oGXsanurgp6_MMiJtsb7E7qT8FT5rppX")));
                } else if (projectType[index] == '3 Bedroom sky villa') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1MAnKv8ASoKeVP6NtwttBB4eEe7c7hXb3',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1MAnKv8ASoKeVP6NtwttBB4eEe7c7hXb3")));
                } else if (projectType[index] == '4 Bedroom sky villa') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1Sp6cySRYxLb6-pzeA7sFNTR_9B91peHAf',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1Sp6cySRYxLb6-pzeA7sFNTR_9B91peHAf")));
                } else if (projectType[index] == '5 Bedroom sky villa') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1ie3KMLMsxvcbtmZCw9D4mL2VxHqqbJtd',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1ie3KMLMsxvcbtmZCw9D4mL2VxHqqbJtd")));
                } else
                if (projectType[index] == '6 Bedroom sky villa mansion') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1am1wjHuBopyHvr09hi_CXw19eqdV9N34',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1am1wjHuBopyHvr09hi_CXw19eqdV9N34")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://casacanal.com/");
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(
                      pdfUrl: 'https://drive.google.com/uc?export=view&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "onecanal") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1qvwpS2ENyNaMTHA_dA4m6CdmP-MizEX0',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1qvwpS2ENyNaMTHA_dA4m6CdmP-MizEX0")));
                } else if (projectType[index] == 'Fact Sheet') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=10Tn9zOic398Dw1Wpj-d4ToylDfK0Svn-',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=10Tn9zOic398Dw1Wpj-d4ToylDfK0Svn-")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://ahs-properties.com/project/one-canal/");
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1qvwpS2ENyNaMTHA_dA4m6CdmP-MizEX0',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1qvwpS2ENyNaMTHA_dA4m6CdmP-MizEX0")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "onecresent") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=11ySZcVsPIyGCQmqHAaDYtdtpvRCWz2K0',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=11ySZcVsPIyGCQmqHAaDYtdtpvRCWz2K0")));
                } else if (projectType[index] == 'Fact Sheet') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1_dYSmr0c8nfplPsQ_gHNR-eYipVeY4Bs',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1_dYSmr0c8nfplPsQ_gHNR-eYipVeY4Bs")));
                } else if (projectType[index] == '6 Bedroom sky palace villa') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=1sDHt8KdQ1Bu90FpXUvs-1UxB7YLhK_Iy',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1sDHt8KdQ1Bu90FpXUvs-1UxB7YLhK_Iy")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://1onecrescent.com/");
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://drive.google.com/uc?export=view&id=11ySZcVsPIyGCQmqHAaDYtdtpvRCWz2K0',projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=11ySZcVsPIyGCQmqHAaDYtdtpvRCWz2K0")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "amara") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PDFViwer(
                          pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/Amara-L22-EMRHLS-AHS-Properties-1_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/Amara-L22-EMRHLS-AHS-Properties-1_compressed.pdf")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://ahs-properties.com/project/amara/");
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/Amara-L22-EMRHLS-AHS-Properties-1_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/Amara-L22-EMRHLS-AHS-Properties-1_compressed.pdf")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "sunrays") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/C128-Sun-Rays-Brochure_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/C128-Sun-Rays-Brochure_compressed.pdf")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://ahs-properties.com/project/sun-rays/");
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/C128-Sun-Rays-Brochure_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/C128-Sun-Rays-Brochure_compressed.pdf")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "serene") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/K73-Serene-Brochure_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/K73-Serene-Brochure_compressed.pdf")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://ahs-properties.com/project/serene/");
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(
                      pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/K73-Serene-Brochure_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/K73-Serene-Brochure_compressed.pdf")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "azalea") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      PDFViwer(
                          pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/N49-Azalea-Brochure_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/N49-Azalea-Brochure_compressed.pdf")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://ahs-properties.com/project/azalea/");
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(
                      pdfUrl: 'https://ahs-properties.com/wp-content/uploads/2023/05/N49-Azalea-Brochure_compressed.pdf',projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/N49-Azalea-Brochure_compressed.pdf")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else if (myString == "searenity") {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(
                      pdfUrl: "https://ahs-properties.com/wp-content/uploads/2023/05/K70-SeaRenity-Brochure_compressed.pdf",projectType: myString,downloadUrl:"https://ahs-properties.com/wp-content/uploads/2023/05/K70-SeaRenity-Brochure_compressed.pdf")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => location(latlong: myString)));
                } else if (projectType[index] == 'Website') {
                  _launchURL("https://ahs-properties.com/project/searenity/");
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(pdfUrl: "casacanal",projectType: myString,downloadUrl: "https://ahs-properties.com/wp-content/uploads/2023/05/K70-SeaRenity-Brochure_compressed.pdf")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    } else {
      return Container(
        color: ColorConstants.listbg,
        child: ListView.separated(
          itemCount: projectType.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // Divider between items
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      projectType[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'VIEW',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Check the condition and navigate accordingly
                if (projectType[index] == 'Project Brouchure') {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(pdfUrl: "casacanal",projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS")));
                } else if (projectType[index] == 'Location') {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(pdfUrl: "casacanal",projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS")));
                } else if (projectType[index] == 'Website') {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(pdfUrl: "casacanal",projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS")));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (
                      context) => PDFViwer(pdfUrl: "casacanal",projectType: myString,downloadUrl:"https://drive.google.com/uc?export=download&id=1bHEqUg_838mxnLfx8OnKMfFU7vjmSlCS")));
                  print('Tapped: ${projectType[index]}');
                }
              },
            );
          },
        ),
      );
    }
  }

  _launchURL(String mapurl) async {
    if (await canLaunchUrl(Uri.parse(mapurl))) {
      await launchUrl(Uri.parse(mapurl));
    } else {
      throw 'Could not launch $mapurl';
    }
  }
}

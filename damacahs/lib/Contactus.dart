import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'Colours.dart';

class Contactus extends StatefulWidget {
  Contactus({super.key});

  @override
  State<Contactus> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Contactus> {
  late GoogleMapController mapController;
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  final Set<Marker> markers = new Set();
  static const LatLng showLocation = const LatLng(25.182683, 55.248041);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void initState() {
    super.initState();
    getmarkers();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contact us',
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
                              width: 60,
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
                width: double.infinity,
                height: 400,
                child: GoogleMap( //Map widget from google_maps_flutter package
                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition( //innital position in map
                    target: showLocation, //initial position
                    zoom: 11.0, //initial zoom level
                  ),
                  markers: getmarkers(), //markers to show on map
                  mapType: MapType.normal, //map type
                  onMapCreated: (controller) { //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Register with us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstants.kLiteBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'montserrat',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTextFieldWIthoutBorder(
                      label: 'Name *',
                      controller: nameController,
                    ),
                    SizedBox(height: 20.0),
                    _buildTextFieldWIthoutBorder(
                      label: 'Email *',
                      controller: emailController,
                    ),
                    SizedBox(height: 20.0),
                    _buildTextFieldWIthoutBorder(
                      label: 'Phone *',
                      controller: phoneController,
                      inputType: TextInputType.phone,
                    ),
                    SizedBox(height: 20.0),
                    _buildTextField(
                      label: 'Message',
                      controller: messageController,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Column(
                    children: [
                      TextButton(
                        child: Text(
                          "SEND MESSAGE",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.kLiteBlack,
                          ),
                        ),
                        onPressed: () => sendEmail(context),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                width: 60.0,
                height: 1.0,
                margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 10.0),
                color: ColorConstants.kPrimaryColor,
              ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.0),
                padding: EdgeInsets.only(top:20.0),
                  child: Row(
                    children: [
                      InkWell(
                      child : SvgPicture.asset('assets/image/ph.svg',
                        semanticsLabel: 'My SVG Picture',
                        width: 20,
                        height: 20,
                      ),
                          onTap: () => {
                            _makePhoneCall()
                          }
                      ),
                      SizedBox(width: 20),
                      InkWell(
                      child : SvgPicture.asset('assets/image/wtsp.svg',
                        semanticsLabel: 'My SVG Picture',
                        width: 20,
                        height: 20,
                      ),
                        onTap: () => _launchURL("https://wa.me/+971 543090418"),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                      child: SvgPicture.asset('assets/image/ml.svg',
                        semanticsLabel: 'My SVG Picture',
                        width: 20,
                        height: 20,
                      ),
                          onTap: () => {
                            _sendEmail()
                      }
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
              ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: 4.0),
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    TextButton(
                      child: Text("LET'S TALK",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 60.0,
                height: 1.0,
                margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 10.0),
                color: ColorConstants.kPrimaryColor,
              ),
          ),
              Container(
                padding: EdgeInsets.only(top:20.0),
                margin: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                InkWell(
                    child: SvgPicture.asset('assets/image/fb.svg',
                      semanticsLabel: 'My SVG Picture',
                      width: 20,
                      height: 20,
                    ),
                  onTap: () => {
                  FacebookPageOpener.openFacebookPage()
                  }
                ),
                    SizedBox(width: 20),
                    InkWell(
                    child: SvgPicture.asset('assets/image/insta.svg',
                      semanticsLabel: 'My SVG Picture',
                      width: 20,
                      height: 20,
                    ),
                        onTap: () => {
                          InstagramPageOpener._launchInstagram()
                        }
                    ),
                    SizedBox(width: 20),
                    InkWell(
                    child: SvgPicture.asset('assets/image/utb.svg',
                      semanticsLabel: 'My SVG Picture',
                      width: 20,
                      height: 20,
                    ),
                        onTap: () => {
                          _openYouTubeChannel()
                    }
                    ),
                    SizedBox(width: 20),
                    InkWell(
                    child: SvgPicture.asset('assets/image/link.svg',
                      semanticsLabel: 'My SVG Picture',
                      width: 20,
                      height: 20,
                    ),
                      onTap: () => _launchURL("https://www.linkedin.com/company/ahsproperties/"),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.only(left: 4.0),
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    TextButton(
                      child: Text("SOCIAL LINKS",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 60.0,
                height: 1.0,
                margin: EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 30.0),
                color: ColorConstants.kPrimaryColor,
              ),
          ),
            ],
          ),
        )
    );
  }

  Future<void> _sendEmail() async {
    final emailAddress = 'info@ahs-properties.com';

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );

    try {
      if (await canLaunch(emailUri.toString())) {
        await launch(emailUri.toString());
      } else {
        throw 'Could not launch email';
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  Future<void> _makePhoneCall() async {
    final phoneNumber = '+97144581821';

    try {
      if (await canLaunch('tel:$phoneNumber')) {
        await launch('tel:$phoneNumber');
      } else {
        throw 'Could not launch phone call';
      }
    } catch (e) {
      print('Error making phone call: $e');
    }
  }

  Future<void> _openYouTubeChannel() async {
    final channelUrl = "https://www.youtube.com/@ahsproperties";

    try {
      if (await canLaunch(channelUrl)) {
        await launch(channelUrl);
      } else {
        throw "Could not launch $channelUrl";
      }
    } catch (e) {
      print("Error opening YouTube channel: $e");
    }
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(""),
        position: LatLng(25.0953478, 55.1702784), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Corporate Office'
          //snippet: 'Damac executive heights',
        ),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => _launchURL("https://goo.gl/maps/t1Th2vujSqsZKG986"),
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(25.2041666, 55.2628507), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Sales Center'
        ),
        icon: BitmapDescriptor.defaultMarker,
          onTap: () => _launchURL("https://goo.gl/maps/WtzHb5xxHTkwdTF79"),
      ));
    });

    return markers;
  }

  _launchURL(String mapurl) async {
    if (await canLaunchUrl(Uri.parse(mapurl))) {
      await launchUrl(Uri.parse(mapurl));
    } else {
      throw 'Could not launch $mapurl';
    }
  }

  void sendEmail(BuildContext context) {
    final String name = nameController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;
    final String message = messageController.text;

    if (name.isEmpty) {
      _showError(context, "Enter Name");
      return;
    } else if (email.isEmpty) {
      _showError(context, "Enter Email");
      return;
    } else if (phone.isEmpty) {
      _showError(context, "Enter Mobile number");
      return;
    } else if (!_isValidEmail(email)) {
      _showError(context, "Enter valid email id");
      return;
    } else if (!_isValidPhoneNumber(phone)) {
      _showError(context, "Enter valid mobile number");
      return;
    } else {
      _launchEmailIntent(context, email, message);
      _showThankYouMessage(context);
      return;
    }
  }

  void _showError(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showThankYouMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Thank you for contacting us, a representative from our team will get back to you shortly!",
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _launchEmailIntent(BuildContext context, String email, String message) {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'info@ahs-properties.com',
      queryParameters: {'subject': 'Enquiry', 'body': message},
    );

    launchUrl(Uri.parse(emailUri.toString()));
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(
      r'^(\+[0-9]+[- \.]*)?'         // +<digits><sdd>*
      r'(\([0-9]+\)[- \.]*)?'       // (<digits>)<sdd>*
      r'([0-9][0-9\- \.]+[0-9])$',  // <digits><sdd>*<digits>
    );

    return phoneRegex.hasMatch(phoneNumber);
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? inputType,
    int? maxLines,
  }) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: ColorConstants.kPrimaryColor,
          width: 0.5,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildTextFieldWIthoutBorder({
    required String label,
    required TextEditingController controller,
    TextInputType? inputType,
    int? maxLines,
  }) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: label,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.kPrimaryColor,width: 0.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.kPrimaryColor,width: 0.5),
          ),
        ),
      ),
    );
  }
}

class FacebookPageOpener {
  static Future<void> openFacebookPage() async {
    final pageUrl = "https://www.facebook.com/people/AHS-Properties/100083320485787/";
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final versionCode = int.tryParse(packageInfo.buildNumber);

      print("The versionCode is: $versionCode");
      if (versionCode != null && versionCode >= 1) {
        final url = "fb://facewebmodal/f?href=$pageUrl";
        await launchUrl(Uri.parse(url));
      } else {
        final url = "fb://page/people/AHS-Properties/100083320485787/";
        await launchUrl(Uri.parse(url));
      }
    } catch (e) {
      await launchUrl(Uri.parse(pageUrl));
    }
  }
}

class InstagramPageOpener {
  static Future<void> _launchInstagram() async {
    final instagramProfile = "ahs.properties";
    final uriForApp = "http://instagram.com/_u/$instagramProfile";
    final uriForBrowser = "http://instagram.com/$instagramProfile";

    try {
      if (await canLaunch(uriForApp)) {
        await launch(uriForApp);
      } else {
        await launch(uriForBrowser);
      }
    } catch (e) {
      print("Error launching Instagram: $e");
    }
  }
}

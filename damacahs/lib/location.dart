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

class location extends StatefulWidget {
  String latlong;
  location({required this.latlong});

  @override
  State<location> createState() => _VideoPlayerScreenState(latlong);
}

class _VideoPlayerScreenState extends State<location> {
  final String projectLatLong;
  _VideoPlayerScreenState(this.projectLatLong);
  late GoogleMapController mapController;
  final Set<Marker> markers = new Set(); //markers for google map
  late LatLng showLocation;

  void initState() {
    super.initState();

    if (projectLatLong == "searenity") {
      showLocation =  LatLng(25.1157758, 55.1167395);
    } else if (projectLatLong == "amara") {
      showLocation =  LatLng(25.0700799, 55.1668243);
    } else if (projectLatLong == "sunrays") {
      showLocation =  LatLng(25.127511, 55.144334);
    } else if (projectLatLong == "serene") {
      showLocation =  LatLng(25.1159072, 55.1172104);
    } else if (projectLatLong == "azalea") {
      showLocation =  LatLng(25.113024, 55.128053);
    } else if (projectLatLong == "casacanal") {
      showLocation =  LatLng(25.188108, 55.244958);
    }else if (projectLatLong == "onecanal") {
      showLocation =  LatLng(25.188535, 55.243937);
    }else if (projectLatLong == "onecresent") {
      showLocation =  LatLng(25.139803, 55.142883);
    }else {
      showLocation =  LatLng(25.182683, 55.248041);
    }
    getmarkers();
  }

  @override
  void dispose() {
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
            getTitleBasedOnString(projectLatLong),
            style: TextStyle(
              color: ColorConstants.kPrimaryColor,
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
          centerTitle: true, // Center the title horizontally
          backgroundColor: Colors.white, // Center-aligned text
        ),
        body: Container(
          child : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
              ),
              Expanded(
                child: Center(
                  child: SvgPicture.asset(getImageBasedOnString(projectLatLong),
                    semanticsLabel: 'My SVG Picture',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              Container(
                child: Column(
                    children: [
                      Text("LOCATION", style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold,color: ColorConstants.kLiteBlack)),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.all(15), //apply padding to all four sides
                        child: Text(getAddressBasedOnProject(projectLatLong),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w200,color: Colors.black)),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
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
                height: 300,
                child: GoogleMap( //Map widget from google_maps_flutter package
                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition( //innital position in map
                    target: showLocation, //initial position
                    zoom: 14.0, //initial zoom level
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
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL(getGoogleUrl(projectLatLong));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Background color
                        elevation: 4.0, // Elevation
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 16.0,
                        ), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0), // BorderRadius
                        ),
                      ),
                      child: Text(
                        'View on Map',
                        style: TextStyle(
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /*Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button click action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Background color
                      elevation: 4.0, // Elevation
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 16.0,
                      ), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0), // BorderRadius
                      ),
                    ),
                    child: Text(
                      'View on Map',
                      style: TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        )
    );
  }

  String getImageBasedOnString(String myString) {
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

  String getAddressBasedOnProject(String myString) {
    if (myString == "searenity") {
      return "K70 - Palm Jumeirah Rd - The Palm Jumeirah - Dubai";
    } else if (myString == "amara") {
      return "35C8+2XP L22 - Emirates Hills - Dubai";
    } else if (myString == "sunrays") {
      return "C128 - Palm Jumeirah Rd - The Palm Jumeirah - Dubai";
    } else if (myString == "serene") {
      return "K73 - Palm Jumeirah Rd - The Palm Jumeirah - Dubai";
    } else if (myString == "azalea") {
      return "N49 - Palm Jumeirah Rd - The Palm Jumeirah - Dubai";
    } else if (myString == "casacanal") {
      return "Dubai water canal adjacent to safa park Al Safa 2 - Dubai";
    } else if (myString == "onecanal") {
      return "Dubai water canal adjacent to safa park - Al Safa 2 - Dubai";
    } else if (myString == "onecresent") {
      return "Palm Jumeirah Walk Way Palm - Crescent Rd - Jumeirah - Dubai";
    } else {
      return "Dubai water canal adjacent to safa park Al Safa 2 - Dubai"; // You can provide a default title for other cases
    }
  }

  String getGoogleUrl(String myString) {
    if (myString == "searenity") {
      return "https://goo.gl/maps/HbhsZqQcAibJ1q9MA";
    } else if (myString == "amara") {
      return "https://goo.gl/maps/jnLcwxopCDKU8G6Z9";
    } else if (myString == "sunrays") {
      return "https://goo.gl/maps/GdJk65fVhWY8kzgGA";
    } else if (myString == "serene") {
      return "https://goo.gl/maps/1KMTP42TKEk9eDcn9";
    } else if (myString == "azalea") {
      return "https://goo.gl/maps/jMyhvVb1ktqqoBk57";
    } else if (myString == "casacanal") {
      return "https://goo.gl/maps/vMfZ9dYCu3ZmHjXQ8";
    } else if (myString == "onecanal") {
      return "https://goo.gl/maps/GpfUeLghLoazMquA6";
    } else if (myString == "onecresent") {
      return "https://goo.gl/maps/CdLT53vUyujd63wF9";
    } else {
      return "https://goo.gl/maps/vMfZ9dYCu3ZmHjXQ8"; // You can provide a default title for other cases
    }
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(""),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info
            //title: 'Corporate Office'
          //snippet: 'Damac executive heights',
        ),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => _launchURL(getGoogleUrl(projectLatLong)),
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
}


import 'package:damacahs/Colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'About.dart';
import 'Contactus.dart';
import 'Home.dart';
import 'Resident.dart';
import 'Villas.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> with TickerProviderStateMixin {
  var _currentIndex = 0;
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> _pages = [
    Home(),
    Resident(),
    Villas(),
    About(),
    Contactus()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CreateBottombar(context),
    );
  }

  Container CreateBottombar(BuildContext context) {
    return Container(
      //add ClipRRect widget for Round Corner
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          //add background color
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              /* BottomNavigationBarItem(
          icon:SvgPicture.asset('assets/image/home.svg',
            semanticsLabel: 'My SVG Picture',
            width: 20,
            height: 20,
          ),
          label: 'Home',
          activeIcon: SvgPicture.asset(
            'assets/image/sldhome.svg',
          ),
          backgroundColor: Colors.white,
        ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/image/residential.svg',
          semanticsLabel: 'My SVG Picture',
              width: 20,
              height: 20,
            ),
            label: 'Resident',
            activeIcon: SvgPicture.asset(
              'assets/image/sldresi.svg',
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/image/villa.svg',
    semanticsLabel: 'My SVG Picture',
              width: 20,
              height: 20,
            ),
            label: 'Villa',
            activeIcon: SvgPicture.asset(
              'assets/image/sldvilla.svg',
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/image/aboutus.svg',
              semanticsLabel: 'My SVG Picture',
              width: 20,
              height: 20,
            ),
            label: 'About',
            activeIcon: ShakeMe(
              key: shakeKey,
              shakeCount: 2,
              shakeOffset: 10,
              shakeDuration: Duration(milliseconds: 5000),
              child: SvgPicture.asset(
                'assets/image/sldabtus.svg',
              ),
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/image/contact.svg',
    semanticsLabel: 'My SVG Picture',
                width: 20,
                height: 20,
              ),
            label: 'Contact Us',
              activeIcon: SvgPicture.asset(
                'assets/image/sldcntct.svg',
              ),
            backgroundColor: Colors.white,
          ),*/
              _buildCustomBottomNavigationBarItem(
                  'assets/image/home.svg', 'Home', 0,
                  'assets/image/sldhome.svg'),
              _buildCustomBottomNavigationBarItem(
                  'assets/image/residential.svg', 'Residential', 1,
                  'assets/image/sldresi.svg'),
              _buildCustomBottomNavigationBarItem(
                  'assets/image/villa.svg', 'Villas', 2,
                  'assets/image/sldvilla.svg'),
              _buildCustomBottomNavigationBarItem(
                  'assets/image/aboutus.svg', 'About Us', 3,
                  'assets/image/sldabtus.svg'),
              _buildCustomBottomNavigationBarItem(
                  'assets/image/contact.svg', 'Contact Us', 4,
                  'assets/image/sldcntct.svg'),
            ],
            selectedItemColor: ColorConstants.kPrimaryColor,
            selectedLabelStyle: const TextStyle(fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 10),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                shakeKey.currentState?.shake();
              });
            }
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildCustomBottomNavigationBarItem(
      String svgAssetPath, String label, int index, String svgAssetPathAction) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        svgAssetPath,
        semanticsLabel: 'My SVG Picture',
        width: 22,
        height: 22,
      ),
      label: label,
      activeIcon: ShakeMe(
        key: shakeKey,
        shakeCount: 2,
        shakeOffset: 10,
        shakeDuration: Duration(milliseconds: 5000),
        child: SvgPicture.asset(
          svgAssetPathAction,
          semanticsLabel: 'My SVG Picture',
          width: 26,
          height: 26,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
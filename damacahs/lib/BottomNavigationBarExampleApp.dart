import 'package:damacahs/MapSample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'About.dart';
import 'Contactus.dart';
import 'Home.dart';
import 'Resident.dart';
import 'VideoPlayer.dart';
import 'Villas.dart';

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
  late AnimationController _controller;
  double _rotationValue = 0.0;
  bool _isShaking = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
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
            icon: SvgPicture.asset('assets/image/aboutus.svg',
    semanticsLabel: 'My SVG Picture',
              width: 20,
              height: 20,
            ),
            label: 'About',
            activeIcon: SvgPicture.asset(
              'assets/image/sldabtus.svg',
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
            backgroundColor: Colors.white
          ),
        ],
        selectedItemColor: Colours.kPrimaryColor,
        selectedLabelStyle: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold,fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold,fontSize: 10),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {

          setState(() {
            _currentIndex = index;
            startShakeAnimation();
           /* _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeOut);*/
          });
        }
      ),
    );
  }

  void startShakeAnimation() {
    if (!_isShaking) {
      setState(() {
        _isShaking = true;
      });

      TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.0, end: -0.1),
            weight: 1,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: -0.1, end: 0.1),
            weight: 2,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.1, end: 0.0),
            weight: 1,
          ),
        ],
      ).animate(
        CurvedAnimation(
          parent: AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 4000),
          )
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                setState(() {
                  _isShaking = false;
                });
              }
            }),
          curve: Curves.linear,
        ),
      )
          .addListener(() {
        setState(() {
          _rotationValue = _rotationValue + _rotationValue;
        });
      });
    }
  }
}

class Colours {
  static const kPrimaryColor = Color(0xFFC8A664);
}

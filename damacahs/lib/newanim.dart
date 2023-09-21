import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:flutter_svg/svg.dart';

import 'BottomNavigationBarExampleApp.dart'; // Import the shake_me package

void main() {
  runApp(MaterialApp(
    home: MyCustomBottomNavigationBar(),
  ));
}

class MyCustomBottomNavigationBar extends StatefulWidget {
  @override
  _MyCustomBottomNavigationBarState createState() =>
      _MyCustomBottomNavigationBarState();
}

class _MyCustomBottomNavigationBarState
    extends State<MyCustomBottomNavigationBar> {
  int _selectedIndex = 0;
  final GlobalKey<ShakeWidgetState> shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Custom Bottom Navigation Example'),
      ),
      body: Center(
        child: Text('Content for Tab $_selectedIndex'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          // Trigger the shake animation when the tab is selected

            shakeKey.currentState?.shake();

        },
        shakeKey: shakeKey,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final GlobalKey<ShakeWidgetState> shakeKey;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabSelected,
    required this.shakeKey,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildCustomBottomNavigationBarItem('assets/image/home.svg', 'Home', 0,'assets/image/sldhome.svg'),
        _buildCustomBottomNavigationBarItem('assets/image/residential.svg', 'Resident', 1,'assets/image/sldresi.svg'),
        _buildCustomBottomNavigationBarItem('assets/image/villa.svg', 'Villa', 2,'assets/image/sldvilla.svg'),
        _buildCustomBottomNavigationBarItem('assets/image/aboutus.svg', 'About', 3,'assets/image/sldabtus.svg'),
        _buildCustomBottomNavigationBarItem('assets/image/contact.svg', 'Contact Us', 4,'assets/image/sldcntct.svg'),
        // Add other BottomNavigationBarItems as needed
      ],
      selectedItemColor: Colors.cyanAccent,
      selectedLabelStyle: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold,fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold,fontSize: 10),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    /*  onTap: (index) {
        setState(() {
          _currentIndex = index;
          if (index == 3) {
            shakeKey.currentState?.shake();
          }
          *//* _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeOut);*//*
        });
      }*/
      currentIndex: selectedIndex,
      onTap: onTabSelected,
    );
  }

  BottomNavigationBarItem _buildCustomBottomNavigationBarItem(
      String svgAssetPath, String label, int index,String svgAssetPathAction) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        svgAssetPath,
        semanticsLabel: 'My SVG Picture',
        width: 20,
        height: 20,
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
          width: 20,
          height: 20,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

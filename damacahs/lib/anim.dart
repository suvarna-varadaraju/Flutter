import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ZoomInOutAnimation(),
  ));
}

class ZoomInOutAnimation extends StatefulWidget {
  @override
  _ZoomInOutAnimationState createState() => _ZoomInOutAnimationState();
}

class _ZoomInOutAnimationState extends State<ZoomInOutAnimation> {
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();

    // Start the zoom-in and out animation
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom In/Out Animation Example'),
      ),
      body: Center(
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
            'assets/image/casacanal_4.jpg', // Replace with your image URL
            width: double.infinity, // Set the initial width of the image
            height: 200, // Set the initial height of the image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

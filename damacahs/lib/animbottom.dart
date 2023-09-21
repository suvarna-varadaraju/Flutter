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

class _ZoomInOutAnimationState extends State<ZoomInOutAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));

    _scaleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom In/Out Animation Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

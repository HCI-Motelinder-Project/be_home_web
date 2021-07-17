import 'package:behome/constraint/color_constant.dart';
import 'package:flutter/material.dart';

class LoadingAnimationScreen extends StatefulWidget {
  const LoadingAnimationScreen({Key key}) : super(key: key);

  @override
  _LoadingAnimationScreenState createState() => _LoadingAnimationScreenState();
}

class _LoadingAnimationScreenState extends State<LoadingAnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Offset> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
    _animation = TweenSequence([
      TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(0, 0.25),
          ),
          weight: 80),
      TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
            begin: Offset(0, 0.25),
            end: Offset.zero,
          ),
          weight: 20),
    ]).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: APP_BACKGROUND_COLOR_LIGHT,
        child: Center(
          child: Container(
            width: 75.0,
            child: SlideTransition(
              position: _animation,
              child: Image.asset(
                "assets/images/loading.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

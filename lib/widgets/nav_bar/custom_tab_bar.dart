import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  CustomTabBar({required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.4,
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicatorColor: Colors.transparent,
      ),
    );
  }
}

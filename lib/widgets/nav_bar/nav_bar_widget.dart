import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleNavbar extends StatelessWidget {
  final String title;

  TitleNavbar({ this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        this.title,
        style: navbarText,
      ),
    );
  }
}

class AnimatedButtonNavbar extends StatelessWidget {
  final String title;

  AnimatedButtonNavbar({ this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: AnimatedButton(40, 150, this.title, appMainColor),
    );
  }
}

class ButtonNavbar extends StatelessWidget {
  final String title;

  ButtonNavbar({ this.title});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: NormalButton(this.title),
      ),
    );
  }
}

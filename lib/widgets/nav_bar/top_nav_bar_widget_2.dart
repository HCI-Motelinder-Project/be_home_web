import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/views/admin/admin_view.dart';
import 'package:behome/views/home/home_view2.dart';
import 'package:behome/views/home/result_view.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'nav_bar_widget.dart';

class SecondTopNavBar extends StatefulWidget {
  const SecondTopNavBar({Key key}) : super(key: key);

  @override
  _SecondTopNavBarState createState() => _SecondTopNavBarState();
}

class _SecondTopNavBarState extends State<SecondTopNavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
              child: Text(
                "B E H O M E", style: TextStyle(fontSize: 40,color: APP_PRIMARY_COLOR, fontWeight: FontWeight.w600),
              )
            ),
          ),
        ],
      ),
    );
  }
}

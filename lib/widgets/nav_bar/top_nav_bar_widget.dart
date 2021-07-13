import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/views/home/home_view2.dart';
import 'package:behome/views/home/result_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav_bar_widget.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  String dropdownValue = 'Loại phòng';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image(
                  image: AssetImage('images/logo.png'),
                ),
                height: 75,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                underline: SizedBox(),
                value: "Loại phòng",
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                style: navbarText,
                onChanged: (String? newValue) {},
                items: <String>[
                  'Loại phòng',
                  'Phòng trọ',
                  'Nhà Nguyên Căn',
                  'Sleepbox',
                  'Phòng ở ghép'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultView()));
                        },
                        child: Text(value),
                      ));
                }).toList(),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  ButtonNavbar(title: "Đăng nhập"),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:behome/constraint/color_constant.dart';
import 'package:flutter/material.dart';

class FacilityServiceIcon extends StatefulWidget {
  final int iconData;

  const FacilityServiceIcon({Key key, this.iconData}) : super(key: key);

  @override
  _FacilityServiceIconState createState() => _FacilityServiceIconState();
}

class _FacilityServiceIconState extends State<FacilityServiceIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Icon(
        IconData(widget.iconData, fontFamily: "MaterialIcons"),
      ),
    );
  }
}

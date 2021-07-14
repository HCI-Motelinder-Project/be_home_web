import 'package:flutter/material.dart';

void makeSnackbarNotification(BuildContext context, String text, [Icon icon]) {
  Icon defaultIcon = Icon(
    Icons.info,
    color: Colors.blue,
  );

  ScaffoldMessenger.of(context).clearSnackBars();

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: <Widget>[
    icon ?? defaultIcon,
    SizedBox(width: 5.0),
    Text(text)
  ])));
}

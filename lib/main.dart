//@dart=2.9
import 'package:behome/views/admin/management_view.dart';
import 'package:behome/views/admin/admin_view.dart';
import 'package:behome/views/home/home_view2.dart';
import 'package:behome/views/home/rent_entity_detail_view.dart';
import 'package:behome/views/home/result_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans'
        )
      ),
      home: ManagementView(index: 3,),
    );
  }
}

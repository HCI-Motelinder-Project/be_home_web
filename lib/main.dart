//@dart=2.9
import 'package:behome/bloc/location_bloc.dart';
import 'package:behome/bloc/navigation_bloc.dart';
import 'package:behome/bloc/search_bloc.dart';
import 'package:behome/bloc/user_bloc.dart';
import 'package:behome/views/admin/management_view.dart';
import 'package:behome/views/admin/admin_view.dart';
import 'package:behome/views/home/home_view2.dart';
import 'package:behome/views/home/rent_entity_detail_view.dart';
import 'package:behome/views/home/result_view.dart';
import 'package:behome/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LocationBloc>(
        create: (context) => LocationBloc.getInstance()),
    ChangeNotifierProvider<NavigationBloc>(
        create: (context) => NavigationBloc.getInstance()),
    ChangeNotifierProvider<SearchBloc>(
        create: (context) => SearchBloc.getInstance()),
    ChangeNotifierProvider<UserBloc>(
        create: (context) => UserBloc.getInstance()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = userBloc ?? Provider.of<UserBloc>(context);
    if(userBloc.user != null )print(userBloc.user.roleId);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'Open Sans')),
      home: userBloc.user != null &&
              userBloc.user.roleId == "a1c1b8c9-930b-47fe-a457-9ceb8d2d7783"
          ? ManagementView(
              index: 0,
            )
          : LoginView(),
    );
  }
}

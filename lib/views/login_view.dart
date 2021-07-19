import 'package:behome/bloc/navigation_bloc.dart';
import 'package:behome/bloc/user_bloc.dart';
import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/style_constant.dart';
import 'package:behome/models/user_model.dart';
import 'package:behome/models/user_response_model.dart';
import 'package:behome/presenters/user_presenter.dart';
import 'package:behome/services/auth.dart';
import 'package:behome/services/firebase_utils.dart';
import 'package:behome/utils/notification.dart';
import 'package:behome/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  NavigationBloc navBloc;
  UserBloc userBloc;
  bool isLoading = false;

  void handleResponseFromServer(UserResponseModel response) async {
    if (response == null) {
      setState(() {
        isLoading = false;
      });
      makeSnackbarNotification(
          context,
          "Đăng nhập thất bại",
          Icon(
            MdiIcons.closeCircle,
            color: APP_NOTE_COLOR,
          ));
    } else if (response.statusCode == 200) {
      userBloc.setUser(response.user);
      // navBloc.setTabIndex(0);
    } else {
      makeSnackbarNotification(
        context,
        "Đăng nhập thất bại",
        Icon(
          MdiIcons.closeCircle,
          color: APP_NOTE_COLOR,
        ),
      );
    }
  }

  @override
  void initState() {
    isLoading = false;
    final FirebaseAuthUtils _firebaseUtils = FirebaseAuthUtils.instance;
    _firebaseUtils.authStateChanges().listen((user) async {
      if (user != null) {
        // if (mounted) {
        //   setState(() {
        //     isLoading = true;
        //   });
        // }
        String accessToken = await user.getIdToken(true);
        String uuid = user.uid;
        UserResponseModel response = await checkLogin(accessToken, uuid);
        handleResponseFromServer(response);
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    navBloc = navBloc ?? Provider.of<NavigationBloc>(context);
    userBloc = userBloc ?? Provider.of<UserBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      body: Center(
        child: isLoading
            ? LoadingAnimationScreen()
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      APP_BACKGROUND_COLOR_LIGHT,
                      APP_BACKGROUND_COLOR_LIGHT,
                      APP_PRIMARY_COLOR,
                    ],
                  ),
                ),
                padding: EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/icons/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Center(
                        child: Text('B E H O M E', style: WELCOME_TITLE_STYLE)),
                    SizedBox(
                      height: 50.0,
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: APP_SECONDARY_COLOR,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          makeSnackbarNotification(
                              context, 'Đang kiểm tra thông tin đăng nhập');
                          setState(() {
                            isLoading = true;
                          });
                          UserResponseModel response =
                              await FirebaseAuthUtils.instance.signInByGoogle();
                          handleResponseFromServer(response);
                        },
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.google,
                              color: APP_BUTTON_TEXT_COLOR,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Đăng nhập bằng Google",
                                textAlign: TextAlign.center,
                                style: BUTTON_TEXT_STYLE_18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

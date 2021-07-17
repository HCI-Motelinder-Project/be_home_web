import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/user_model.dart';
import 'package:behome/presenters/user_presenter.dart';
import 'package:behome/widgets/admin/account_widget.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:behome/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountManagement extends StatefulWidget {
  const AccountManagement({Key key}) : super(key: key);

  @override
  _AccountManagementState createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  List<Widget> _listUses = [];
  bool _isLoaded;

  Future<void> loadAllUsers() async {
    setState(() {
      _isLoaded = false;
    });
    int index = 0;
    loadUsers().then((value) {
      List<Widget> listUsers = value
          .map((item) => AccountWidget(index: index++, model: item))
          .toList();
      setState(() {
        _isLoaded = true;
        _listUses = listUsers;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? Container(
            width: MediaQuery.of(context).size.width * .6,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Danh sách tài khoản",
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          bottom:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .6 * .05,
                      alignment: Alignment.center,
                      child: Text("STT"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          bottom:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .6 * .25,
                      alignment: Alignment.center,
                      child: Text("Tên"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          bottom:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .6 * .3,
                      alignment: Alignment.center,
                      child: Text("Email"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          bottom:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .6 * .15,
                      alignment: Alignment.center,
                      child: Text("Vai trò"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          bottom:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * .6 * .15,
                      alignment: Alignment.center,
                      child: Text("Trạng thái"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          bottom:
                              BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .6 * .1 - 1,
                      alignment: Alignment.center,
                      child: Text("Hành động"),
                    )
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  color: Colors.white,
                  height: 800,
                  child: ListView(
                    children: _listUses,
                  ),
                )
              ],
            ),
          )
        : LoadingAnimationScreen();
  }
}

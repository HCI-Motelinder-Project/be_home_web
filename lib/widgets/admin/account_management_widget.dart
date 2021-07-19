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
    int index = 1;
    loadUsers().then((value) {
      List<Widget> listUsers = value
          .map((item) => AccountWidget(
                index: index++,
                model: item,
                function: loadAllUsers,
              ))
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
    double width = MediaQuery.of(context).size.width * .9;
    double height = MediaQuery.of(context).size.height;
    double tableWidth = MediaQuery.of(context).size.width * .9 - 40 - 20;

    if (_isLoaded) {
      return Container(
        width: width,
        height: height,
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: APP_PRIMARY_COLOR.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 20,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Danh sách tài khoản",
                      style: TextStyle(
                        fontSize: 30,
                        color: APP_PRIMARY_COLOR,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                      padding: EdgeInsets.all(10),
                      width: tableWidth * .05,
                      alignment: Alignment.center,
                      child: Text(
                        "STT",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                      padding: EdgeInsets.all(10),
                      width: tableWidth * .25,
                      alignment: Alignment.center,
                      child: Text(
                        "Tên",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                      padding: EdgeInsets.all(10),
                      width: tableWidth * .3,
                      alignment: Alignment.center,
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                      padding: EdgeInsets.all(10),
                      width: tableWidth * .2,
                      alignment: Alignment.center,
                      child: Text(
                        "Vai trò",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                      padding: EdgeInsets.all(10),
                      width: tableWidth * .1,
                      alignment: Alignment.center,
                      child: Text(
                        "Trạng thái",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                      padding: EdgeInsets.all(10),
                      width: tableWidth * .1 - 0.5,
                      alignment: Alignment.center,
                      child: Text(
                        "Hành động",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                height: 800,
                child: ListView(
                  children: _listUses,
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return LoadingAnimationScreen();
    }
  }
}

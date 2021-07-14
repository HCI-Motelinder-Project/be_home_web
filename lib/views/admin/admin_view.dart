import 'package:behome/constraint/color_constant.dart';
import 'package:behome/views/admin/management_view.dart';
import 'package:behome/widgets/admin/rent_entity_detail_admin.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMainView extends StatefulWidget {
  const AdminMainView({Key key}) : super(key: key);

  @override
  _AdminMainViewState createState() => _AdminMainViewState();
}

class _AdminMainViewState extends State<AdminMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appMainColor.withOpacity(0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: Center(
                child: TopNavBar(),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: .5, color: appMainColor),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .75,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .75,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: .5, color: appMainColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Xin chào, Admin",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: double.infinity),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ManagementView(index: 0,)));
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 200, maxHeight: 150),
                                width: 280,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.account_box_outlined,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Quản lý tài khoản",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 150,
                            color: appMainColor,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ManagementView(index: 1,)));
                              },
                              child: Container(
                                width: 280,
                                constraints: BoxConstraints(
                                    maxWidth: 200, maxHeight: 150),
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.sticky_note_2_outlined,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Quản lý bài đăng",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 150,
                            color: appMainColor,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ManagementView(index: 2,)));
                              },
                              child: Container(
                                width: 280,
                                constraints: BoxConstraints( maxHeight: 150),
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.home_outlined,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Quản lý",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "nhà trọ & nhà nguyên căn",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 150,
                            color: appMainColor,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ManagementView(index: 3,)));
                              },
                              child: Container(
                                width: 280,
                                constraints: BoxConstraints(
                                    maxWidth: 200, maxHeight: 150),
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.kitchen,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Quản lý",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          "cơ sở vật chất & dịch vụ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .75,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: .5, color: appMainColor),
                          bottom: BorderSide(width: .5, color: appMainColor),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Danh sách bài đăng đã duyệt",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Wrap(
                              children: [
                                Wrap(
                                  children: [
                                    RentEntityWidgetForAdmin(),
                                    RentEntityWidgetForAdmin(),
                                    RentEntityWidgetForAdmin(),
                                    RentEntityWidgetForAdmin(),
                                  ],
                                ),
                                Container(
                                  width: 150,
                                  height: 340,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          child: DecoratedIcon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 60,
                                            color: appMainColor,
                                            shadows: [
                                              BoxShadow(
                                                blurRadius: 6.0,
                                                color: appMainColor,
                                              ),
                                              BoxShadow(
                                                blurRadius: 6.0,
                                                color: appMainColor,
                                                offset: Offset(0, 1.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

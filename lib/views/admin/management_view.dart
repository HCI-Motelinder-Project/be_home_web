import 'package:behome/constraint/color_constant.dart';
import 'package:behome/views/home/home_view.dart';
import 'package:behome/widgets/admin/account_management_widget.dart';
import 'package:behome/widgets/admin/facility_service_management_widget.dart';
import 'package:behome/widgets/admin/house_manage_widget.dart';
import 'package:behome/widgets/admin/rententity_management_widget.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagementView extends StatefulWidget {
  final int index;
  final int rentIndex;

  const ManagementView({Key key, this.index,this.rentIndex}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  int lastIndex;
  int lastRentIndex;
  PageController _pageController = PageController();
  int count = 0;
  List<String> title = [
    "Quản lý tài khoản",
    "Quản lý-dịch vụ cho thuê",
    "Quản lý tiện ích",
  ];

  @override
  void initState() {
    super.initState();
    lastIndex = widget.index;
    widget.rentIndex != null ? lastRentIndex = widget.rentIndex : lastRentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: APP_PRIMARY_COLOR.withOpacity(0.1),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: Wrap(
          children: [
            Container(
              child: Center(
                child: SecondTopNavBar(),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .75,
                constraints: BoxConstraints(maxHeight: double.infinity),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                            right: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                          )),
                      width: MediaQuery.of(context).size.width * .15,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(
                              Icons.account_circle,
                              size: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
                            child: Text(
                              "Admin",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                              maxWidth: double.infinity,
                            ),
                            height: 500,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox();
                              },
                              itemCount: 3,
                              itemBuilder: (BuildContext, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      lastIndex = index;
                                      _pageController.animateToPage(index,
                                          duration: Duration(microseconds: 50),
                                          curve: Curves.ease);
                                    });
                                  },
                                  child: AnimatedContainer(
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: lastIndex == index
                                          ? APP_PRIMARY_COLOR
                                          : Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                            width: .5, color: APP_PRIMARY_COLOR),
                                        top: BorderSide(
                                            width: .5, color: APP_PRIMARY_COLOR),
                                      ),
                                    ),
                                    duration: Duration(microseconds: 500),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Tab(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              title[index].split("-")[0],
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: lastIndex == index
                                                    ? Colors.white
                                                    : APP_PRIMARY_COLOR,
                                              ),
                                            ),
                                            title[index].split("-").length > 1
                                                ? Container(
                                                    margin:
                                                        EdgeInsets.only(top: 2),
                                                    child: Text(
                                                      title[index]
                                                          .split("-")[1],
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            lastIndex == index
                                                                ? Colors.white
                                                                : APP_PRIMARY_COLOR,
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .6,
                      height: MediaQuery.of(context).size.height * .95,
                      decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                            right: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                          )),
                      child: PageView(
                        controller: _pageController,
                        children: [
                          if (lastIndex == 0) AccountManagement(),
                          if (lastIndex == 1) RentEntityManagementView(index: lastRentIndex,),
                          if (lastIndex == 2) FacilityServiceManagementView(),
                        ],
                      ),
                    ),
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

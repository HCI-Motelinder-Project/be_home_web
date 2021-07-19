import 'package:behome/constraint/color_constant.dart';
import 'package:behome/views/home/home_view.dart';
import 'package:behome/widgets/admin/account_management_widget.dart';
import 'package:behome/widgets/admin/dashboard_widget.dart';
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

  const ManagementView({Key key, this.index, this.rentIndex}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  int lastIndex;
  int lastRentIndex;
  PageController _pageController = PageController();
  int count = 0;
  List<String> title = [
    "Trang chủ-57777",
    "Tài khoản-58310",
    "Bài đăng-58444",
    "Tiện ích-62648",
  ];

  @override
  void initState() {
    super.initState();
    lastIndex = widget.index;
    widget.rentIndex != null
        ? lastRentIndex = widget.rentIndex
        : lastRentIndex = 0;
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
            // Container(
            //   child: Center(
            //     child: SecondTopNavBar(),
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border(
            //       bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
            //     ),
            //   ),
            // ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                constraints: BoxConstraints(maxHeight: double.infinity),
                color: APP_PRIMARY_COLOR,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "BEHOME",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    letterSpacing: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                              maxWidth: double.infinity,
                            ),
                            height: MediaQuery.of(context).size.height * .8,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: 4,
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
                                    height: 150,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(15)),
                                      color: lastIndex == index
                                          ? Colors.white
                                          : APP_PRIMARY_COLOR,
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
                                            title[index].split("-").length > 1
                                                ? Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      border: Border.all(
                                                        width: 2,
                                                        color: lastIndex ==
                                                                index
                                                            ? APP_PRIMARY_COLOR
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      IconData(
                                                        int.parse(title[index]
                                                            .split("-")
                                                            .last),
                                                        fontFamily:
                                                            "MaterialIcons",
                                                      ),
                                                      color: lastIndex == index
                                                          ? APP_PRIMARY_COLOR
                                                          : Colors.white,
                                                      size: 30,
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                            SizedBox(height: 10),
                                            Text(
                                              title[index].split("-")[0],
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: lastIndex == index
                                                    ? APP_PRIMARY_COLOR
                                                    : Colors.white,
                                                letterSpacing: 2,
                                              ),
                                            ),
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
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          border: Border(
                        right: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                      )),
                      child: PageView(
                        controller: _pageController,
                        children: [
                          if (lastIndex == 0) Dashboard(),
                          if (lastIndex == 1) AccountManagement(),
                          if (lastIndex == 2)
                            RentEntityManagementView(
                              index: lastRentIndex,
                            ),
                          if (lastIndex == 3) FacilityServiceManagementView(),
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

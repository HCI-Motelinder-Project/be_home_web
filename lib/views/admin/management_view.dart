import 'package:behome/constraint/color_constant.dart';
import 'package:behome/views/home/home_view.dart';
import 'package:behome/widgets/admin/account_management_widget.dart';
import 'package:behome/widgets/admin/facility_service_management_widget.dart';
import 'package:behome/widgets/admin/house_manage_widget.dart';
import 'package:behome/widgets/admin/post_management_widget.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagementView extends StatefulWidget {
  final int index;

  const ManagementView({Key? key, required this.index}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  late int lastIndex;
  PageController _pageController = PageController();
  int count = 0;
  List<String> title = [
    "Quản lý tài khoản",
    "Quản lý bài đăng",
    "Quản lý-nhà trọ & nhà nguyên căn",
    "Quản lý-cơ sở vật chất & dịch vụ",
  ];

  @override
  void initState() {
    super.initState();
    lastIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appMainColor.withOpacity(0.1),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: Wrap(
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
                constraints: BoxConstraints(maxHeight: double.infinity),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(color: appMainColor, width: .5),
                            right: BorderSide(color: appMainColor, width: .5),
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
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: lastIndex == index
                                          ? appMainColor
                                          : Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                            width: .5, color: appMainColor),
                                        top: BorderSide(
                                            width: .5, color: appMainColor),
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
                                                    : appMainColor,
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
                                                                : appMainColor,
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
                          color: Colors.green,
                          border: Border(
                            left: BorderSide(color: appMainColor, width: .5),
                            right: BorderSide(color: appMainColor, width: .5),
                          )),
                      child: PageView(
                        controller: _pageController,
                        children: [
                          if (lastIndex == 0) AccountManagement(),
                          if (lastIndex == 1) PostManagementView(),
                          if (lastIndex == 2) HouseManagementView(),
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

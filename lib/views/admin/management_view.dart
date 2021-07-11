import 'package:behome/constraint/color_constant.dart';
import 'package:behome/widgets/admin/account_management_widget.dart';
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

  @override
  void initState() {
    super.initState();
    lastIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: lastIndex,
      child: Builder(
        builder: (BuildContext context) {
          final TabController? tabController = DefaultTabController.of(context);
          tabController!.addListener(() {
            if (!tabController.indexIsChanging) {
              switch (tabController.index) {
                case 0:
                  lastIndex = 0;
                  break;
                case 1:
                  lastIndex = 1;
                  break;
                case 2:
                  lastIndex = 2;
                  break;
                case 3:
                  lastIndex = 3;
                  break;
                default:
                  lastIndex = 0;
                  break;
              }
            }
          });
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
                                  left: BorderSide(color: appMainColor,width: .5),
                                  right: BorderSide(color: appMainColor,width: .5),
                                )
                            ),
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
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 10),
                                  child: Text(
                                    "Admin",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          width: .5, color: appMainColor),
                                      top: BorderSide(
                                          width: .5, color: appMainColor),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Tab(
                                          child: Text(
                                            "Quản lý tài khoản",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          width: .5, color: appMainColor),
                                      top: BorderSide(
                                          width: .5, color: appMainColor),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Tab(
                                          child: Text(
                                            "Quản lý bài đăng",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          width: .5, color: appMainColor),
                                      top: BorderSide(
                                          width: .5, color: appMainColor),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Tab(
                                          child: Text(
                                            "Quản lý cơ sở vật chất",
                                            style: TextStyle(fontSize: 18),
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      bottom: BorderSide(
                                          width: .5, color: appMainColor),
                                      top: BorderSide(
                                          width: .5, color: appMainColor),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Tab(
                                          child: Text(
                                            "Quản lý dịch vụ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            height: MediaQuery.of(context).size.height * .95,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border(
                                  left: BorderSide(color: appMainColor,width: .5),
                                  right: BorderSide(color: appMainColor,width: .5),
                                )
                            ),
                            child: TabBarView(
                              children: [
                                AccountManagement(),
                                AccountManagement(),
                                AccountManagement(),
                                AccountManagement(),
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
        },
      ),
    );
  }
}

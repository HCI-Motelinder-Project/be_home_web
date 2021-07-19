import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:behome/presenters/facility_presenter.dart';
import 'package:behome/presenters/rent_item_presenter.dart';
import 'package:behome/presenters/service_presenter.dart';
import 'package:behome/presenters/user_presenter.dart';
import 'package:behome/views/admin/management_view.dart';
import 'package:behome/widgets/admin/rent_entity_detail_admin.dart';
import 'package:behome/widgets/loading_widget.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int availableRentEntity;
  int userCount;
  int utilityCount = 0;

  bool _isLoaded;
  List<Widget> _listHorizontalWidget = [];

  Future<void> loadSomeAvailableRentEntities() async {
    setState(() {
      _isLoaded = false;
    });
    loadAllRentEntities().then((value) {
      List<Widget> listRents = value
          .map((item) => RentEntityWidgetForAdmin(
                model: item,
              ))
          .toList();
      setState(() {
        for (int i = 0; i < 4; i++) _listHorizontalWidget.add(listRents[i]);
        _isLoaded = true;
      });
    });
  }

  Future<void> getRentEntityCount() async {
    getAvailableRentEntityCount().then((value) {
      setState(() {
        availableRentEntity = value;
      });
    });
  }

  Future<void> getUserCount() async {
    getAllUserCount().then((value) {
      setState(() {
        userCount = value;
      });
    });
  }

  Future<void> getUtilityCount() async {
    getAllFacilityCount().then((value) {
      setState(() {
        utilityCount += value;
      });
    });
    getAllServiceCount().then((value) {
      setState(() {
        utilityCount += value;
      });
    });
  }

  void loadAll() {
    getRentEntityCount();
    getUserCount();
    getUtilityCount();
    loadSomeAvailableRentEntities();
  }

  @override
  void initState() {
    super.initState();
    loadAll();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .9;
    double height = MediaQuery.of(context).size.height;

    return _isLoaded
        ? Container(
            width: width,
            height: height,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        ClipPath(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            height: 300,
                            color: APP_PRIMARY_COLOR,
                          ),
                          clipper: Clipper(),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(right: 20.0, left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 400.0,
                                width: width * .3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      child: Container(
                                        width: 350,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: APP_PRIMARY_COLOR
                                                  .withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 20,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.account_box_outlined,
                                              size: 100,
                                            ),
                                            Text(
                                              "Tổng số tài khoản hiện có: " +
                                                  userCount.toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 400.0,
                                width: width * .3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      child: Container(
                                        width: 350,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: APP_PRIMARY_COLOR
                                                  .withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 20,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.account_box_outlined,
                                              size: 100,
                                            ),
                                            Text(
                                              "Tổng số bài viết đã xác thực: " +
                                                  availableRentEntity
                                                      .toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 400.0,
                                width: width * .3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      child: Container(
                                        width: 350,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: APP_PRIMARY_COLOR
                                                  .withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 20,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.account_box_outlined,
                                              size: 100,
                                            ),
                                            Text(
                                              "Tổng số tiện ích cung cấp: " +
                                                  utilityCount.toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: APP_PRIMARY_COLOR.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Danh sách bài đăng đã xác thực",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Wrap(
                            children: [
                              Wrap(children: _listHorizontalWidget),
                              Container(
                                width: 120,
                                height: 340,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ManagementView(
                                                        index: 2,
                                                        rentIndex: 1,
                                                      )));
                                        },
                                        child: DecoratedIcon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 60,
                                          color: APP_PRIMARY_COLOR,
                                          shadows: [
                                            BoxShadow(
                                              blurRadius: 6.0,
                                              color: APP_PRIMARY_COLOR,
                                            ),
                                            BoxShadow(
                                              blurRadius: 6.0,
                                              color: APP_PRIMARY_COLOR,
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
        : LoadingAnimationScreen();
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 80, size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}

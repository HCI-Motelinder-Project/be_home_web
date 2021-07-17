import 'package:behome/constraint/color_constant.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';

class HouseManagementView extends StatefulWidget {
  const HouseManagementView({Key key}) : super(key: key);

  @override
  _HouseManagementViewState createState() => _HouseManagementViewState();
}

class _HouseManagementViewState extends State<HouseManagementView> {
   int lastIndex;
  PageController _pageController = PageController();
  List<String> title = ["Chưa xác thực", "Đã xác thực"];

  @override
  void initState() {
    super.initState();
    lastIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              ),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
              ),
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                },
                itemCount: 2,
                itemBuilder: (BuildContext, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        lastIndex = index;
                        _pageController.jumpToPage(index);
                      });
                    },
                    child: AnimatedContainer(
                      height: 60,
                      decoration: BoxDecoration(
                        color: lastIndex == index ? APP_PRIMARY_COLOR : Colors.white,
                        border: Border(
                          bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                          top: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                        ),
                      ),
                      duration: Duration(microseconds: 500),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6 * 0.5,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Tab(
                            child: Text(
                              title[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: lastIndex == index
                                    ? Colors.white
                                    : APP_PRIMARY_COLOR,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 850,
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border(
                  left: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                  right: BorderSide(color: APP_PRIMARY_COLOR, width: .5),
                )),
            child: PageView(
              controller: _pageController,
              children: [
                ListPendingHouse(),
                ListApprovedHouse(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ApprovedHouseWidget() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: APP_PRIMARY_COLOR),
        boxShadow: [
          BoxShadow(
            color: APP_PRIMARY_COLOR.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 200,
            child: Image.asset(
              "images/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .6 - 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Nhà Trọ Minh Long",
                          style: TextStyle(fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text("Trạng thái: "),
                            Text(
                              "Đã xác thực",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
                            SizedBox(width: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Số phòng sở hữu: 3",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Số phòng còn lại: 2",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Giá thuê tầm: 3-5 triệu / tháng",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Cung cấp các loại dịch vụ cho thuê: Căn hộ, phòng trọ",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6 - 350,
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Địa chỉ: 302 Nguyễn Đình Chiểu",
                      style: TextStyle(fontSize: 20),
                    ),
                    AnimatedButton(40, 200, "Hủy xác thực", Colors.red),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget PendingHouseWidget() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: APP_PRIMARY_COLOR),
        boxShadow: [
          BoxShadow(
            color: APP_PRIMARY_COLOR.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 200,
            child: Image.asset(
              "images/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .6 - 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Nhà Trọ Minh Long",
                          style: TextStyle(fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text("Trạng thái: "),
                            Text(
                              "Đang chờ xác thực",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 16),
                            ),
                            SizedBox(width: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Số phòng sở hữu: 3",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Giá thuê tầm: 3-5 triệu / tháng",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cung cấp các loại dịch vụ cho thuê: Căn hộ, phòng trọ",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6 - 350,
                height: 39,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Địa chỉ: 302 Nguyễn Đình Chiểu",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        AnimatedButton(40, 200, "Không phù hợp", Colors.red),
                        SizedBox(
                          width: 10,
                        ),
                        AnimatedButton(40, 150, "Xác Thực", APP_PRIMARY_COLOR),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget ListApprovedHouse() {
    return Container(
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      color: Colors.white,
      height: 850,
      child: ListView(
        children: [
          ApprovedHouseWidget(),
        ],
      ),
    );
  }

  Widget ListPendingHouse() {
    return Container(
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      color: Colors.white,
      height: 850,
      child: ListView(
        children: [
          PendingHouseWidget(),
        ],
      ),
    );
  }
}

import 'package:behome/constraint/color_constant.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';

class PostManagementView extends StatefulWidget {
  const PostManagementView({Key? key}) : super(key: key);

  @override
  _PostManagementViewState createState() => _PostManagementViewState();
}

class _PostManagementViewState extends State<PostManagementView> {
  late int lastIndex;
  PageController _pageController = PageController();
  List<String> title = ["Đang chờ phê duyệt", "Đã phê duyệt", "Đã hủy bỏ"];

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
                bottom: BorderSide(width: .5, color: appMainColor),
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
                itemCount: 3,
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
                        color: lastIndex == index ? appMainColor : Colors.white,
                        border: Border(
                          bottom: BorderSide(width: .5, color: appMainColor),
                          top: BorderSide(width: .5, color: appMainColor),
                        ),
                      ),
                      duration: Duration(microseconds: 500),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6 * 0.33,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Tab(
                            child: Text(
                              title[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: lastIndex == index
                                    ? Colors.white
                                    : appMainColor,
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
                  left: BorderSide(color: appMainColor, width: .5),
                  right: BorderSide(color: appMainColor, width: .5),
                )),
            child: PageView(
              controller: _pageController,
              children: [
                ListPendingWidget(),
                ListApprovedWidget(),
                ListCanceledWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget PendingPostWidget() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: appMainColor),
        boxShadow: [
          BoxShadow(
            color: appMainColor.withOpacity(0.5),
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
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .6 - 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Phòng trọ Minh Long",
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text("Trạng thái: "),
                        Text(
                          "Đang chờ phê duyệt",
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Giới tính: Nam",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 125,),
                    Text(
                      "Số lượng: 2 người",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Cơ sở vật chất:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("2"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.bed_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.bathroom_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.kitchen_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.ac_unit),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Dịch vụ:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 36,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.local_hospital_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.restaurant_menu_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pool_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.directions_bike_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
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
                        AnimatedButton(40, 200, "Không chấp nhận", Colors.red),
                        SizedBox(
                          width: 10,
                        ),
                        AnimatedButton(40, 150, "Duyệt", appMainColor),
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

  Widget ApprovedPostWidget() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: appMainColor),
        boxShadow: [
          BoxShadow(
            color: appMainColor.withOpacity(0.5),
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
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .6 - 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Phòng trọ Minh Long",
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text("Trạng thái: "),
                        Text(
                          "Đã phê duyệt",
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Giới tính: Nam",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 125,),
                    Text(
                      "Số lượng: 2 người",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Cơ sở vật chất:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("2"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.bed_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.bathroom_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.kitchen_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.ac_unit),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Dịch vụ:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 36,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.local_hospital_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.restaurant_menu_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pool_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.directions_bike_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    AnimatedButton(40, 200, "Xóa bài", Colors.red),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget CanceledPostWidget() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: appMainColor),
        boxShadow: [
          BoxShadow(
            color: appMainColor.withOpacity(0.5),
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
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .6 - 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Phòng trọ Minh Long",
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text("Trạng thái: "),
                        Text(
                          "Đã hủy bỏ",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Giới tính: Nam",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 125,),
                    Text(
                      "Số lượng: 2 người",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Cơ sở vật chất:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("2"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.bed_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.bathroom_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.kitchen_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("1"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.ac_unit),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Text(
                      "Dịch vụ:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: 36,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.local_hospital_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.restaurant_menu_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pool_outlined),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: appMainColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.directions_bike_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
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
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget ListPendingWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      color: Colors.white,
      height: 850,
      child: ListView(
        children: [
          PendingPostWidget(),
        ],
      ),
    );
  }

  Widget ListApprovedWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      color: Colors.white,
      height: 850,
      child: ListView(
        children: [
          ApprovedPostWidget(),
        ],
      ),
    );
  }

  Widget ListCanceledWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      color: Colors.white,
      height: 850,
      child: ListView(
        children: [
          CanceledPostWidget(),
        ],
      ),
    );
  }
}

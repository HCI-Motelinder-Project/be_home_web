import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:behome/widgets/carousel_slider/manually_carousel.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentEntityDetail extends StatefulWidget {
  const RentEntityDetail({Key key}) : super(key: key);

  @override
  _RentEntityDetailState createState() => _RentEntityDetailState();
}

class _RentEntityDetailState extends State<RentEntityDetail> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: APP_PRIMARY_COLOR.withOpacity(0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                ),
              ),
              child: Center(
                child: TopNavBar(),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * .3,
                  child: ManuallyCarouselSlider(),
                ),
                Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * .45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(25)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phòng trọ Minh Long", style: detailTitleStyle),
                          Container(
                            width: MediaQuery.of(context).size.width * .45,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "GIÁ PHÒNG",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "5.500.000 đồng",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SỨC CHỨA",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "2 Nam hoặc Nữ",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "DIỆN TÍCH",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "30 mét vuông",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ĐẶT CỌC",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "1 tháng",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ĐIỆN",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "3.000 đồng",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height:60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "NƯỚC",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "100.000 đồng",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "WIFI",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "150.000 đồng",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 60,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: APP_PRIMARY_COLOR.withOpacity(.1),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "TRẠNG THÁI",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "Còn phòng",
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .45,
                            decoration: BoxDecoration(
                              color: APP_PRIMARY_COLOR.withOpacity(.1),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ĐỊA CHỈ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "1 Nguyễn Du, phường 5, quận 1",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          AnimatedButton(
                              50,
                              MediaQuery.of(context).size.width * 0.5,
                              "Đặt lịch hẹn",
                              APP_PRIMARY_COLOR),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(right: 10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: APP_PRIMARY_COLOR,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Thông tin người đăng",
                              style: detailFacilityStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text("Tên : Nguyễn Thiên Long"),
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 2,
                              color: APP_PRIMARY_COLOR,
                            ),
                            Column(
                              children: [
                                Text("Ngày đăng"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("7-7-2021"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Cơ sở vật chất",
                                  style: detailFacilityStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .45,
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.bed_outlined, size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("2 phòng ngủ"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.bathroom_outlined, size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("2 nhà vệ sinh"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.kitchen, size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Nhà bếp"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.ac_unit, size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Có máy lạnh"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.lock_outline, size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Khóa thông minh"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dịch vụ",
                                  style: detailFacilityStyle,
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .45,
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.local_hospital_outlined,
                                            size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Gần bệnh viện"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.restaurant_menu_outlined,
                                            size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Gần nhiều quán ăn"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.pool_outlined, size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Gần hồ bơi"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.directions_bike_outlined,
                                            size: 40),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Gửi xe 24/7"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 20),
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.notes_outlined,
                                  color: APP_PRIMARY_COLOR,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Mô tả thêm",
                                  style: detailFacilityStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "💯💯 Phòng trọ mới xây, giá siêu rẻ lại tiện nghi" +
                                      "\nĐịa chỉ: đường số 27, Nguyễn Xiển, Long Thạnh Mỹ, Q9" +
                                      "\nGiá HOT: 2.500.000/ tháng" +
                                      "\n👉 Chỗ để xe rộng rãi , khóa vân tay an toàn, KHÔNG TÍNH PHÍ" +
                                      "\n👉 Máy lạnh có sẵn, KHÔNG THÊM PHÍ" +
                                      "\nPhí dịch vụ rẻ khu vực:" +
                                      "\n- Điện 3k, nước 17k/khối" +
                                      "\n- Wifi 50k/ người" +
                                      "\n____________________________________________" +
                                      "\n📌 Có gác cao, kệ bếp riêng, nhà WC riêng" +
                                      "\n📌 Có cửa sổ trên và dưới gác thoáng mát không sợ mùa nóng" +
                                      "\n📌 Thang máy tiện lợi" +
                                      "\n📌 Sau 2 tháng sẽ có thêm gác thoải mái rộng rãi" +
                                      "\n📌 Giờ giấc tự do 24/24, khu vực an ninh sạch sẽ",
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

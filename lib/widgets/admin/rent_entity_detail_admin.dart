import 'package:behome/constraint/color_constant.dart';
import 'package:flutter/material.dart';

class RentEntityWidgetForAdmin extends StatefulWidget {
  const RentEntityWidgetForAdmin({Key? key}) : super(key: key);

  @override
  _RentEntityWidgetForAdminState createState() =>
      _RentEntityWidgetForAdminState();
}

class _RentEntityWidgetForAdminState extends State<RentEntityWidgetForAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(color: appMainColor, width: .5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 130,
            child: Image.asset(
              "images/background.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                width: 370,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phòng trọ Minh Long",
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Giới tính: Nam",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Địa chỉ: 352 Nguyễn Đình Chiểu",
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Column(
                        children: [
                          Text(
                            "3.5",
                            style: TextStyle(fontSize: 45),
                          ),
                          Text(
                            "tr/phòng",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 370,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 20,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Đã phê duyệt",
                      style: TextStyle(color: Colors.green),
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
}

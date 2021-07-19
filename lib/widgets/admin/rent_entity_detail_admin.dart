import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:flutter/material.dart';

class RentEntityWidgetForAdmin extends StatefulWidget {
  final RentItemModel model;

  const RentEntityWidgetForAdmin({Key key, this.model}) : super(key: key);

  @override
  _RentEntityWidgetForAdminState createState() =>
      _RentEntityWidgetForAdminState();
}

class _RentEntityWidgetForAdminState extends State<RentEntityWidgetForAdmin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .9;
    double height = MediaQuery.of(context).size.height;
    double contentWidth = width * 0.43;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: contentWidth,
      decoration: BoxDecoration(
        border: Border.all(color: APP_PRIMARY_COLOR, width: .5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: APP_PRIMARY_COLOR.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage(widget.model.imageCover),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                width: contentWidth - 250,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.model.name,
                          style: TextStyle(fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Giới tính: " + widget.model.gender,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Loại: " + widget.model.type,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.model.price.split(" ")[0],
                            style: TextStyle(
                                fontSize: 40, color: APP_PRIMARY_COLOR),
                          ),
                          Text(
                            widget.model.price.split(" ")[1] + " / tháng",
                            style: TextStyle(
                                fontSize: 20, color: APP_PRIMARY_COLOR),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: contentWidth - 250,
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "Địa chỉ: " + widget.model.address,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
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

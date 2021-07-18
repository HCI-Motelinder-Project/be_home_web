import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:behome/presenters/rent_item_presenter.dart';
import 'package:behome/widgets/admin/rententity_facility_service_widget.dart';
import 'package:flutter/material.dart';
import "package:charcode/charcode.dart";

class PendingPostWidget extends StatefulWidget {
  final RentItemModel model;
  final Function function;

  const PendingPostWidget({Key key, this.model, this.function}) : super(key: key);

  @override
  _PendingPostWidgetState createState() => _PendingPostWidgetState();
}

class _PendingPostWidgetState extends State<PendingPostWidget> {

  List<Widget> listFacilities;
  List<Widget> listServices;

  @override
  void initState() {
    super.initState();
    listFacilities = widget.model.facilities
        .map((e) => FacilityServiceIcon(
      iconData: e,
    ))
        .toList();
    listServices = widget.model.services
        .map((e) => FacilityServiceIcon(
      iconData: e,
    ))
        .toList();
    ;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      height: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: APP_PRIMARY_COLOR),
        borderRadius: BorderRadius.circular(8.0),
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
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage(widget.model.imageCover), fit: BoxFit.cover),
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
                      widget.model.name,
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text("Trạng thái: "),
                        Text(
                          "Đang chờ xác thực",
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6 - 350,
                height: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text(
                                  "Người đăng: " + widget.model.ownerName,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 125,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text(
                                  "Loại: " + widget.model.type,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 125,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text(
                                  "Giới tính: " + widget.model.gender,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 125,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text(
                                  "Diện tích: " +
                                      widget.model.area.toString() +
                                      " m" +
                                      String.fromCharCode($sup2),
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 125,
                                ),
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
                                  constraints: BoxConstraints(
                                    maxHeight: 100,
                                  ),
                                  width: 200,
                                  height: 30,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: listFacilities,
                                  ),
                                )
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
                                  constraints: BoxConstraints(
                                    maxHeight: 100,
                                  ),
                                  width: 200,
                                  height: 30,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: listServices,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.model.price.split(" ")[0],
                            style: TextStyle(
                                fontSize: 60, color: APP_PRIMARY_COLOR),
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
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () async {
                                widget.model.status = "Rejected";
                                await updateRentEntity(widget.model);
                                await widget.function();
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Center(
                                    child: Text(
                                  "Không xác thực",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                )),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () async {
                                widget.model.status = "Available";
                                await updateRentEntity(widget.model);
                                await widget.function();
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: APP_PRIMARY_COLOR),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Center(
                                    child: Text(
                                  "Xác thực",
                                  style: TextStyle(
                                      color: APP_PRIMARY_COLOR, fontSize: 18),
                                )),
                              )),
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

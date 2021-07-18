import 'dart:developer';

import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/service_model.dart';
import 'package:behome/presenters/service_presenter.dart';
import 'package:behome/widgets/admin/facility_service_management_widget.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateServiceModal extends StatefulWidget {
  const CreateServiceModal({Key key}) : super(key: key);

  @override
  _CreateServiceModalState createState() => _CreateServiceModalState();
}

const _iconTypes = <IconData>[
  Icons.local_parking,
  Icons.lock_outlined,
  Icons.local_hospital_outlined,
  Icons.restaurant,
  Icons.pool_outlined,
  Icons.local_cafe_outlined,
  Icons.local_gas_station_outlined,
  Icons.shopping_cart_outlined,
  Icons.shopping_bag_outlined,
  Icons.local_laundry_service_outlined,
  Icons.pets_outlined,
  Icons.access_time_outlined,
  Icons.room_service_outlined,
  Icons.school_outlined,
  Icons.directions_bus_outlined,
];

class _CreateServiceModalState extends State<CreateServiceModal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  IconData iconSelected;

  Future<void> createNewService() async {
    ServiceModel model = ServiceModel(
        icon: iconSelected.codePoint.toString(),
        name: _titleController.value.text,
        id: null,
        status: null);
    await createService(model);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .5),
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            padding: EdgeInsets.all(20),
            height: 350,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Thêm dịch vụ",
                        style:
                            TextStyle(fontSize: 24, color: APP_PRIMARY_COLOR),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 500,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Tiêu đề",
                        style:
                            TextStyle(fontSize: 16, color: APP_PRIMARY_COLOR),
                      ),
                      Container(
                        width: 500,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nhập tiêu đề..',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập tiêu đề';
                            }
                            return null;
                          },
                          controller: _titleController,
                        ),
                      ),
                      Text(
                        "Loại",
                        style:
                            TextStyle(fontSize: 16, color: APP_PRIMARY_COLOR),
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        width: 500,
                        // dropdown below..
                        child: DropdownButtonFormField<IconData>(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                            ),
                            isExpanded: true,
                            value: iconSelected,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            alignment: Alignment.centerRight,
                            onChanged: (IconData newValue) {
                              if (newValue == null) {
                                _formKey.currentState.validate();
                              }
                              setState(() {
                                iconSelected = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Vui lòng chọn một loại cơ sở vật chất';
                              }
                              return null;
                            },
                            items: _iconTypes.map<DropdownMenuItem<IconData>>((IconData value) {
                              return DropdownMenuItem<IconData>(
                                value: value,
                                child: Icon(value),
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await createNewService();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: APP_PRIMARY_COLOR),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Center(child: NormalButton("Tạo")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

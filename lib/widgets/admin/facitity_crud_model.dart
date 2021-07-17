import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/facility_model.dart';
import 'package:behome/presenters/facility_presenter.dart';
import 'package:behome/widgets/admin/facility_service_management_widget.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateFacilityModal extends StatefulWidget {
  const CreateFacilityModal({Key key}) : super(key: key);

  @override
  _CreateFacilityModalState createState() => _CreateFacilityModalState();
}

var iconData = {
  "Giường": "57559",
  "Tủ lạnh": "58206",
  "Máy giặt": "61824",
  "Wifi": "62668",
  "Nhà vệ sinh": "61118",
  "Cửa sổ": "59120",
  "Sân vườn": "62682",
};

const _iconTypes = <IconData>[
  Icons.bed_outlined,
  Icons.kitchen,
  Icons.local_laundry_service_outlined,
  Icons.wifi,
  Icons.bathroom_outlined,
  Icons.bathtub_outlined,
  Icons.window_outlined,
  Icons.yard_outlined,
];

class _CreateFacilityModalState extends State<CreateFacilityModal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  IconData iconSelected;

  Future<void> createNewFacility() async {
    FacilityModel model = FacilityModel(
        icon: iconSelected.codePoint.toString(),
        name: _titleController.value.text,
        id: null,
        status: null);
    await createFacility(model);
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Thêm cơ sở vật chất",
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
                            mainAxisSize: MainAxisSize.min,
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
                        await createNewFacility();
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
                      child: Center(
                        child: NormalButton("Tạo"),
                      ),
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

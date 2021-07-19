import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/facility_model.dart';
import 'package:behome/models/service_model.dart';
import 'package:behome/presenters/facility_presenter.dart';
import 'package:behome/presenters/service_presenter.dart';
import 'package:behome/views/admin/management_view.dart';
import 'package:behome/widgets/admin/facitity_crud_model.dart';
import 'package:behome/widgets/admin/service_crud_model.dart';
import 'package:behome/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class FacilityServiceManagementView extends StatefulWidget {
  const FacilityServiceManagementView({Key key}) : super(key: key);

  @override
  _FacilityServiceManagementViewState createState() =>
      _FacilityServiceManagementViewState();
}

class _FacilityServiceManagementViewState
    extends State<FacilityServiceManagementView> {
  List<Widget> _listFacilities = [];
  List<Widget> _listServices = [];
  bool _isLoadFacilities;
  bool _isLoadServices;

  void loadAllFacilities() {
    setState(() {
      _isLoadFacilities = false;
    });
    loadFacilities().then((value) {
      List<Widget> listFacilities =
          value.map((item) => UtilityWidgetForFacility(item)).toList();
      setState(() {
        _listFacilities = listFacilities;
        _isLoadFacilities = true;
      });
    });
  }

  void loadAllServices() {
    setState(() {
      _isLoadServices = false;
    });
    loadServices().then((value) {
      List<Widget> listServices =
          value.map((item) => UtilityWidgetForService(item)).toList();
      setState(() {
        _listServices = listServices;
        _isLoadServices = true;
      });
    });
  }

  void loadAll() {
    loadAllFacilities();
    loadAllServices();
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
    return _isLoadFacilities && _isLoadServices
        ? Container(
            width: width,
            height:height,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: APP_PRIMARY_COLOR.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Danh sách cơ sở vật chất hiện có",
                            style: TextStyle(fontSize: 20)),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CreateFacilityModal();
                                },
                              ).then(
                                (value) {
                                  loadAll();
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: _listFacilities,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Danh sách dịch vụ hiện có",
                            style: TextStyle(fontSize: 20)),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CreateServiceModal();
                                },
                              ).then((value) {
                                loadAll();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: _listServices,
                    ),
                  ),
                ],
              ),
            ),
          )
        : LoadingAnimationScreen();
  }

  Widget UtilityWidgetForFacility(FacilityModel model) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: APP_PRIMARY_COLOR, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Wrap(
        children: [
          Icon(
            IconData(int.parse(model.icon), fontFamily: "MaterialIcons"),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            model.name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await updateFacility(model);
                loadAllFacilities();
              },
              child: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget UtilityWidgetForService(ServiceModel model) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: APP_PRIMARY_COLOR),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Wrap(
        children: [
          Icon(
            IconData(int.parse(model.icon), fontFamily: "MaterialIcons"),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            model.name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await updateService(model);
                loadAllServices();
              },
              child: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

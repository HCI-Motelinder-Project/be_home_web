import 'package:behome/constraint/color_constant.dart';
import 'package:flutter/material.dart';

class FacilityServiceManagementView extends StatefulWidget {
  const FacilityServiceManagementView({Key? key}) : super(key: key);

  @override
  _FacilityServiceManagementViewState createState() =>
      _FacilityServiceManagementViewState();
}

class _FacilityServiceManagementViewState
    extends State<FacilityServiceManagementView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: .5, color: appMainColor),
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
                          return Container();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Wrap(
            children: [],
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: .5, color: appMainColor),
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
                          return Container();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

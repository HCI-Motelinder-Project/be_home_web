import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/user_model.dart';
import 'package:behome/presenters/user_presenter.dart';
import 'package:behome/views/admin/management_view.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatefulWidget {
  final int index;
  final UserModel model;
  final Function function;

  const AccountWidget({Key key, this.index, this.model, this.function})
      : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

List<String> listRole = ["Admin", "Renter", "Owner"];
List<String> listStatus = ["Active", "Disabled"];

class _AccountWidgetState extends State<AccountWidget> {
  String getRoleString(Role role) {
    switch (role) {
      case Role.ADMIN:
        return listRole[0];
      case Role.RENTER:
        return listRole[1];
      case Role.OWNER:
        return listRole[2];
    }
  }

  Role getRoleEnum(String role) {
    switch (role) {
      case "Owner":
        return Role.OWNER;
      case "Admin":
        return Role.ADMIN;
      default:
        return Role.RENTER;
    }
  }

  @override
  Widget build(BuildContext context) {
    String roleSelected = getRoleString(widget.model.role);
    String statusSelected = widget.model.status;
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .05,
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
            ),
          ),
          alignment: Alignment.center,
          child: Text(widget.index.toString()),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .25,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
            ),
          ),
          alignment: Alignment.centerLeft,
          child: Text(widget.model.name),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .3,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
            ),
          ),
          alignment: Alignment.centerLeft,
          child: Text(widget.model.email),
        ),
        Container(
            height: 50,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .6 * .15,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              ),
            ),
            alignment: Alignment.center,
            child: DropdownButton<String>(
              underline: SizedBox(),
              value: roleSelected,
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (String newValue) {
                widget.model.role = getRoleEnum(newValue);
                setState(() {
                  roleSelected = getRoleString(widget.model.role);
                });
              },
              items: listRole.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
        Container(
          height: 50,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .15,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
            ),
          ),
          alignment: Alignment.center,
          child: DropdownButton<String>(
            underline: SizedBox(),
            value: statusSelected,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (String newValue) {
              widget.model.status = newValue;
              setState(() {
                statusSelected = widget.model.status;
              });
            },
            items: listStatus.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .1 - 1,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
              bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
            ),
          ),
          alignment: Alignment.center,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await update(widget.model);
                await widget.function();
              },
              child: Center(
                child: Text(
                  "Cập nhật",
                  style: TextStyle(fontSize: 14, color: APP_PRIMARY_COLOR),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

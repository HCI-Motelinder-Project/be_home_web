import 'package:behome/constraint/color_constant.dart';
import 'package:flutter/material.dart';

class AccountManagement extends StatefulWidget {
  const AccountManagement({Key key}) : super(key: key);

  @override
  _AccountManagementState createState() => _AccountManagementState();
}

List<String> listRole = ["Admin","Renter","Owner"];

class _AccountManagementState extends State<AccountManagement> {
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
              children: [
                Text("Danh sách tài khoản", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .6 * .1,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("STT"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .6 * .4,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("Tên"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .6 * .3,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("Email"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .6 * .2 - 1,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("Vai trò"),
              )
            ],
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            color: Colors.white,
            height: 800,
            child: ListView(
              children: [
                AccountWidget(
                    1, "Lâm Hậu Huống", "huong@gmail.com", "Admin"),
                AccountWidget(
                    1, "Lâm Hậu Huống", "huong@gmail.com", "Admin"),
                AccountWidget(
                    1, "Lâm Hậu Huống", "huong@gmail.com", "Admin"),
                AccountWidget(
                    1, "Lâm Hậu Huống", "huong@gmail.com", "Admin"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget AccountWidget(int index, String name, String email, String role) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .1,
          color: Colors.white,
          alignment: Alignment.center,
          child: Text(index.toString()),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .4,
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: Text(name),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .3,
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: Text(email),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .6 * .2 - 1,
          color: Colors.white,
          alignment: Alignment.center,
          child: DropdownButton<String>(
            underline: SizedBox(),
            value: role,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (String newValue) {},
            items: listRole.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ResultView()));
                    },
                    child: Text(value),
                  ));
            }).toList(),
          )
        )
      ],
    );
  }
}

//@dart=2.9

import 'package:behome/constraint/color_constant.dart';
import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/presenters/rent_item_presenter.dart';
import 'package:behome/widgets/button/custom_button.dart';
import 'package:behome/widgets/detail/horizontal_detail_widget.dart';
import 'package:behome/widgets/nav_bar/nav_bar_widget.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _listRentWidget = [];

  @override
  void initState() {
    super.initState();
    getRentId();
  }

  void getRentId() {
    fetchRentItems().then((value) {
      List<Widget> listWidgets = value
          .map((item) =>
          DetailHorizontal(
            item)).toList();
      print(listWidgets);
      setState(() {
        _listRentWidget = listWidgets;
      });
    }).onError((error, stackTrace){
      print(stackTrace);
      print(error);
    });
  }


  Widget _buildCenterIndicator() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appMainColor.withOpacity(0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: .5, color: appMainColor),
                ),
              ),
              child: Center(
                child: TopNavBar(),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.75,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            child: ImageSlideshow(
                              width: double.infinity,
                              initialPage: 0,
                              indicatorColor: Colors.blue,
                              indicatorBackgroundColor: Colors.grey,
                              children: [
                                Image.asset(
                                  'images/slideshow1.png',
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'images/slideshow2.png',
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'images/slideshow3.png',
                                  fit: BoxFit.cover,
                                ),
                              ],
                              autoPlayInterval: 3000,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: new Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        height: 200.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        padding: new EdgeInsets.all(20),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            CustomIconButton("Quận 1", Icons.house,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton("Quận 2", Icons.apartment,
                                "images/district/district2.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton("Quận 3", Icons.bed,
                                "images/district/district3.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 4",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 5",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 6",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 7",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 8",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 9",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButton(
                                "Quận 10",
                                Icons.indeterminate_check_box,
                                "images/district/district1.jpg"),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxHeight: double
                              .infinity),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Phòng trọ mới nhất",
                                      style: titleStyle,
                                    ),
                                    Text("Xem thêm →", style: viewMoreStyle),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 200.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: _listRentWidget,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

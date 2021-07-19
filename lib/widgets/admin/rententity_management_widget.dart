import 'package:behome/constraint/color_constant.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:behome/presenters/rent_item_presenter.dart';
import 'package:behome/widgets/admin/approved_post_widget.dart';
import 'package:behome/widgets/admin/canceled_post_widget.dart';
import 'package:behome/widgets/admin/pending_post_widget.dart';
import 'package:behome/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import "package:charcode/charcode.dart";

class RentEntityManagementView extends StatefulWidget {
  final int index;

  const RentEntityManagementView({Key key, this.index}) : super(key: key);

  @override
  _RentEntityManagementViewState createState() =>
      _RentEntityManagementViewState();
}

class _RentEntityManagementViewState extends State<RentEntityManagementView> {
  double width;
  double height;
  double contentWidth;
  double contentHeight;

  bool _isPendingLoaded;
  List<Widget> _listPendingWidget = [];

  bool _isApprovedLoaded;
  List<Widget> _listApprovedWidget = [];

  bool _isCanceledLoaded;
  List<Widget> _listCanceledWidget = [];

  int lastIndex;
  PageController _pageController = PageController();
  List<String> title = [
    "Đang chờ xác thực",
    "Đã xác thực",
    "Đã xóa / Đã từ chối"
  ];

  Future<void> loadAllApprovedRentEntities() async {
    setState(() {
      _isApprovedLoaded = false;
    });
    loadAllRentEntities().then((value) {
      List<Widget> listApproved = value
          .map((item) => ApprovedPostWidget(
                function: loadAll,
                model: item,
              ))
          .toList();
      setState(() {
        _listApprovedWidget = listApproved;
        _isApprovedLoaded = true;
      });
    });
  }

  Future<void> loadAllPendingRentEntities() async {
    setState(() {
      _isPendingLoaded = false;
    });
    loadPendingRentEntities().then((value) {
      List<Widget> listPending = value
          .map((item) => PendingPostWidget(
                model: item,
                function: loadAll,
              ))
          .toList();
      setState(() {
        _listPendingWidget = listPending;
        _isPendingLoaded = true;
      });
    });
  }

  Future<void> loadAllCanceledRentEntities() async {
    setState(() {
      _isCanceledLoaded = false;
    });
    loadRejectedRentEntities().then((value) {
      List<Widget> listCanceled = value
          .map((item) => CanceledPostWidget(model: item, function: loadAll))
          .toList();
      setState(() {
        _listCanceledWidget = listCanceled;
        _isCanceledLoaded = true;
      });
    });
    loadUnavailableRentEntities().then((value) {
      List<Widget> listCanceled = value
          .map((item) => CanceledPostWidget(model: item, function: loadAll))
          .toList();
      setState(() {
        _listCanceledWidget += listCanceled;
        _isCanceledLoaded = true;
      });
    });
  }

  void loadAll() {
    loadAllApprovedRentEntities();
    loadAllPendingRentEntities();
    loadAllCanceledRentEntities();
  }

  @override
  void initState() {
    super.initState();
    loadAll();
    widget.index != 0 ? lastIndex = widget.index : lastIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      width = MediaQuery.of(context).size.width * .9;
      height = MediaQuery.of(context).size.height;
      contentWidth = width - 20;
      contentHeight = height - 80;
    });

    return _isPendingLoaded && _isApprovedLoaded && _isCanceledLoaded
        ? Container(
            width: width * .9,
            height: height,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Container(
              width: contentWidth,
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      width: contentWidth,
                      height: height * .05,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox();
                        },
                        itemCount: 3,
                        itemBuilder: (BuildContext, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                lastIndex = index;
                                _pageController.animateToPage(index,
                                    duration: Duration(microseconds: 50),
                                    curve: Curves.ease);
                              });
                            },
                            child: AnimatedContainer(
                              height: 80,
                              decoration: BoxDecoration(
                                color: lastIndex == index
                                    ? APP_PRIMARY_COLOR
                                    : Colors.white,
                                border: Border.all(color: APP_PRIMARY_COLOR),
                                borderRadius: index == 0
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(15))
                                    : index == 2
                                        ? BorderRadius.only(
                                            topRight: Radius.circular(15))
                                        : null,
                              ),
                              duration: Duration(microseconds: 500),
                              child: Container(
                                width: contentWidth * 0.33,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Tab(
                                    child: Text(
                                      title[index],
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: lastIndex == index
                                            ? Colors.white
                                            : APP_PRIMARY_COLOR,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: contentHeight - 10,
                    width: contentWidth,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: APP_PRIMARY_COLOR),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15)),
                    ),
                    child: PageView(
                      controller: _pageController,
                      children: [
                        if (lastIndex == 0) ListPendingWidget(),
                        if (lastIndex == 1) ListApprovedWidget(),
                        if (lastIndex == 2) ListCanceledWidget()
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : LoadingAnimationScreen();
  }

  Widget ListPendingWidget() {
    ScrollController _controller = ScrollController();
    return ListView(
      controller: _controller,
      children: _listPendingWidget,
    );
  }

  Widget ListApprovedWidget() {
    ScrollController _controller = ScrollController();
    return ListView(
      controller: _controller,
      children: _listApprovedWidget,
    );
  }

  Widget ListCanceledWidget() {
    ScrollController _controller = ScrollController();
    return ListView(
      controller: _controller,
      children: _listCanceledWidget,
    );
  }
}

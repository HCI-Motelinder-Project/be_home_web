import 'package:behome/views/content/content_view.dart';
import 'package:behome/widgets/nav_bar/custom_tab_bar.dart';
import 'package:behome/widgets/nav_bar/nav_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<ContentView> contentView = [
    ContentView(
      tab: TitleNavbar(
        title: 'Home',
      ),
      content: Center(
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
      ),
    ),
    ContentView(
      tab: TitleNavbar(
        title: 'About',
      ),
      content: Center(
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentView.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 75,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                Row(
                  children: [
                    CustomTabBar(
                      controller: tabController,
                      tabs: contentView.map((e) => e.tab).toList(),
                    ),
                    AnimatedButtonNavbar(title: 'Booking Now'),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 400,
              child: TabBarView(
                controller: tabController,
                children: contentView.map((e) => e.content).toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/views/home/rent_entity_detail_view.dart';
import 'package:flutter/material.dart';

class DetailHorizontal extends StatefulWidget {
  const DetailHorizontal({Key? key}) : super(key: key);

  @override
  _DetailHorizontalState createState() => _DetailHorizontalState();
}

class _DetailHorizontalState extends State<DetailHorizontal> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RentEntityDetail()));
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: Image.asset(
                        "images/background.jpg",
                        width: 200,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Phòng trọ Minh Long",
                          style: horizontalTitleStyle,
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.house_outlined),
                            SizedBox(width: 5),
                            Text(
                              'Phòng cho thuê',
                              style: horizontalDetailStyle,
                            ),
                          ],
                        ),SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.run_circle_outlined),
                            SizedBox(width: 5),
                            Text(
                              '4.5km',
                              style: horizontalDetailStyle,
                            ),
                          ],
                        ),SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 5),
                            Text(
                              '1 Nguyễn Du, Phường 5, Quận 1',
                              style: horizontalDetailStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "3.5",
                    style: horizontalPriceStyle,
                  ),
                  Text(
                    "tr/phòng",
                    style: horizontalPriceUnitStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

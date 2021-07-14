import 'package:behome/constraint/text_style_constant.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:behome/views/home/rent_entity_detail_view.dart';
import 'package:flutter/material.dart';

class DetailHorizontal extends StatefulWidget {
   RentItemModel rentItemModel;
   DetailHorizontal( this.rentItemModel);

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
                        widget.rentItemModel.imageCover,
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
                          widget.rentItemModel.name,
                          style: horizontalTitleStyle,
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.house_outlined),
                            SizedBox(width: 5),
                            Text(
                              widget.rentItemModel.type,
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
                              widget.rentItemModel.address + " " + widget.rentItemModel.district,
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
                    widget.rentItemModel.price.toString(),
                    style: horizontalPriceStyle,
                  ),
                  Text(
                    "VND/phòng",
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

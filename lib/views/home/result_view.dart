import 'package:behome/constraint/color_constant.dart';
import 'package:behome/widgets/button/custom_radio_button.dart';
import 'package:behome/widgets/nav_bar/top_nav_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key key}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

enum RentType { PHONGTRO, NHANGUYENCAN, SLEEPBOX, PHONGOGHEP }
enum Price { NOTHING, LOWEST_HIGHEST, HIGHEST_LOWEST }
enum Gender { NOTHING, MALE, FEMALE }

class _ResultViewState extends State<ResultView> {
  RentType _rentTypeSelected = RentType.PHONGTRO;
  Price _priceSelected = Price.NOTHING;
  Gender _genderSelected = Gender.NOTHING;
  RangeValues _rangeSliderDiscreteValues = const RangeValues(500000, 10000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: APP_PRIMARY_COLOR.withOpacity(0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: .5, color: APP_PRIMARY_COLOR),
                ),
              ),
              child: Center(
                child: TopNavBar(),
              ),
            ),
            Center(
              child: Container(
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width * .75,
                  child: Wrap(
                    children: [
                      Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width * .15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Filter"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Loại phòng"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <RentTypeRadioButton>[
                                RentTypeRadioButton(
                                  label: 'Phòng trọ',
                                  padding: const EdgeInsets.all(10.0),
                                  value: RentType.PHONGTRO,
                                  groupValue: _rentTypeSelected,
                                  onChanged: (RentType newValue) {
                                    setState(() {
                                      _rentTypeSelected = newValue;
                                    });
                                  },
                                ),
                                RentTypeRadioButton(
                                  label: 'Nhà nguyên căn',
                                  padding: const EdgeInsets.all(10.0),
                                  value: RentType.NHANGUYENCAN,
                                  groupValue: _rentTypeSelected,
                                  onChanged: (RentType newValue) {
                                    setState(() {
                                      _rentTypeSelected = newValue;
                                    });
                                  },
                                ),
                                RentTypeRadioButton(
                                  label: 'Sleepbox',
                                  padding: const EdgeInsets.all(10.0),
                                  value: RentType.SLEEPBOX,
                                  groupValue: _rentTypeSelected,
                                  onChanged: (RentType newValue) {
                                    setState(() {
                                      _rentTypeSelected = newValue;
                                    });
                                  },
                                ),
                                RentTypeRadioButton(
                                  label: 'Phòng ở ghép',
                                  padding: const EdgeInsets.all(10.0),
                                  value: RentType.PHONGOGHEP,
                                  groupValue: _rentTypeSelected,
                                  onChanged: (RentType newValue) {
                                    setState(() {
                                      _rentTypeSelected = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Sắp xếp theo giá"),
                            ),
                            Column(
                              children: [
                                PriceSortingRadioButton(
                                  label: 'Giá tăng dần',
                                  padding: const EdgeInsets.all(10.0),
                                  value: Price.LOWEST_HIGHEST,
                                  groupValue: _priceSelected,
                                  onChanged: (Price newValue) {
                                    setState(() {
                                      _priceSelected = newValue;
                                    });
                                  },
                                ),
                                PriceSortingRadioButton(
                                  label: 'Giá giảm dần',
                                  padding: const EdgeInsets.all(10.0),
                                  value: Price.HIGHEST_LOWEST,
                                  groupValue: _priceSelected,
                                  onChanged: (Price newValue) {
                                    setState(() {
                                      _priceSelected = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Khoảng giá từ"),
                                      Text(_rangeSliderDiscreteValues.start.round().toString()),
                                      Text("-"),
                                      Text(_rangeSliderDiscreteValues.end.round().toString()),
                                    ],
                                  ),
                                ),
                                RangeSlider(
                                  values: _rangeSliderDiscreteValues,
                                  activeColor: APP_PRIMARY_COLOR,
                                  min: 500000,
                                  max: 10000000,
                                  labels: RangeLabels(
                                    _rangeSliderDiscreteValues.start.round().toString(),
                                    _rangeSliderDiscreteValues.end.round().toString(),
                                  ),
                                  onChanged: (values) {
                                    setState(() {
                                      _rangeSliderDiscreteValues = values;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Giới tính"),
                            ),
                            Column(
                              children: [
                                GenderRadioButton(
                                  label: 'Nam',
                                  padding: const EdgeInsets.all(10.0),
                                  value: Gender.MALE,
                                  groupValue: _genderSelected,
                                  onChanged: (Gender newValue) {
                                    setState(() {
                                      _genderSelected = newValue;
                                    });
                                  },
                                ),
                                GenderRadioButton(
                                  label: 'Nữ',
                                  padding: const EdgeInsets.all(10.0),
                                  value: Gender.FEMALE,
                                  groupValue: _genderSelected,
                                  onChanged: (Gender newValue) {
                                    setState(() {
                                      _genderSelected = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Filter"),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

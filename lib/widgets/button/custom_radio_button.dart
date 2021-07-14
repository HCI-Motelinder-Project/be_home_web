import 'package:behome/views/home/result_view.dart';
import 'package:flutter/material.dart';

class RentTypeRadioButton extends StatelessWidget {
  const RentTypeRadioButton({
    Key key,
     this.label,
     this.padding,
     this.groupValue,
     this.value,
     this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final RentType groupValue;
  final RentType value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<RentType>(
              groupValue: groupValue,
              value: value,
              onChanged: (RentType newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class PriceSortingRadioButton extends StatelessWidget {
  const PriceSortingRadioButton({
    Key key,
     this.label,
     this.padding,
     this.groupValue,
     this.value,
     this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final Price groupValue;
  final Price value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<Price>(
              groupValue: groupValue,
              value: value,
              onChanged: (Price newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class GenderRadioButton extends StatelessWidget {
  const GenderRadioButton({
    Key key,
     this.label,
     this.padding,
     this.groupValue,
     this.value,
     this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final Gender groupValue;
  final Gender value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<Gender>(
              groupValue: groupValue,
              value: value,
              onChanged: (Gender newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

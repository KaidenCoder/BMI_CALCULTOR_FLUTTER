import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class IconContent extends StatelessWidget {
//  const IconContent({Key key,}) : super(key: key);

  IconContent({this.fontIcon, this.label});

  final IconData fontIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: kLabelTextStyle,
//        TextStyle(
//            fontSize: 18.0, color: Color(0xFF8D8E98)
//        ),
          ),
      ],
    );
  }
}
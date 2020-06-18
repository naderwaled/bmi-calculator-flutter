import 'package:flutter/material.dart';
import 'constant.dart';

class IconContent extends StatelessWidget {
  final IconData iconA;
  final String text;
  IconContent({this.iconA, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconA,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelstyle,
        )
      ],
    );
  }
}

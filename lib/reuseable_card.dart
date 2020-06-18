import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  Reuseablecard({this.colour, this.childC, this.onPress});
  final Color colour;
  final Widget childC;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childC,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

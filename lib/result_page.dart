import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'reuseable_card.dart';
import 'constant.dart';

class Results extends StatelessWidget {
  final String bmiresult;
  final String bmireulttext;
  final String bmiinterpretation;
  Results({this.bmiresult, this.bmireulttext, this.bmiinterpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitlestyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              onPress: null,
              colour: kActiveCardColour,
              childC: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmireulttext,
                    style: kResuttextsytle,
                  ),
                  Text(
                    bmiresult,
                    style: kBMItextstyle,
                  ),
                  Text(
                    bmiinterpretation,
                    textAlign: TextAlign.center,
                    style: kBodytextstyle,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kButtomContainerColour,
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                  child: Text(
                "RE-CALCULATE",
                style: kLagrelabelstyle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

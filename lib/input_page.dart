import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'result_page.dart';
import 'constant.dart';
import 'calculations.dart';

enum GenderType {
  male,
  female,
}
int heightvalue = 150;
int wieghtvalue = 50;
int agevalue = 25;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(
                    onPress: () {
                      setState(() {
                        selectedgender = GenderType.male;
                      });
                    },
                    colour: selectedgender == GenderType.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childC: IconContent(
                      iconA: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    onPress: () {
                      setState(() {
                        selectedgender = GenderType.female;
                      });
                    },
                    colour: selectedgender == GenderType.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childC: IconContent(
                      iconA: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseablecard(
              colour: kActiveCardColour,
              childC: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heightvalue.toString(),
                        style: kNumberstyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: heightvalue.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightvalue = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(
                    colour: kActiveCardColour,
                    childC: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelstyle,
                        ),
                        Text(
                          wieghtvalue.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onpressed: () {
                                setState(() {
                                  wieghtvalue--;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onpressed: () {
                                setState(() {
                                  wieghtvalue++;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    colour: kActiveCardColour,
                    childC: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Age",
                          style: kLabelstyle,
                        ),
                        Text(
                          agevalue.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onpressed: () {
                                setState(() {
                                  agevalue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onpressed: () {
                                setState(() {
                                  agevalue++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculations bmi =
                  Calculations(height: heightvalue, weight: wieghtvalue);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            bmiresult: bmi.calculate(),
                            bmireulttext: bmi.getResult(),
                            bmiinterpretation: bmi.getInterpretation(),
                          )));
            },
            child: Container(
              color: kButtomContainerColour,
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                  child: Text(
                "CALCULATE YOUR BMI",
                style: kLagrelabelstyle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final Function onpressed;
  RoundIconButton({this.icon, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      child: this.icon,
    );
  }
}

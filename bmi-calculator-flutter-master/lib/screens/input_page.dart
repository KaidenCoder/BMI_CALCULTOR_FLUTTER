import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

//  void updateColor(Gender selectedGender) {
//    if (selectedGender == Gender.male) {
//      if (maleCardColor == inactiveCardColor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      } else {
//        maleCardColor = inactiveCardColor;
//      }
//    }
//
//    if (selectedGender == Gender.female) {
//      if (femaleCardColor == inactiveCardColor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      } else {
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }

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
                child: Row(
                  children: <Widget>[
                    Expanded(
//                  child: GestureDetector(
//                onTap: (){
//                  setState(() {
////                    updateColor(Gender.male);
//                  selectedGender = Gender.male;
//                  });
//                },
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
//                    colour: maleCardColor,
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                            fontIcon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                      // )
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        //colour: femaleCardColor,
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                            fontIcon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFE81555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                                //print(newValue);
                              });
                            }),
                      )
                    ],
                  ),
                )),
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
//                          FloatingActionButton(
//                            backgroundColor: Color(0xFF4C4F5E),
//                            child: Icon(
//                              Icons.add,
//                              color: Colors.white,
//                            ),
//                          ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
//                          FloatingActionButton(
//                            backgroundColor: Color(0xFF4C4F5E),
//                            child: Icon(
//                              Icons.subscriptions,
//                              color: Colors.white,
//                            ),
//                          ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
//                          FloatingActionButton(
//                            backgroundColor: Color(0xFF4C4F5E),
//                            child: Icon(
//                              Icons.add,
//                              color: Colors.white,
//                            ),
//                          ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
//                          FloatingActionButton(
//                            backgroundColor: Color(0xFF4C4F5E),
//                            child: Icon(
//                              Icons.subscriptions,
//                              color: Colors.white,
//                            ),
//                          ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                )),
            BottomButton(buttonTitle: 'CALCULATE',
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);


              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  )));
            },)
          ],
        ));
  }
}




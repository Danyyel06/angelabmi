import 'package:angelabmi/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'card_items.dart';
import 'constants.dart';
import 'results_page.dart';
import 'buttom_button.dart';
import 'round_icon_button.dart';

enum gender { male, female }

int height = 180;
int weight = 60;
int age = 12;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: myReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                      colour:
                          selectedGender == gender.male
                              ? activeCardColour
                              : inActiveCardColour,
                      cardChild: cardDetails(
                        myIcon: Icons.male,
                        gender: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: myReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.female;
                        });
                      },
                      colour:
                          selectedGender == gender.female
                              ? activeCardColour
                              : inActiveCardColour,
                      cardChild: cardDetails(
                        myIcon: Icons.female,
                        gender: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: myReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT", style: genderTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: bigTextStyle),
                        SizedBox(width: 10.0),
                        Text("cm"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 300.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: myReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT", style: genderTextStyle),
                          Text(weight.toString(), style: bigTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),

                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: myReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: genderTextStyle),
                          Text(age.toString(), style: bigTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),

                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom_button(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.resultInterpretation(),
                      );
                    },
                  ),
                );
              },
              buttomText: "CALCULATE",
            ),
          ],
        ),
      ),
    );
  }
}

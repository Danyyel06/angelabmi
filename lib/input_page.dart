import 'package:flutter/material.dart';
import 'card_items.dart';
import 'constants.dart';

enum gender { male, female }

int height = 180;

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
                  Expanded(child: myReusableCard(colour: activeCardColour)),
                  Expanded(child: myReusableCard(colour: activeCardColour)),
                ],
              ),
            ),
            Container(
              color: bottomButtonColor,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: bottomButtonHeight,
            ),
          ],
        ),
      ),
    );
  }
}

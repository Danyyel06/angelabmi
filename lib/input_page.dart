import 'package:flutter/material.dart';
import 'card_items.dart';

const bottomButtonHeight = 80.0;
const cardColors = Color(0xFF1D1E33);
const bottomButtonColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: myReusableCard(
                    colour: cardColors,
                    cardChild: cardDetails(myIcon: Icons.male, gender: "MALE"),
                  ),
                ),
                Expanded(
                  child: myReusableCard(
                    colour: cardColors,
                    cardChild: cardDetails(
                      myIcon: Icons.female,
                      gender: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: myReusableCard(colour: cardColors)),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: myReusableCard(colour: cardColors)),
                Expanded(child: myReusableCard(colour: cardColors)),
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
    );
  }
}

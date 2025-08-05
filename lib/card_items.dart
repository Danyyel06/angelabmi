import 'package:flutter/material.dart';

const genderTextStyle = TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0);

class cardDetails extends StatelessWidget {
  cardDetails({@required this.gender, required this.myIcon});
  final String? gender;
  final IconData? myIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(myIcon, size: 80.0),
        SizedBox(height: 15.0),
        Text(gender ?? '', style: genderTextStyle),
      ],
    );
  }
}

class myReusableCard extends StatelessWidget {
  myReusableCard({required this.colour, this.cardChild});
  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

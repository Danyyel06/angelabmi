import 'package:flutter/material.dart';
import 'constants.dart';

class bottom_button extends StatelessWidget {
  bottom_button({required this.buttomText, required this.onTap});
  final String? buttomText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: bottomButtonHeight,
        padding: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: bottomButtonColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text(buttomText!, style: bigButtomTextStyle)),
      ),
    );
  }
}

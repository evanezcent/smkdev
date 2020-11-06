import 'package:flutter/material.dart';
import 'package:smkdev/src/constants/constant.dart';
import 'package:smkdev/src/ui/components/buttons/button_primary.dart';

class BottomNavBooking extends StatelessWidget {
  const BottomNavBooking({
    Key key,
    @required this.size,
    this.buttonClick,
    this.buttonText,
    this.colorButton,
    this.textColor,
  }) : super(key: key);

  final Size size;
  final Function buttonClick;
  final String buttonText;
  final Color colorButton, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(boxShadow: darkShadow, color: Colors.white),
      child: ButtonPrimary(
        buttonText: buttonText,
        color: colorPrimary,
        textColor: textColor,
        onClicked: buttonClick,
      ),
    );
  }
}

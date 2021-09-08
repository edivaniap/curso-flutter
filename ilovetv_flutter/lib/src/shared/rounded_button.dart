import 'package:flutter/material.dart';
import 'package:ilovetv_flutter/src/shared/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = COLOR_PRIMARY,
    this.textColor = COLOR_TEXT_LIGTH
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      child: ClipRRect(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))
          ),
          onPressed: press(),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16.0),)),
      ),
    );
  }
}
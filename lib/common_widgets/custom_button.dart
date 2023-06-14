import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.label,
      required this.color,
      required this.onTap,
      required this.textColor})
      : super(key: key);
  final String label;
  final Color color;
  final Color textColor;

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              backgroundColor: color, minimumSize: const Size.fromHeight(50)),
          child: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 13),
          )),
    );
  }
}



import 'package:allpartner/appTheme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool canPress, haveIcon;
  final double? fontSize, height;
  final Color? color;
  final bool borderOnly;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.canPress = true,
    this.fontSize,
    this.haveIcon = false,
    this.height,
    this.color,
    this.borderOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          canPress ? color ?? Colors.blue : Colors.lightBlue,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: canPress ? BorderSide(color: Color.fromARGB(255, 105, 150, 240)) : BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      onPressed: canPress ? onPressed : null,
      child: SizedBox(
        width: size.width,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: canPress
                ? borderOnly
                    ? Colors.blue
                    : Colors.white
                : Colors.blue,
            fontSize: AppFontSize.of(context)?.body2,
          ),
        ),
      ),
    );
  }
}
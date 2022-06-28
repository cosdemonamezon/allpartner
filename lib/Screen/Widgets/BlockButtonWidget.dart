import 'package:flutter/material.dart';

class BlockButtonWidget extends StatelessWidget {
  BlockButtonWidget(
      {Key? key,
      required this.color,
      required this.text,
      this.onPressed})
      : super(key: key);

  final Color color;
  final Widget text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: this.color.withOpacity(0.3),
              blurRadius: 40,
              offset: Offset(0, 15)),
          BoxShadow(
              color: this.color.withOpacity(0.2),
              blurRadius: 13,
              offset: Offset(0, 3))
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        color: color,
        disabledElevation: 0,
        disabledColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: text,
      ),
    );
  }
}

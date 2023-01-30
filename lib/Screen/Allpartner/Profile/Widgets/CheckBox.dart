import 'dart:ffi';

import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({super.key, required this.cheack, required this.onTap, required this.title});
  final bool cheack;
  final void Function(bool?) onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return SizedBox(
      child: Column(
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: cheack,
            onChanged: onTap,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }
}

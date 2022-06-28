
import 'package:allpartner/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final FormFieldSetter? onChanged;

  const SearchTextField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    return CupertinoSearchTextField(
      backgroundColor: Colors.grey[300],
      padding: EdgeInsets.all(10),
      style: TextStyle(fontSize: appFontSize?.body2,),
      onChanged: onChanged,
    );
  }
}

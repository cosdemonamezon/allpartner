import 'package:flutter/material.dart';

class TextFieldRegisterWidget extends StatelessWidget {
  TextFieldRegisterWidget({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.autofocus,
    this.readOnly,
    this.style,
    this.textAlign,
    this.suffix,
    this.maxLength,
    this.controller,
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final bool? autofocus;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? maxLength;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 14, left: 16, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.zero,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.05))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? "",
            style: TextStyle(),
            textAlign: textAlign ?? TextAlign.start,
          ),
          TextFormField(
            controller: controller,
            maxLines: keyboardType == TextInputType.multiline ? null : 1,
            maxLength: maxLength,
            key: key,
            autofocus: autofocus ?? false,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType ?? TextInputType.text,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            // initialValue: initialValue ?? '',
            style: style ?? TextStyle(),
            obscureText: obscureText ?? false,
            textAlign: textAlign ?? TextAlign.start,
            decoration: InputDecoration(
              hintText: hintText ?? '',
              // iconData: iconData,
              suffixIcon: suffixIcon,
              suffix: suffix,
              errorText: errorText,
            ),
          ),
        ],
      ),
    );
  }
}

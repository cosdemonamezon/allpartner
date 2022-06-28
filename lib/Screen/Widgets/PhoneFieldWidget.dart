import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget(
      {Key? key,
      //this.onSaved,
      //this.onChanged,
      this.initialValue,
      this.hintText,
      this.errorText,
      this.labelText,
      this.obscureText,
      this.suffixIcon,
      this.isFirst,
      this.isLast,
      this.style,
      this.textAlign,
      this.suffix,
      this.initialCountryCode,
      this.countries})
      : super(key: key);

  //final FormFieldSetter<PhoneNumber> onSaved;
  //final ValueChanged<PhoneNumber> onChanged;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final bool? obscureText;
  final String? initialCountryCode;
  final List<String>? countries;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.zero,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5)),
          ],
          border: Border.all(color: Colors.black.withOpacity(0.05))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText ?? "",
            style: TextStyle(),
            textAlign: textAlign ?? TextAlign.start,
          ),
          IntlPhoneField(
            key: key,
            //onSaved: onSaved,
            //onChanged: onChanged,
            initialValue: initialValue ?? '',
            initialCountryCode: initialCountryCode ?? '66',
            showDropdownIcon: false,
            pickerDialogStyle: PickerDialogStyle(countryNameStyle: TextStyle()),
            style: style ?? TextStyle(),
            textAlign: textAlign ?? TextAlign.start,
            disableLengthCheck: true,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              hintText: hintText ?? '',
              hintStyle: TextStyle(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
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

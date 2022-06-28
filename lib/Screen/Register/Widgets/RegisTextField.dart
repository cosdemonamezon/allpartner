
import 'package:allpartner/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisTextField extends StatefulWidget {
  RegisTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.onChanged,
    this.errorText,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.isHideCounter = false,
    this.inputFormatters,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final bool isPassword;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isHideCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  State<RegisTextField> createState() => _RegisTextFieldState();
}

class _RegisTextFieldState extends State<RegisTextField> {
  bool isObscureText = false;
  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    return TextFormField(
      controller: widget.controller,
      // validator: widget.validator,
      // autovalidateMode: widget.validator != null ? AutovalidateMode.onUserInteraction : null,
      onChanged: widget.onChanged,
      style: TextStyle(fontSize: appFontSize?.body2),
      obscureText: widget.isPassword && !isObscureText,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        counterText: widget.isHideCounter ? '' : null,
        errorText: widget.errorText,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        contentPadding: EdgeInsets.all(10),
        fillColor: Color.fromARGB(255, 219, 228, 235),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: appFontSize?.body2,
          color: Color.fromARGB(255, 71, 70, 70),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() => isObscureText = !isObscureText);
                },
                child: Icon(!isObscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              )
            : null,
      ),
    );
  }
}

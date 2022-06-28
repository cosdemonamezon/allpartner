import 'package:flutter/material.dart';

class AppTextForm extends StatefulWidget {
  AppTextForm({
    Key? key,
    this.controller,
    this.hintText,
    this.isPassword = false,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  late bool _show = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _show : false,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        fillColor: Color(0xFFF3F6FA),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _show = !_show;
                  });
                },
                child: _show
                    ? Image.asset('assets/icons/eye.png')
                    : Image.asset('assets/icons/eye-slash.png'),
              )
            : null,
      ),
    );
  }
}

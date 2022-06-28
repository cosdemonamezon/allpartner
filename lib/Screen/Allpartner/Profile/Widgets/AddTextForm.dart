import 'package:flutter/material.dart';

class AddTextForm extends StatefulWidget {
  AddTextForm({
    Key? key,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.maxLines = 1,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final int maxLines;

  @override
  State<AddTextForm> createState() => _AddTextFormState();
}

class _AddTextFormState extends State<AddTextForm> {
  late bool _show = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _show : false,
      controller: widget.controller,
      maxLines: widget.maxLines,
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

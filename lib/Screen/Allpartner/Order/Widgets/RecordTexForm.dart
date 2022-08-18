import 'package:flutter/material.dart';

class RecordTextForm extends StatefulWidget {
  RecordTextForm({Key? key, this.controller, this.hintText, this.maxLine}) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  int? maxLine;

  @override
  State<RecordTextForm> createState() => _RecordTextFormState();
}

class _RecordTextFormState extends State<RecordTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLine,
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
      ),
    );
  }
}
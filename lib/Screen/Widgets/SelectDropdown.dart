import 'package:flutter/material.dart';

class SelectDropdown extends StatefulWidget {
  SelectDropdown({Key? key, required this.dropdownData, required this.dropdownValue}) : super(key: key);

  final String dropdownValue;
  final List<String> dropdownData;

  @override
  State<SelectDropdown> createState() => _SelectDropdownState();
}

class _SelectDropdownState extends State<SelectDropdown> {
  String? dropdown;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdown = newValue;
        });
      },
      items: widget.dropdownData.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
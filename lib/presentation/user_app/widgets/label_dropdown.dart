// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/textstyles.dart';

class LabelDropdown extends StatefulWidget {
  const LabelDropdown({super.key});

  @override
  State<LabelDropdown> createState() => _LabelDropdownState();
}

class _LabelDropdownState extends State<LabelDropdown> {
  final _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.5,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 9),
                labelText: 'Floor',
                labelStyle: labelTextInputTextStyle,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(color: labelTextFieldBorderColor)),
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(color: labelTextFieldBorderColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(color: labelTextFieldBorderColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(color: labelTextFieldBorderColor)),),
            isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(13),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: confirmColor,
                ),
                value: _currentSelectedValue,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _currentSelectedValue = newValue;
                    state.didChange(newValue);
                  });
                },
                items: _currencies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: labelTextInputTextStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

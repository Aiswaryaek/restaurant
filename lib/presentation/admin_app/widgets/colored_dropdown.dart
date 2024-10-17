// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ColoredDropDown extends StatefulWidget {
  final List<String> dropDownItems;
  final String title;
  final String? value;
  final double width;
  final bool isTitleBold;
  final bool? isVisible;
  final Function(String?)? onChanged;
  final double textFieldHeight;

  const ColoredDropDown(
      {super.key,
      required this.dropDownItems,
      this.isTitleBold = false,
      required this.title,
      this.width = double.infinity,
      required this.value,
      this.isVisible,
      required this.onChanged,
      this.textFieldHeight = 41});

  @override
  State<ColoredDropDown> createState() => _ColoredDropDownState();
}

class _ColoredDropDownState extends State<ColoredDropDown> {
  String? _selectedItem;
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isVisible == true
            ? Text(
                widget.title,
                style: (widget.isTitleBold == false)
                    ? bookedTextStyle
                    : rolesAndPermissionModuleAccessTabLabelStyle,
              )
            : SizedBox(),
        widget.isVisible == true
            ? SizedBox(
                height: AppScreenUtil().screenHeight(8),
              )
            : SizedBox(),
        Container(
          height: widget.textFieldHeight,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: textFieldColor),
          child: DropdownButton<String>(
            style: searchInputTextStyle,
            padding: const EdgeInsets.only(left: 10, right: 10),
            value: widget.value,
            items: widget.dropDownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: subTitleTextStyle,
                ),
              );
            }).toList(),
            onChanged: widget.onChanged,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: blackColor,
            ),
            iconSize: 20,
            isExpanded: true,
            underline: const SizedBox(), // Removes the default underline
          ),
        )
      ],
    );
  }
}

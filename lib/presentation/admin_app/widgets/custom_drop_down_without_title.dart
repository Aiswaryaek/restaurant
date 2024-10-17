import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomDropDownWithoutTitle extends StatefulWidget {
  final List<String> dropDownItems;
  final String title;
  final String? value;
  final Function(String?)? onChanged;
  const CustomDropDownWithoutTitle(
      {super.key,
      required this.dropDownItems,
      required this.onChanged,
      required this.value,
      required this.title});

  @override
  State<CustomDropDownWithoutTitle> createState() =>
      _CustomDropDownWithoutTitleState();
}

class _CustomDropDownWithoutTitleState
    extends State<CustomDropDownWithoutTitle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppScreenUtil().screenWidth(160),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: whiteColor,
            boxShadow: const [
              BoxShadow(
                color: searchTextColor,
                offset: Offset(0, 0),
                blurRadius: 1,
              ),
            ]),
        child: SizedBox(
          height: 38,
          child: DropdownButton<String>(
            hint: Text(
              widget.title,
              style: subTitleTextStyle,
            ),
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
              Icons.keyboard_arrow_down,
              color: blackColor,
            ),
            iconSize: 20,
            isExpanded: true,
            underline: const SizedBox(), // Removes the default underline
          ),
        ),
      ),
    );
  }
}

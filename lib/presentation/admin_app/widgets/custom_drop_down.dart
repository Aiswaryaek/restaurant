import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/constants/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import 'package:restaurant/styles/colors.dart';

class CustomDropDownButton extends StatefulWidget {
  final String title;
  final Widget? hint;

  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;

  const CustomDropDownButton({
    required this.title,
    this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: bookedTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Container(
                width: double.infinity,
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      iconStyleData: IconStyleData(
                          icon: Padding(
                        padding: EdgeInsets.only(
                            right: AppScreenUtil().screenWidth(10)),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: blackColor,
                          size: 20.0,
                        ),
                      )),
                      //To avoid long text overflowing.
                      isExpanded: true,
                      hint: widget.hint,
                      value: widget.value,
                      items: widget.dropdownItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Container(
                                  color: Colors.transparent,
                                  alignment: widget.valueAlignment,
                                  child: Text(item,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: subTitleTextStyle),
                                ),
                              ))
                          .toList(),
                      onChanged: widget.onChanged,
                      selectedItemBuilder: widget.selectedItemBuilder,
                    ),
                  ),
                ),
              )
            ]));
  }
}

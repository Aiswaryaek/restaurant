import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class CommonDropDownWithTitleAndAlert extends StatefulWidget {
  final List<String> dropDownItems;
  final String title;
  final String? value;
  final double width;
  final dynamic iconOnTap;
  final Function(String?)? onChanged;
  const CommonDropDownWithTitleAndAlert(
      {super.key,
      required this.dropDownItems,
      this.iconOnTap,
      required this.title,
      this.width = double.infinity,
      required this.value,
      required this.onChanged});

  @override
  State<CommonDropDownWithTitleAndAlert> createState() =>
      _CommonDropDownWithTitleAndAlertState();
}

class _CommonDropDownWithTitleAndAlertState
    extends State<CommonDropDownWithTitleAndAlert> {
  String? _selectedItem;
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: bookedTextStyle,
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(8),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.width,
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

            ///Icon
            Positioned(
              left: AppScreenUtil().screenWidth(100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: widget.iconOnTap,
                    // child: SvgPicture.asset(ImageCons.imgAddAlertIcon,height: 30,)
                    child: Container(
                      height: AppScreenUtil().screenHeight(15),
                      width: AppScreenUtil().screenWidth(18),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: alertDialogueIconDropShadowColor,
                              offset: Offset(0, 0),
                              blurRadius: 6)
                        ],
                        color: redColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 13,
                      )),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

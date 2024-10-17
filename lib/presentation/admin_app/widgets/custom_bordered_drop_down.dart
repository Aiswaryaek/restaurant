import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class CustomBorderedDropDown extends StatefulWidget {
  final String dropDownItem;
  final dynamic onTap;
  final double dropDownItemOpacity;
  final double width;
  final ScrollPhysics? physics;
  final dynamic dropDownContainerHeight;
  final List<Widget> dropDownItems;
  final double dropDownItemLeftPadding;
  final double dropDownItemRightPadding;
  final double dropDownItemTopPadding;
  final double dropDownItemBottomPadding;
    final double dropDownBottomPadding;

  final bool isBorder;
  final dynamic titleLeftPadding;
    final double borderRadius;

  final dynamic titleRightPadding;
  final bool isTitleBold;

  final Color dropDownContainerColor;
  final Color borderColor;
  const CustomBorderedDropDown(
      {super.key,

      required this.dropDownItem,
     required  this.titleLeftPadding ,
     this.borderRadius = 8.0,
     this.isTitleBold = false,
     required this.titleRightPadding,
      required this.isBorder,
      this.dropDownItemBottomPadding = 0,
      this.dropDownItemLeftPadding = 0,
      this.dropDownItemRightPadding = 0,
      this.dropDownItemTopPadding = 0,
      required this.dropDownItemOpacity,
      required this.physics,
      required this.dropDownContainerHeight,
      this.dropDownBottomPadding = 6,
      required this.dropDownItems,
      this.onTap,
      required this.borderColor,
      required this.dropDownContainerColor,
      this.width = double.infinity});

  @override
  State<CustomBorderedDropDown> createState() => _CustomBorderedDropDownState();
}

class _CustomBorderedDropDownState extends State<CustomBorderedDropDown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(widget.dropDownBottomPadding)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        height: widget.dropDownContainerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.dropDownContainerColor,
            border: (widget.isBorder == true)
                ? Border.all(width: 1, color: widget.borderColor)
                : null),
        child: Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: widget.physics,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left:AppScreenUtil().screenWidth( widget.titleLeftPadding),right:AppScreenUtil().screenWidth(widget.titleRightPadding) ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                          color: Colors.transparent,
                          height: AppScreenUtil().screenHeight(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.dropDownItem,
                                style:(widget.isTitleBold == false)? bookedTextStyle:bookedTextStyleBold,
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: AppScreenUtil().screenWidth(8)),
                                child: GestureDetector(
                                  // onTap: widget.onTap,
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    color: blackColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///Dropdown items colum
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 750),
                  opacity: widget.dropDownItemOpacity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(widget.dropDownItemLeftPadding),
                        right:AppScreenUtil().screenWidth (widget.dropDownItemRightPadding),
                        top:AppScreenUtil().screenWidth(widget.dropDownItemTopPadding) ,
                        bottom: AppScreenUtil().screenWidth(widget.dropDownItemBottomPadding)),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: widget.dropDownItems,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // child: DropdownButton<String>(
        //   padding: const EdgeInsets.only(
        //       left: 10, right: 10),
        //   value: widget.value,
        //   items: widget.dropDownItems.map((String item) {
        //     return DropdownMenuItem<String>(
        //       value: item,
        //       child: Text(
        //         item,
        //         style: subdropDownItemTextStyle,
        //       ),
        //     );
        //   }).toList(),
        //   onChanged: widget.onChanged,
        //   icon: const Icon(
        //     Icons.arrow_drop_down,
        //     color: blackColor,
        //   ),
        //   iconSize: 20,
        //   isExpanded: true,
        //   underline:
        //   const SizedBox(), // Removes the default underline
        // ),
      ),
    );
  }
}

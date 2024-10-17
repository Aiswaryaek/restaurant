import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

class CustomDropDownButton extends StatefulWidget {
  final String title;
  final Widget? hint;

  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final Color? iconColor;
  final TextStyle titleLabelStyle;
  

  const CustomDropDownButton({
    required this.title,
    this.hint,
    required this.value,
    this.iconColor=blackColor,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    required this.titleLabelStyle,
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
                style: widget.titleLabelStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(9.5),
              ),
              Container(
                height: AppScreenUtil().screenHeight(30),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: whiteColor,
                    boxShadow:const [BoxShadow(color:payTemplateListShadow,offset:  Offset(0, 0),blurRadius: 3 )]
                   ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    iconStyleData: IconStyleData(
                        icon: Padding(
                      padding: EdgeInsets.only(
                          right: AppScreenUtil().screenWidth(15)),
                      child: ImageIcon(
                        AssetImage(
                          ImageCons.imgPosSettingsDropdownArrow,
                          
                        ),

                        size: 14.00,
                        color: widget.iconColor,
                      ),
                    )),
                    //To avoid long text overflowing.
                    isExpanded: true,
                    hint: widget.hint,
                    value: widget.value,
                    items: widget.dropdownItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child:
                               Container(
                                color: Colors.transparent,
                                alignment: widget.valueAlignment,
                                child: Text(item,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: posSettingsDropDownStyle),
                              ),
                            ))
                        .toList(),
                    onChanged: widget.onChanged,
                    selectedItemBuilder: widget.selectedItemBuilder,
                  ),
                ),
              )
            ]));
  }
}

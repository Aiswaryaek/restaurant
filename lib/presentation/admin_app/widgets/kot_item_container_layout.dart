import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class KotItemImageContainerLayout extends StatefulWidget {
  final bool isDarkMode;
  final String iconPAth;
  final String tabLabel;
  final Function()? tabOnTap;
  final bool isTabSelected;
  final String darkModeIcons;
  const KotItemImageContainerLayout({super.key,required this.iconPAth,required this.tabLabel,this.tabOnTap,required this.isTabSelected,required this.isDarkMode,required this.darkModeIcons});

  @override
  State<KotItemImageContainerLayout> createState() => _KotItemImageContainerLayoutState();
}

class _KotItemImageContainerLayoutState extends State<KotItemImageContainerLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: AppScreenUtil().screenWidth(63),
          width: AppScreenUtil().screenWidth(63),
          decoration: BoxDecoration(
              color:(widget.isDarkMode == false)? kotTokenDisplayItemContainerColor:tableOutlinedColor,
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: loanContainerColor,
                    offset: Offset(0, 0),
                    blurRadius: 4)
              ]),
          child: Center(
            child: SvgPicture.asset(
            (widget.isDarkMode == false)?  widget.iconPAth:widget.darkModeIcons,
              height: AppScreenUtil().screenWidth(39),
              width: AppScreenUtil().screenWidth(42),
            ),
          ),
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(9),
        ),

        ///Tab layout
        
///Selected tab layout

        GestureDetector(
          onTap: widget.tabOnTap,
          child:
          SizedBox(
            child:(widget.isTabSelected == true)? Container(
              height: AppScreenUtil().screenWidth(19),
              width: AppScreenUtil().screenWidth(56),
              decoration: BoxDecoration(
                  color:(widget.isDarkMode == false)? redColor:blackColor,
                  borderRadius: BorderRadius.circular(10),
                   ),
              child: Center(
                child: Text(
                  widget.tabLabel,
                  style: kotSelectedTabLabelStyle,
                ),
              ),
            ):
              ///Unselected tab layout
        Container(
          height: AppScreenUtil().screenWidth(19),
          width: AppScreenUtil().screenWidth(56),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: payTemplateListShadow,
                    offset: Offset(0, 0),
                    blurRadius: 5)
              ]),
          child: Center(
            child: Text(
              widget.tabLabel,
              style:(widget.isDarkMode == false)? kotUnselectedTabLabelStyle:kotDarkModeUnselectedTabLabelStyle,
            ),
          ),
        )
          ),
        ),

      
      ],
    );
  }
}

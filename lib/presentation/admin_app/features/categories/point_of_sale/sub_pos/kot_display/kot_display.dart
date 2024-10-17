import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/kot_display/tabs/all_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/kot_display/tabs/completed_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/kot_display/tabs/new_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/sub_pos/kot_display/tabs/preparing_tab.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_toggle_button.dart';
import 'package:restaurant/presentation/admin_app/widgets/kot_item_container_layout.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';
bool isDarkMode = false;
class KotDisplay extends StatefulWidget {
  const KotDisplay({super.key});

  @override
  State<KotDisplay> createState() => _KotDisplayState();
}

class _KotDisplayState extends State<KotDisplay> {
  final List<String> tabLabelList = ['All', 'New', 'Preparing', 'Completed'];
  final List<String> iconPathList = [
    ImageCons.imgKotAllRed,
    ImageCons.imgKotNewRed,
    ImageCons.imgKotPreparingRed,
    ImageCons.imgKotCompletedRed,
  ];
    final List<String> darkModeIcons= [
    ImageCons.imgKotAllBlack,
    ImageCons.imgKotNewBlack,
    ImageCons.imgKotPreparingBlack,
    ImageCons.imgKotCompletedBlack,
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left:AppScreenUtil().screenWidth(30),right: AppScreenUtil().screenWidth(30),bottom: AppScreenUtil().screenHeight(15) ),
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  tabLabelList.length,
                  (index) => KotItemImageContainerLayout(
                    darkModeIcons:darkModeIcons[index] ,
                    isDarkMode: isDarkMode,
                        iconPAth: iconPathList[index],
                        tabLabel: tabLabelList[index],
                        tabOnTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        isTabSelected: selectedIndex == index ? true : false,
                      ))),
          SizedBox(
            height: AppScreenUtil().screenHeight(23),
          ),

          ///Tab layout
          (selectedIndex == 0)
              ?  AllTab(isDarkMode: isDarkMode,)
              : (selectedIndex == 1)
                  ?  NewTab(isDarkMode: isDarkMode,)
                  : (selectedIndex == 2)
                      ?  PreparingTab(isDarkMode: isDarkMode,)
                      :  CompletedTab(isDarkMode: isDarkMode,)
        ],
      ),
    );
  }
}

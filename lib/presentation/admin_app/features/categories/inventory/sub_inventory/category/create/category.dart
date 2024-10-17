// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';


import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final nameController = TextEditingController();
  final mainCategoryController = TextEditingController();
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child:
                      CustomTextFieldWithTitle(
                          controller: mainCategoryController, title: 'Main Category'),
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Image upload',
                              style: dashBoardTextStyle,
                            ),
                            SvgPicture.asset(
                              ImageCons.uploadImage,
                              height: 70,
                              width: 100,
                            ),
                          ],
                        )
                    ),
                    SizedBox(width: AppScreenUtil().screenWidth(25)),
                    Expanded(
                        child:
                        Container()
                    ),
                  ],
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(18),
                ),
              ],
            )),
      ],
    );
  }
}

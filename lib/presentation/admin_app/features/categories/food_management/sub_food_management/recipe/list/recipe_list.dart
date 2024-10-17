// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Color> tableDataAlternateColor = [
    leftPayslipFirstColor.withOpacity(0.8),
    recipeSecondContainerLeftColor
  ];
  List<Color> tableDataColor = [
    loanFirstContainerCardColor,
    recipeSecondContainerColor
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, bottom: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3 / 1.30),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.only(left: 5.5),
                      decoration: BoxDecoration(
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(23, 18, 20, 15),
                          decoration: BoxDecoration(
                            color:
                                tableDataColor[index % tableDataColor.length],
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BOM0000001',
                                      style: pangramMedium(
                                          size: 12.0, color: blackColor),
                                    ),
                                    SvgPicture.asset(
                                      ImageCons.imgDelete,color: confirmColor,
                                      height: AppScreenUtil().screenHeight(15),
                                      width: AppScreenUtil().screenWidth(13),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppScreenUtil().screenHeight(10),),
                                Text('Recipe',style: pangramRegular(size: 8.0, color: blackColor),),
                                SizedBox(height: AppScreenUtil().screenHeight(2),),
                                Text('New',style: pangramRegular(size: 10.0, color: blackColor),),
                                SizedBox(height: AppScreenUtil().screenHeight(10),),
                                Text('Product',style: pangramRegular(size: 8.0, color: blackColor),),
                                SizedBox(height: AppScreenUtil().screenHeight(2),),
                                Text('Product 181',style: pangramRegular(size: 10.0, color: blackColor),)
                              ]),
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}

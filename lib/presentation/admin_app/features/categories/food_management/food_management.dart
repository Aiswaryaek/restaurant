// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/food_management/sub_food_management/sub_food_management.dart';

import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';
import '../../../../../utiles/image_constant.dart';

class FoodManagement extends StatefulWidget {
  const FoodManagement({super.key});

  @override
  State<FoodManagement> createState() => _FoodManagementState();
}

class _FoodManagementState extends State<FoodManagement> {
  final product = <ProductCategoriesModel>[];
  int? tappedProducts;
  dynamic currentTab;
  String tappedProduct = 'Product';
  String? item;
  bool tappedColor = false;

  @override
  void initState() {
    product.add(
        ProductCategoriesModel('Preparation', ImageCons.imgPosPreparation));
    product.add(
        ProductCategoriesModel('Recipe', ImageCons.imgPosRecipe));
    product.add(
        ProductCategoriesModel('Configuration', ImageCons.imgPosConfiguration));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  currentTab == 'Preparation' ||
        currentTab == 'Recipe' ||
        currentTab == 'Configuration'
        ? SubFoodManagement(currentTab, item!)
        : Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
        // height: 600,
        width: double.infinity,
        // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                tabPageLeftGradientColor,
                tabPageRightGradientColor,
              ]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppScreenUtil().screenHeight(25),),
            Expanded(child: SingleChildScrollView(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(10, -2),
                  child:  Text(
                    'Food Management',
                    style: dashBoardLabelTextStyle,
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(20),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 13,
                  children: List<Widget>.generate(product.length, (int index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            tappedProducts = index;
                            currentTab = product[index].text;
                            item = tappedProduct;
                            tappedColor = true;
                          });
                          print('current Tab :$currentTab');
                        },
                        child: Container(
                          width: AppScreenUtil().screenWidth(80),
                          color: Colors.transparent,
                          padding: EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(9),
                                height: AppScreenUtil().screenHeight(38),
                                width: AppScreenUtil().screenWidth(47),
                                decoration: BoxDecoration(
                                  color: tabSelectionAColor.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: SvgPicture.asset(product[index].icon),
                              ),
                              SizedBox(
                                height: AppScreenUtil().screenHeight(6),
                              ),
                              Center(
                                child: Text(
                                  product[index].text.toString(),textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: clearDataAlertYesButtonLabelStyle,
                                ),
                              )
                            ],
                          ),
                        ));
                  }).toList(),
                ),

              ],
            ),))
          ],
        ));
  }
}

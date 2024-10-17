// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/models/inventory_product_category_model.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendors/create/vendors.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/sub_accounts/vendors/list/vendors_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/food_management/food_management.dart';
import 'package:restaurant/presentation/admin_app/features/categories/food_management/sub_food_management/preparation/detail/preparation.dart';
import 'package:restaurant/presentation/admin_app/features/categories/food_management/sub_food_management/preparation/list/preparation_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/food_management/sub_food_management/recipe/detail/recipe_detail.dart';
import 'package:restaurant/presentation/admin_app/features/categories/food_management/sub_food_management/recipe/list/recipe_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/purchase.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/configuration/configuration.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/grn/create/grn_create.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/grn/list/grn_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_aging_report/purchase_aging_report.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_order/create/purchase_order.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_order/list/purchase_order_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/purchase_report/list/purchase_report_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/request_for_quotation/create/request_for_quotation.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/request_for_quotation/list/request_for_quotation_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/unit_of_measurement/create/uom.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/unit_of_measurement/list/uom_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/vendors/create/vendors.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/sub_purchase/vendors/list/vendors_list.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import 'configuration/configuration.dart';

class SubFoodManagement extends StatefulWidget {
  String tappedItem;
  String tappedHeadItem;

  SubFoodManagement(this.tappedItem, this.tappedHeadItem, {super.key});

  @override
  State<SubFoodManagement> createState() => _SubFoodManagementState();
}

class _SubFoodManagementState extends State<SubFoodManagement> {
  @override
  Widget build(BuildContext context) {
    print(widget.tappedItem);
    return widget.tappedItem == 'Food Management'
        ? FoodManagement()
        : Column(
            children: [
              SizedBox(
                height: AppScreenUtil().screenHeight(25),
              ),
              Expanded(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(16),
                        right: AppScreenUtil().screenWidth(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Filter button
                          widget.tappedItem == 'Preparation' ||
                              widget.tappedItem == 'Recipe' ||
                              widget.tappedItem == 'Configuration'
                              ? Transform.translate(
                            offset: Offset(0, 5),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              height: AppScreenUtil().screenHeight(14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: reductionBottomSheetButtonColor
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageCons.imgTableFilterIcon,
                                    height: 6.71,
                                    width: 10.06,
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(5.7),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 3),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Filter',
                                      style: gridTextStyle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                              : SvgPicture.asset(
                            ImageCons.save,
                            height: 23,
                            width: 12,
                          ),
                          widget.tappedItem == 'Preparation' ||
                              widget.tappedItem == 'Recipe' ||
                              widget.tappedItem == 'Configuration'
                              ? Transform.translate(
                            offset: Offset(0, -17.5),
                            child: Center(
                              child: Text(
                                'Food Management',
                                style: btnTextStyle,
                              ),
                            ),
                          )
                              : Transform.translate(
                            offset: Offset(0, -25),
                            child: Center(
                              child: Text(
                                'Food Management',
                                style: btnTextStyle,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.tappedItem = 'Food Management';
                                        });
                                      },
                                      child: Text(
                                        'Food Management',
                                        style: taxCreateEnterAPassWordLabelStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(2),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: blackColor,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(4),
                                    ),

                                    ///Last Tap text
                                    Expanded(
                                      child: Container(
                                          width:
                                          AppScreenUtil().screenHeight(120),
                                          color: Colors.transparent,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  widget.tappedItem ==
                                                      'Preparation Create'
                                                      ? 'Preparation'
                                                      : widget.tappedItem ==
                                                      'Recipe Create'
                                                      ? 'Recipe'
                                                      : widget.tappedItem ==
                                                      'Configuration Create'
                                                      ? 'Configuration'
                                                      : widget.tappedItem,
                                                  maxLines: 1,
                                                  style: gridTextStyle,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(15),
                                    )

                                    ///Create button
                                  ],
                                ),
                              ),
                              widget.tappedItem == 'Preparation Create'
                                  ? Row(
                                children: [
                                  Container(
                                    height:
                                    AppScreenUtil().screenHeight(22),
                                    width: AppScreenUtil().screenWidth(64),
                                    color: processButtonColor,
                                    child: Center(
                                      child: Text(
                                        'Process',
                                        style: pangramMedium(
                                            size: 8.0, color: whiteColor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppScreenUtil().screenWidth(15),
                                  ),
                                  Container(
                                    height:
                                    AppScreenUtil().screenHeight(22),
                                    width: AppScreenUtil().screenWidth(64),
                                    color: tableReservedColor,
                                    child: Center(
                                      child: Text(
                                        'Cancel',
                                        style: pangramMedium(
                                            size: 8.0, color: whiteColor),
                                      ),
                                    ),
                                  )
                                ],
                              )
                                  : Visibility(
                                visible: (widget.tappedItem ==
                                    'Preparation Create' ||
                                    widget.tappedItem ==
                                        'Recipe Create' ||
                                    widget.tappedItem ==
                                        'Configuration')
                                    ? false
                                    : true,
                                child: CustomButton(
                                    buttonHeight:
                                    AppScreenUtil().screenHeight(18),
                                    buttonWidth:
                                    AppScreenUtil().screenWidth(61),
                                    buttonColor: confirmColor,
                                    borderRadius: 4,
                                    buttonText: 'Create',
                                    onTap: () {
                                      setState(() {
                                        if (widget.tappedItem ==
                                            'Preparation') {
                                          widget.tappedItem =
                                          'Preparation Create';
                                        } else if (widget.tappedItem ==
                                            'Recipe') {
                                          widget.tappedItem =
                                          'Recipe Create';
                                        } else if (widget.tappedItem ==
                                            'Configuration') {
                                          widget.tappedItem =
                                          'Configuration Create';
                                        }
                                      });
                                    },
                                    buttonLabelStyle:
                                    inventoryCreateButtonLabelStyle),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SingleChildScrollView(child:  widget.tappedItem == 'Preparation'
                        ? PreparationList()
                        : widget.tappedItem == 'Preparation Create'
                        ? PreparationDetail()
                        : widget.tappedItem == 'Recipe'
                        ? RecipeList()
                        : widget.tappedItem == 'Recipe Create'
                        ? RecipeDetail()
                        : widget.tappedItem == 'Configuration'
                        ? ConfigurationPage()
                        : Text('Last Item')))
                  ]),)
            ],
          );
////
  }
}

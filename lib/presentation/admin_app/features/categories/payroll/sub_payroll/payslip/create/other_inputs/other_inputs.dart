// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../../styles/colors.dart';
import '../../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../../utiles/image_constant.dart';
import '../../../../../../../widgets/colored_textfield.dart';
import '../../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';

class OtherInputs extends StatefulWidget {
  const OtherInputs({super.key});

  @override
  State<OtherInputs> createState() => _OtherInputsState();
}

class _OtherInputsState extends State<OtherInputs> {
  final componentController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  List<String> component = [
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
    'Name Of Component',
  ];
  List<String> description = [
    'Description',
    'Description',
    'Description',
    'Description',
    'Description',
  ];
  List<String> amount = [
    '700.00',
    '700.00',
    '700.00',
    '700.00',
    '700.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ColoredTextField(
                  color: textFieldColor,
                  controller: componentController,
                  title: 'Component'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: ColoredTextField(
                  color: textFieldColor,
                  controller: descriptionController,
                  title: 'Description'),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(18),
        ),
        Row(
          children: [
            Expanded(
              child: ColoredTextField(
                  color: textFieldColor,
                  controller: amountController,
                  title: 'Amount'),
            ),
            SizedBox(width: AppScreenUtil().screenWidth(25)),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        SizedBox(
          height: AppScreenUtil().screenHeight(25),
        ),
        SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Table heading
              Container(
                height: AppScreenUtil().screenHeight(25),
                width: AppScreenUtil().screenWidth(320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppScreenUtil().screenWidth(6)),
                      topRight:
                          Radius.circular(AppScreenUtil().screenWidth(6))),
                  color: blackColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(120),
                          child: Center(
                            child: Text(
                              'Component',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Description',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'Amount',
                              style:
                              placeOrderingAndConfirmPaymentButtonLabelStyle,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                  children: List.generate(component.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(30),
                    width: AppScreenUtil().screenWidth(322),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: tableOutlinedColor.withOpacity(0.7),
                          width: 0.8),
                      color: whiteColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(120),
                              child: Text(
                                component[index],
                                textAlign: TextAlign.center,
                                style: salesReportSubTitleLabelStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Text(
                                textAlign: TextAlign.center,
                                description[index],
                                style: salesReportSubTitleLabelStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(100),
                              child: Text(
                                amount[index].toString(),
                                textAlign: TextAlign.center,
                                style: salesReportSubTitleLabelStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    bottomBar(context);
                  },
                );
              })),
            ],
          ),
        ),
      ],
    );
  }
  void bottomBar(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: AppScreenUtil().screenHeight(100),
          decoration: BoxDecoration(
            color: confirmColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              SizedBox(
                width: AppScreenUtil().screenWidth(50),
                child: Center(
                  child: Divider(
                    color: whiteColor,
                    thickness: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InventoryBottomSheetItemLayout(
                        iconHeight: 13.09,
                        iconPath: ImageCons.imgDisabledView,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.imgDisabledEdit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDelete,
                        iconWidth: 13.91),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

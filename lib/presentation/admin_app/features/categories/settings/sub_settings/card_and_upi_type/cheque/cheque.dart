// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/colored_dropdown.dart';
import '../../../../../../widgets/colored_textfield.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/outlined_table.dart';

class Cheque extends StatefulWidget {
  const Cheque({super.key});

  @override
  State<Cheque> createState() => _ChequeState();
}

class _ChequeState extends State<Cheque> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final commisionController = TextEditingController();
  final bankNameController = TextEditingController();
  ScrollController chequeController = ScrollController();

  List<String> bankName = [
    'Federal Bank',
    'Canara Bank',
    'ICICI Bank',
    'SBI Bank',
    'AXIS Bank',
    'HDFC Bank',
  ];
  List<String> commission = [
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
  ];
  List<String> image = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU5%',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredTextField(
                  color: textFieldColor,
                  controller: bankNameController,
                  title: 'Bank Name'),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredTextField(
                  color: textFieldColor,
                  controller: commisionController,
                  title: 'Commision (%)'),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              Text(
                'Logo',
                style: bookedTextStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(8),
              ),
              Container (
                  padding: EdgeInsets.only(right: 10, left: 10),
                  height: 41,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: textFieldColor),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Container(
                          width: 33,
                          height: 20,
                          decoration: BoxDecoration(
                              color: searchShiftColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(11)),
                          padding: EdgeInsets.only(bottom: 2),
                          child: Align(
                            alignment: Alignment.center,
                            child:SvgPicture.asset(ImageCons.imgLogoUpload),
                          )),
                      onTap: () {},
                    ),
                  )),
              SizedBox(
                height: AppScreenUtil().screenHeight(10),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 83,
                    height: 24,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: blackColor)),
                    padding: EdgeInsets.only(bottom: 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Submit',
                          style: confirmTextStyle, textAlign: TextAlign.center),
                    )),
              ),
              SizedBox(height: AppScreenUtil().screenHeight(20),),
              OutLinedTable( visible: false,
                  scrollController: chequeController,
                  // tableHeight: MediaQuery.of(context).size.height / 2,
                  tableDataWidgets: List.generate(bankName.length, (index) {
                    return InkWell(
                      child: Container(
                        height: AppScreenUtil().screenHeight(38),
                        width: AppScreenUtil().screenWidth(310),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: searchTextColor.withOpacity(0.15)),
                            color: Colors.transparent),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18)),

                          ///scrolling row
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(75),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        bankName[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(90),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(commission[index],
                                        style: tableSubTitleLabelStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(image[index],height: 23,),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        bottomBar(context);
                      },
                    );
                  }),
                  tableRowWidth: 310,
                  titleWidgets: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bank Name',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Commision (%)',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                    Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Logo',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        )),
                  ]),
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
                        iconPath: ImageCons.edit,
                        iconWidth: 15.29),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.84,
                        iconPath: ImageCons.imgDisabledDelete,
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

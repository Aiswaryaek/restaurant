// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../widgets/colored_textfield.dart';
import '../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../widgets/outlined_table.dart';

class Aggregators extends StatefulWidget {
  const Aggregators({super.key});

  @override
  State<Aggregators> createState() => _AggregatorsState();
}

class _AggregatorsState extends State<Aggregators> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final commisionController = TextEditingController();
  final aggregatorController = TextEditingController();
  ScrollController aggregatorsController = ScrollController();

  List<String> aggregatorsName = [
    'Swiggy',
    'Zomato',
    'Foodzie',
  ];
  List<String> commission = [
    '5%',
    '5%',
    '5%',
  ];
  List<String> image = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR54LHnC0pCqXsuB6rMOyxXNkPrMDUStfQEo_fzG7mZo47Ph9myyR6YT3Oo7vFxD4axPTg&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredTextField(
              color: textFieldColor,
              controller: aggregatorController,
              title: 'Aggregate Name'),
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
                width: 33,
                height: 24,
                decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: blackColor)),
                padding: EdgeInsets.only(bottom: 2),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.add,color: whiteColor,size: 17,)
                )),
          ),
          SizedBox(height: AppScreenUtil().screenHeight(20),),
          OutLinedTable( visible: false,
              scrollController: aggregatorsController,
              // tableHeight: MediaQuery.of(context).size.height / 2,
              tableDataWidgets: List.generate(aggregatorsName.length, (index) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child: Text(
                                    aggregatorsName[index],
                                    style: tableSubTitleLabelStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                                width: AppScreenUtil().screenWidth(85),
                                child: Center(
                                  child: Text(commission[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                          Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(85),
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
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aggregate Name',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
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
                    width: AppScreenUtil().screenWidth(85),
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
          SizedBox(height: AppScreenUtil().screenHeight(15),),
        ],
      ),
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

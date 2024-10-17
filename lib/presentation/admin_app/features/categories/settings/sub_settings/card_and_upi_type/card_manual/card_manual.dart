// ignore_for_file: prefer_const_constructors

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

class CardManual extends StatefulWidget {
  const CardManual({super.key});

  @override
  State<CardManual> createState() => _CardManualState();
}

class _CardManualState extends State<CardManual> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final upiController = TextEditingController();
  final commisionController = TextEditingController();
  ScrollController cardManualController = ScrollController();
  List<String> bankJournal = [
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
    'Bank',
  ];
  List<String> cardName = [
    'VISA',
    'MASTER',
    'VISA',
    'MASTER',
    'VISA',
    'MASTER',
  ];
  List<String> commision = [
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
              ColoredDropDown(isVisible: true,
                dropDownItems: _dropdownItems,
                title: 'Card Manual',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(14),
              ),
              ColoredTextField(
                  color: textFieldColor,
                  controller: upiController,
                  title: 'UPI Manual'),
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
              SizedBox(height: AppScreenUtil().screenHeight(12),),
            ],
          ),
        ),
        OutLinedTable( visible: false,
            scrollController: cardManualController,
            // tableHeight: MediaQuery.of(context).size.height / 2,
            tableDataWidgets: List.generate(bankJournal.length, (index) {
              return InkWell(
                child: Container(
                  height: AppScreenUtil().screenHeight(38),
                  width: AppScreenUtil().screenWidth(430),
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
                            width: AppScreenUtil().screenWidth(90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bankJournal[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(cardName[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(commision[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(95),
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
            tableRowWidth: 430,
            titleWidgets: [
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bank Journal',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Card Name',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Commision',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
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

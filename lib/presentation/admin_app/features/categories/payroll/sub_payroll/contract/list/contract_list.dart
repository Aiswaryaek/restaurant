// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class ContractList extends StatefulWidget {
  const ContractList({super.key});

  @override
  State<ContractList> createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  ScrollController contractTableController = ScrollController();
  double contractIndicatorPosition = 0.0;
  List<String> contractName = [
    'EMp12 - VAISHAK',
    'EMp13 - DEEPAK',
    'EMp14 - NIHAD',
    'EMp13 - DEEPAK',
    'EMp14 - NIHAD',
    'EMp13 - DEEPAK',
    'EMp12 - VAISHAK',
    'EMp13 - DEEPAK',
    'EMp12 - VAISHAK',
  ];
  List<String> department = [
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
    'IT',
  ];
  List<String> designation = [
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
    'IT Dept',
  ];
  List<String> contractType = [
    'Permanent',
    'Permanent',
    'Permanent',
    'Permanent',
    'Permanent',
    'Permanent',
    'Permanent',
    'Permanent',
    'Permanent',
  ];
  List<String> sponsor = [
    '10120',
    '10120',
    '10120',
    '10120',
    '10120',
    '10120',
    '10120',
    '10120',
    '10120',
  ];
  List<String> branch = [
    'Dubai',
    'Dubai',
    'Dubai',
    'Dubai',
    'Dubai',
    'Dubai',
    'Dubai',
    'Dubai',
    'Dubai',
  ];
  List<String> from = [
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
    '13/12/2024',
  ];
  List<String> to = [
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
    '13/12/2025',
  ];
  List<String> workingScheme = [
    '8 Hour',
    '8 Hour',
    '8 Hour',
    '8 Hour',
    '8 Hour',
    '8 Hour',
    '8 Hour',
    '8 Hour',
    '18 Hour',
  ];
  List<String> status = [
    'Running',
    'Expired',
    'Cancel',
    'Running',
    'Expired',
    'Cancel',
    'Running',
    'Expired',
    'Cancel',
  ];

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final contractNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    contractTableController.addListener(() {
      setState(() {
        contractIndicatorPosition = (contractTableController.offset /
                contractTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    contractTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 20),
          child: DefaultProductTable(
              visible: true,
              scrollController: contractTableController,
              slidingIndicatorPosition: contractIndicatorPosition,
              tableDataWidgets: List.generate(contractName.length, (index) {
                return InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                    child: Container(
                      height: AppScreenUtil().screenHeight(36),
                      width: AppScreenUtil().screenWidth(1057),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: tableDataAlternateColor[
                            index % tableDataAlternateColor.length],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppScreenUtil().screenWidth(5)),

                        ///scrolling row
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Product id data
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(110),
                                child: Center(
                                  child: Text(
                                    contractName[index],
                                    style: dashBoardTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(100),
                                  child: Center(
                                    child: Text(department[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child: Text(designation[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child:  Text(contractType[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child: Text(sponsor[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(90),
                                  child: Center(
                                    child:  Text(branch[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child: Text(from[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child:  Text(to[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
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
                                    child: Text(workingScheme[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(110),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(bottom: 2),
                                        width: AppScreenUtil().screenWidth(65),
                                        height:
                                            AppScreenUtil().screenHeight(18),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: status[index] == 'Running'
                                              ? runningButtonColor
                                                  .withOpacity(0.6)
                                              : status[index] == 'Expired'
                                                  ? expiredButtonColor
                                                      .withOpacity(0.6)
                                                  : cancelButtonColor.withOpacity(0.7),
                                        ),
                                        child: Center(
                                          child: Text(
                                            status[index],
                                            style:
                                                inventoryCreateButtonLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 1057,
              titleWidgets: [
                ///Product id heading
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(110),
                  child: Center(
                    child: Text(
                      'Name',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child: Text(
                          'Department',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child: Center(child: Text(
                    'Designation',
                    style: tableTitleLabelStyle,
                    maxLines: 1,
                  ),)
                ),
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(100),
                  child:Center(
                    child:  Text(
                      'Contract Type',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(100),
                      child: Center(
                        child:  Text(
                          'Sponsor',
                          style: tableTitleLabelStyle,
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
                          'Branch',
                          style: tableTitleLabelStyle,
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
                          'From',
                          style: tableTitleLabelStyle,
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
                          'To',
                          style: tableTitleLabelStyle,
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
                          'Working Scheme',
                          style: tableTitleLabelStyle,
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
                      width: AppScreenUtil().screenWidth(110),
                      child: Center(
                        child: Text(
                          'Status',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        )
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
                        iconPath: ImageCons.imgVisibility,
                        iconWidth: 20.53),
                    InventoryBottomSheetItemLayout(
                        iconHeight: 15.29,
                        iconPath: ImageCons.edit,
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

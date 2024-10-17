// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../../utiles/image_constant.dart';
import '../../../../../../widgets/inventory_bottom_sheet_item_layout.dart';
import '../../../../../../widgets/product_table.dart';

class AddDocumentList extends StatefulWidget {
  const AddDocumentList({super.key});

  @override
  State<AddDocumentList> createState() => _AddDocumentListState();
}

class _AddDocumentListState extends State<AddDocumentList> {
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  ScrollController addDocumentTableController = ScrollController();
  double addDocumentIndicatorPosition = 0.0;

  List<String> employee = [
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee',
    'Name of Employee'
  ];
  List<String> employeeId = [
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID',
    'Employee ID'
  ];
  List<String> documents = [
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: DefaultProductTable(
                visible: false,
                scrollController: addDocumentTableController,
                slidingIndicatorPosition: addDocumentIndicatorPosition,
                tableDataWidgets: List.generate(employee.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(350),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(110),
                                    child: Center(
                                      child:
                                      Text(
                                        employee[index],
                                        style: dashBoardTextStyle,
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
                                    width: AppScreenUtil().screenWidth(100),
                                    child: Center(
                                      child: Text(
                                        employeeId[index],
                                        style: dashBoardTextStyle,
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
                                  Container( color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(100),child: Center(
                                      child:  Text(
                                        documents[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),)
                                ],
                              ),
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
                tableRowWidth: 350,
                titleWidgets: [
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(110),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Employee',
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
                            'Employee ID',
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
                            'Documents',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
          ),
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
                        iconPath: ImageCons.imgDisabledEdit,
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

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_tab_layout.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../../user_app/widgets/common_image_view.dart';
import '../../../../../../../user_app/widgets/custom_button.dart';

class ManageEmployeeList extends StatefulWidget {
  dynamic tappedItem;
  final dynamic tableOnTap;

  ManageEmployeeList(this.tappedItem, this.tableOnTap, {super.key});

  @override
  State<ManageEmployeeList> createState() => _ManageEmployeeListState();
}

class _ManageEmployeeListState extends State<ManageEmployeeList> {
  ScrollController manageEmployeeTableScrollController = ScrollController();
  double manageEmployeeTableIndicatorPosition = 0.0;
  @override
  void initState() {
    super.initState();
    manageEmployeeTableScrollController.addListener(() {
      setState(() {
        manageEmployeeTableIndicatorPosition =
            (manageEmployeeTableScrollController.offset /
                    manageEmployeeTableScrollController
                        .position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
  }

  @override
  void dispose() {
    manageEmployeeTableScrollController.dispose();

    super.dispose();
  }

  List<String> employeeIdList = [
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546',
    'EMP7546'
  ];
  List<String> branchOrNameList = [
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode',
    'ABC-123-Azhicode'
  ];
  List<String> nameList = [
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
    'Name of Employee',
    'Name of Employee',
  ];
  List<String> imageList = [
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png',
    'https://cdn-icons-png.flaticon.com/512/4974/4974985.png'
  ];
    List<String> phoneNumberList = [
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752',
    '9078546752'
  ];
   List<String> joiningDateList = [
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023',
    '26/05/2023'
  ];
     List<String> designationList = [
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef',
    'Chef'
  ];
    List<String> departmentList = [
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking',
    'Cooking'
  ];  List<String> defaultDocList = [
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536',
    'Passport\nPAS4536'
  ];  List<String> expiryDateList = [
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023',
    '13/05/2023'
  ];
  
  
  

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: AppScreenUtil().screenHeight(15),
                    left: AppScreenUtil().screenWidth(16)),
                child: InventoryTableLayout(
                  tableHeadingRowHeight: 30,
                    scrollController: manageEmployeeTableScrollController,
                    slidingIndicatorPosition:
                        manageEmployeeTableIndicatorPosition,
                    tableDataWidgets:
                        List.generate(employeeIdList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: AppScreenUtil().screenWidth(5)),
                        child: GestureDetector(
                          onTap: widget.tableOnTap,
                          child: Container(
                            height: AppScreenUtil().screenHeight(30),
                            width: AppScreenUtil().screenWidth(1300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: tableDataAlternateColor[
                                  index % tableDataAlternateColor.length],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppScreenUtil().screenWidth(18)),

                              ///scrolling row
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ///Product id data
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(
                                            employeeIdList[index],
                                            style: tableSubTitleLabelStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),


                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(branchOrNameList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(nameList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(95),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CommonImageView(
                                            url: imageList[index],
                                            height: 23,
                                            width: 30,
                                          ),
                                        ],
                                      )),


                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(phoneNumberList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(joiningDateList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child: Text(designationList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child:  Text(departmentList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child: Text(defaultDocList[index],
                                              style: tableSubTitleLabelStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(95),
                                        child: Center(
                                          child: Text(expiryDateList[index],
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
                                    CustomButton(buttonHeight: AppScreenUtil().screenHeight(18),buttonWidth: AppScreenUtil().screenWidth(60), buttonColor: manageEmployeeButtonColor, borderRadius: 6, buttonText:'Active' , buttonLabelStyle: adminDashBoardViewMoreButtonLabelStyle)
                                  ],)
                                ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    tableRowWidth: 1300,
                    titleWidgets: [
                   
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Employee ID',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                     

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Branch/Name',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),


                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

       

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Image',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),

                  

                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Phone Number',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                           Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Joining Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                                
                          ],
                        ),
                      ),
                       Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Designation',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),     Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Department',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),     Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Default Doc',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),     Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(95),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Expiry Date',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),     Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(85),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Status',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ]))
          ],
        ),
      ],
    );
  }
}

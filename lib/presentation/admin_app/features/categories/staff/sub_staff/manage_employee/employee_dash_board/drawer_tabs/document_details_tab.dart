import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_non_scrollable_table.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class DocumentsDetailsTab extends StatefulWidget {
  const DocumentsDetailsTab({super.key});

  @override
  State<DocumentsDetailsTab> createState() => _DocumentsDetailsTabState();
}

class _DocumentsDetailsTabState extends State<DocumentsDetailsTab> {

  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );
 

  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());
  ScrollController documentDetailsTableController = ScrollController();
  double documentDetailsTableIndicatorPosition = 0.0;
  @override
  void initState() {
    documentDetailsTableController.addListener(() {
      setState(() {
        documentDetailsTableIndicatorPosition = (documentDetailsTableController.offset /
                documentDetailsTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    documentDetailsTableController.dispose();
    super.dispose();
  }

  List<String> documentsList = [
    'Voter ID',
    'Voter ID',
    'Voter ID',
    'Voter ID',
    'Voter ID',
    'Voter ID',
    'Voter ID',
    'Voter ID',
  ];
  List<String> documentIdList = [
    'VOT67789',
    'VOT67789',
    'VOT67789',
    'VOT67789',
    'VOT67789',
    'VOT67789',
    'VOT67789',
    'VOT67789',
  ];

  List<String> expiryDateList = [
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
    '12/12/2024',
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(30)),
      child: Column(
        children: [
          ///Documents layout
          
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
                child: Text(
                  'Documents',
                  style: leaveDetailsTitleLabelStyle,
                ),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(20),
          ),
         Padding(
           padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(18)),
           child: CustomNonScrollableTable(
                visible: false,
                scrollController: documentDetailsTableController,
                slidingIndicatorPosition: documentDetailsTableIndicatorPosition,
                tableDataWidgets: List.generate(documentsList.length, (index) {
                  return InkWell(
                    onTap: () {
                      inventoryProductBottomSheet(context);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width:double.infinity,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(70),
                                    child: Center(
                                      child: Text(
                                        documentsList[index],
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
                                    width: AppScreenUtil().screenWidth(85),
                                    child: Center(
                                      child: Text(documentIdList[index],
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
                                    width: AppScreenUtil().screenWidth(70),
                                    child: Center(
                                      child:  Text(expiryDateList[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                tableRowWidth: double.infinity,
                titleWidgets: [
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(70),
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
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Documents ID',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Expiry Date',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
         ),
        ],
      ),
    );
  }
}

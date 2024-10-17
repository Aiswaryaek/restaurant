import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/sub_inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_table_layout.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

import '../../../../../../../../user_app/widgets/custom_button.dart';

class LoanDetailsTab extends StatefulWidget {
  const LoanDetailsTab({super.key});

  @override
  State<LoanDetailsTab> createState() => _LoanDetailsTabState();
}

class _LoanDetailsTabState extends State<LoanDetailsTab> {
  String? _selectedItem;

  final List<String> _dropdownItems = ['01', '02', '03'];
  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(12),
  );
  final dateinput = TextEditingController();
  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());
  ScrollController loanDetailsTableController = ScrollController();
  double loanDetailsIndicatorPosition = 0.0;
  @override
  void initState() {
    loanDetailsTableController.addListener(() {
      setState(() {
        loanDetailsIndicatorPosition = (loanDetailsTableController.offset /
                loanDetailsTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    loanDetailsTableController.dispose();
    super.dispose();
  }
///These lists are used only for testing purpose
  List<String> loanIdList = [
    '09/01/2024',
    '09/01/2024',
    '09/01/2024',
    '09/01/2024',
    '09/01/2024',
    '09/01/2024',
    '09/01/2024',
    '09/01/2024',
  ];
  List<String> loanAmountList = [
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
    '100000',
  ];

  List<String> interestRateList = [
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
    '5%',
  ];
  List<String> tenureList = [
    'lorem',
    'lorem',
    'lorem',
    'lorem',
    'lorem',
    'lorem',
    'lorem',
    'lorem',
  ];
///Table alternate colors
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppScreenUtil().screenHeight(34)),
      child: Column(
        children: [
          ///Button
          Padding(
            padding: EdgeInsets.only(right: AppScreenUtil().screenWidth(18)),
            child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    manageEmployeCtrl.manageEmployeeDrawerTappedItem.value =
                        'Apply for Loan';
                  },
                  child: CustomButton(
                      buttonHeight: AppScreenUtil().screenHeight(18),
                      buttonWidth: AppScreenUtil().screenWidth(79),
                      buttonColor: redColor,
                      borderRadius: 4,
                      buttonText: 'Apply for Loan',
                      buttonLabelStyle:
                          employeeDashBoardPersonalInfoTabUpdateButtonLabelStyle),
                )),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(17),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(18)),
            child: EmployeeDashBoardTableLayout(
                visible: true,
                scrollController: loanDetailsTableController,
                slidingIndicatorPosition: loanDetailsIndicatorPosition,
                tableDataWidgets: List.generate(loanIdList.length, (index) {
                  return InkWell(
                    onTap: () {
                      ///Bottom sheet layout
                      inventoryProductBottomSheet(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(480),
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child: Text(
                                        loanIdList[index],
                                        style: dashBoardTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(80),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Container(
                                     color: Colors.transparent,
                                     width: AppScreenUtil().screenWidth(80),
                                     child: Center(
                                       child:  Text(loanAmountList[index],
                                           style: dashBoardTextStyle,
                                           maxLines: 1,
                                           overflow: TextOverflow.ellipsis),
                                     ),
                                   )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child:  Text(
                                        interestRateList[index],
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
                                    width: AppScreenUtil().screenWidth(80),
                                    child: Center(
                                      child:  Text(tenureList[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 3),
                                        width: AppScreenUtil().screenWidth(60),
                                        height:
                                            AppScreenUtil().screenHeight(18),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                loanDetailsStatusButtonColor),
                                        child: Text(
                                          'Pending',
                                          style: cartSelectedTabLabelTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                tableRowWidth: 480,
                titleWidgets: [
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Loan ID',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Loan Amount',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Interest Rate',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                      color: Colors.transparent,
                      width: AppScreenUtil().screenWidth(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tenure',
                            style: tableTitleLabelStyle,
                            maxLines: 1,
                          ),
                        ],
                      )),
                  Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(80),
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
                ]),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/common_drop_down_with_title.dart';
import '../../../../../widgets/custom_text_field_with_date.dart';
import '../../../../../widgets/custom_text_field_with_title.dart';
import '../../../../../widgets/product_table.dart';
import 'add_leave_type.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  final List<String> _leaveOptions = ['Half Day', 'Full Day'];
  String? selectedLeaveOptions = 'Half Day';
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final noteController = TextEditingController();
  final noOfDaysController = TextEditingController();
  ScrollController leaveTableController = ScrollController();
  double leaveIndicatorPosition = 0.0;
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  bool onTapped = false;
  List<String> name = [
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
    'EMp12 - Vaishak',
  ];
  List<String> leaveType = [
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
    'Sick Leave',
  ];
  List<String> paidOrUnpaid = [
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
    'Paid Leave',
  ];
  List<String> from = [
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
  ];
  List<String> to = [
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
    '24/08/2023',
  ];
  List<String> noOfDays = [
    '8 Hours',
    '8 Hours',
    '8 Hours',
    '8 Hours',
    '8 Hours',
    '8 Hours',
    '8 Hours',
    '8 Hours',
    '8 Hours',
  ];
  List<String> status = [
    'Pending',
    'Approved',
    'Rejected',
    'Pending',
    'Approved',
    'Rejected',
    'Pending',
    'Approved',
    'Rejected',
  ];

  @override
  void initState() {
    leaveTableController.addListener(() {
      setState(() {
        leaveIndicatorPosition = (leaveTableController.offset /
                leaveTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    leaveTableController.dispose();
    super.dispose();
  }

  dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: confirmColor,
              onPrimary: whiteColor,
              onSurface: blackColor,
            ),
            // textTheme: TextTheme(
            //   overline: xlTextStyle,
            //   bodyText1: xlTextStyle,
            //   subtitle1: xlTextStyle,
            //   subtitle2: xlTextStyle,
            //   caption: xlTextStyle,
            // ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: blackColor, textStyle: xlTextStyle),
            ),
            inputDecorationTheme:
                InputDecorationTheme(labelStyle: xlTextStyle // Input label
                    ),
          ),
          child: child!,
        );
      },
    );

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

  @override
  Widget build(BuildContext context) {
    return onTapped == false
        ? Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Employee',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child: CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Leave Type',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(3),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              onTapped = true;
                            });
                          },
                          child: Text(
                            'Add Leave Type',
                            style: mainRedTextStyle,
                          ),
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: CommonDropDownWithTitle(
                          dropDownItems: _dropdownItems,
                          title: 'Paid/Unpaid',
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                        )),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                            child: CustomTextFieldWithDate(
                          controller: fromDateController,
                          title: 'From',
                          onTap: () async {
                            dateSelection(controller: fromDateController);
                          },
                        )),
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextFieldWithDate(
                          controller: fromDateController,
                          title: 'To',
                          onTap: () async {
                            dateSelection(controller: fromDateController);
                          },
                        )),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                          child: CustomTextFieldWithTitle(
                              controller: noOfDaysController,
                              title: 'No. of Days'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(14),
                    ),
                    Text(
                      'Note (Optional)',
                      style: bookedTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: searchTextColor,
                              offset: Offset(0, 0),
                              blurRadius: 1.5,
                            ),
                          ]),
                      child: SizedBox(
                          height: 89,
                          child: TextField(
                            controller: noteController,
                            maxLines: 10,
                            style: searchInputTextStyle,
                            cursorColor: whiteColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              hintStyle: placeholderTextStyle,
                              fillColor: blackColor,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: whiteColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 20, 25, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: payslipGridContainerColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date Request Includes',
                            style: dateRequestTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(13),
                          ),
                          Text(
                            'Leave Dates',
                            style: xlTextStyle,
                          ),
                          Divider(
                            color: subDividerColor.withOpacity(0.5),
                            thickness: 0.5,
                          ),
                          Transform.translate(
                            offset: Offset(0, -10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '15/01/2024',
                                    style: xlTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Transform.translate(
                                    offset: Offset(24, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 20),
                                        value: selectedLeaveOptions,
                                        items: _leaveOptions.map((String item) {
                                          return DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: Text(
                                                  item,
                                                  style: leaveTextStyle,
                                                ),
                                              ));
                                        }).toList(),
                                        hint: Text(
                                          selectedLeaveOptions!,
                                          style: leaveTextStyle,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedLeaveOptions =
                                                newValue ?? "";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: dropdownTextColor,
                                        ),
                                        iconSize: 18,
                                        isExpanded: false,
                                        underline:
                                            const SizedBox(), // Removes the default underline
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '16/01/2024',
                                    style: xlTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Transform.translate(
                                    offset: Offset(24, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 20),
                                        value: selectedLeaveOptions,
                                        items: _leaveOptions.map((String item) {
                                          return DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: Text(
                                                  item,
                                                  style: leaveTextStyle,
                                                ),
                                              ));
                                        }).toList(),
                                        hint: Text(
                                          selectedLeaveOptions!,
                                          style: leaveTextStyle,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedLeaveOptions =
                                                newValue ?? "";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: dropdownTextColor,
                                        ),
                                        iconSize: 18,
                                        isExpanded: false,
                                        underline:
                                            const SizedBox(), // Removes the default underline
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '17/01/2024',
                                    style: xlTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Transform.translate(
                                    offset: Offset(24, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 20),
                                        value: selectedLeaveOptions,
                                        items: _leaveOptions.map((String item) {
                                          return DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: Text(
                                                  item,
                                                  style: leaveTextStyle,
                                                ),
                                              ));
                                        }).toList(),
                                        hint: Text(
                                          selectedLeaveOptions!,
                                          style: leaveTextStyle,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedLeaveOptions =
                                                newValue ?? "";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: dropdownTextColor,
                                        ),
                                        iconSize: 18,
                                        isExpanded: false,
                                        underline:
                                            const SizedBox(), // Removes the default underline
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -55),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '18/01/2024',
                                    style: xlTextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Transform.translate(
                                    offset: Offset(24, 0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: DropdownButton<String>(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 20),
                                        value: selectedLeaveOptions,
                                        items: _leaveOptions.map((String item) {
                                          return DropdownMenuItem<String>(
                                              value: item,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: Text(
                                                  item,
                                                  style: leaveRedTextStyle,
                                                ),
                                              ));
                                        }).toList(),
                                        hint: Text(
                                          selectedLeaveOptions!,
                                          style: leaveRedTextStyle,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedLeaveOptions =
                                                newValue ?? "";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: loanRedTextColor,
                                        ),
                                        iconSize: 18,
                                        isExpanded: false,
                                        underline:
                                            const SizedBox(), // Removes the default underline
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -40),
                            child: Text(
                              '12 Days of Sick Leave',
                              style: subCategoryTextStyle,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -32),
                            child: Text(
                              '9.5 days remaining*',
                              style: leaveSubTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 40),
                child: DefaultProductTable(
                    visible: false,
                    scrollController: leaveTableController,
                    slidingIndicatorPosition: leaveIndicatorPosition,
                    tableDataWidgets: List.generate(name.length, (index) {
                      return InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: AppScreenUtil().screenWidth(5)),
                          child: Container(
                            height: AppScreenUtil().screenHeight(36),
                            width: AppScreenUtil().screenWidth(758),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      color: Colors.transparent,
                                      width: AppScreenUtil().screenWidth(110),
                                      child: Center(
                                        child: Text(
                                          name[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child:  Text(leaveType[index],
                                              style: dashBoardTextStyle,
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
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child: Text(paidOrUnpaid[index],
                                              style: dashBoardTextStyle,
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
                                      Container(color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(100),child: Center(
                                          child: Text(from[index],
                                              style: dashBoardTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                        ),)
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child: Text(to[index],
                                              style: dashBoardTextStyle,
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
                                        width: AppScreenUtil().screenWidth(100),
                                        child: Center(
                                          child:  Text(noOfDays[index],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 2),
                                              width: AppScreenUtil()
                                                  .screenWidth(65),
                                              height: AppScreenUtil()
                                                  .screenHeight(18),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: status[index] ==
                                                        'Approved'
                                                    ? runningButtonColor
                                                        .withOpacity(0.7)
                                                    : status[index] == 'Pending'
                                                        ? expiredButtonColor
                                                            .withOpacity(0.55)
                                                        : status[index] ==
                                                                'Rejected'
                                                            ? cancelButtonColor
                                                                .withOpacity(
                                                                    0.7)
                                                            : disbursementButtonColor
                                                                .withOpacity(
                                                                    0.8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  status[index],
                                                  style:
                                                      inventoryCreateButtonLabelStyle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                        onTap: () {},
                      );
                    }),
                    tableRowWidth: 758,
                    titleWidgets: [
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(110),
                          child: Center(
                            child: Text(
                              'Name',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(100),
                            child: Center(
                              child:  Text(
                                'Leave Type',
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
                          child: Center(
                            child: Text(
                              'Paid/Unpaid',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          )),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(100),
                          child: Center(
                            child: Text(
                              'From',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          )),
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
                                'No. of Days',
                                style: tableTitleLabelStyle,
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                          color: Colors.transparent,
                          width: AppScreenUtil().screenWidth(110),
                          child: Center(
                            child: Text(
                              'Status',
                              style: tableTitleLabelStyle,
                              maxLines: 1,
                            ),
                          )),
                    ]),
              )
            ],
          )
        : AddLeaveType();
  }
}

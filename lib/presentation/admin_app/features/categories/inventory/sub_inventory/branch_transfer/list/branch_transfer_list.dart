// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/product_table.dart';

class BranchTransferList extends StatefulWidget {
  const BranchTransferList({super.key});

  @override
  State<BranchTransferList> createState() => _BranchTransferListState();
}

class _BranchTransferListState extends State<BranchTransferList> {
  ScrollController branchTransferTableController = ScrollController();
  double branchTransferIndicatorPosition = 0.0;
  List<String> date = [
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023',
    '23/02/2023'
  ];
  List<String> name = [
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika',
    'Deepika'
  ];

  List<String> from = [
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode',
    'Kozhikode'
  ];
  List<String> to = [
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur',
    'Kannur'
  ];
  List<String> contact = [
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675',
    '8785675675'
  ];
  List<String> grn = [
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
  List<String> created = [
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid'
  ];
  List<String> status = [
    'Available',
    'Cancel',
    'Available',
    'Cancel',
    'Available',
    'Cancel',
    'Available',
    'Cancel',
    'Cancel',
    'Available',
    'Cancel'
  ];
  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];
  final productNameController = TextEditingController();
  final nativeNameController = TextEditingController();

  @override
  void initState() {
    branchTransferTableController.addListener(() {
      setState(() {
        branchTransferIndicatorPosition =
            (branchTransferTableController.offset /
                    branchTransferTableController.position.maxScrollExtent) *
                AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    branchTransferTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: DefaultProductTable(
                visible: true,
                scrollController: branchTransferTableController,
                slidingIndicatorPosition: branchTransferIndicatorPosition,
                tableDataWidgets: List.generate(date.length, (index) {
                  return InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: AppScreenUtil().screenWidth(5)),
                      child: Container(
                        height: AppScreenUtil().screenHeight(36),
                        width: AppScreenUtil().screenWidth(873),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: tableDataAlternateColor[
                              index % tableDataAlternateColor.length],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(5)),
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
                                        date[index],
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
                                    width: AppScreenUtil().screenWidth(120),
                                    child: Center(
                                      child: Text(name[index],
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
                                    width: AppScreenUtil().screenWidth(105),
                                    child: Center(
                                      child: Text(
                                        from[index],
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
                                    width: AppScreenUtil().screenWidth(105),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: AppScreenUtil().screenWidth(105),
                                    child: Center(
                                      child: Text(contact[index],
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
                                    width: AppScreenUtil().screenWidth(105),
                                    child: Center(
                                      child: Text(grn[index],
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
                                    width: AppScreenUtil().screenWidth(115),
                                    child: Center(
                                      child: Text(created[index],
                                          style: dashBoardTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  color: Colors.transparent,
                                  width: AppScreenUtil().screenWidth(75),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 3),
                                        width: AppScreenUtil().screenWidth(60),
                                        height:
                                            AppScreenUtil().screenHeight(18),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: status[index] == 'Cancel'
                                              ? buttonCancelColor
                                                  .withOpacity(0.5)
                                              : buttonAvailableColor
                                                  .withOpacity(0.5),
                                        ),
                                        child: Text(
                                          status[index],
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
                    onTap: () {},
                  );
                }),
                tableRowWidth: 873,
                titleWidgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: AppScreenUtil().screenWidth(80),
                        child: Center(
                          child: Text(
                            'Date',
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
                        width: AppScreenUtil().screenWidth(120),
                        child: Center(
                          child: Text(
                            'Name',
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
                        width: AppScreenUtil().screenWidth(105),
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
                        width: AppScreenUtil().screenWidth(105),
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
                        width: AppScreenUtil().screenWidth(105),
                        child: Center(
                          child: Text(
                            'Contact',
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
                        width: AppScreenUtil().screenWidth(105),
                        child: Center(
                          child: Text(
                            'GRN',
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
                        width: AppScreenUtil().screenWidth(115),
                        child: Center(
                          child: Text(
                            'Created By',
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
                        width: AppScreenUtil().screenWidth(75),
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
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../../../styles/colors.dart';
import '../../../../../../../../styles/textstyles.dart';
import '../../../../../../../../utiles/app_screen_util.dart';
import '../../../../../../widgets/outlined_table.dart';

class SequenceList extends StatefulWidget {
  const SequenceList({super.key});

  @override
  State<SequenceList> createState() => _SequenceListState();
}

class _SequenceListState extends State<SequenceList> {
  ScrollController sequenceController = ScrollController();

  List<String>sequenceName= [
    'Purchase Order',
    'Sales Order',
    'Goods Received Note',
    'Delivery Note',
    'Payroll',
    'Recurring Posting',
    'Inventory Adjustment',
    'Landed Cost',
    'Depreciation',
    'Bank Reconciliation'
  ];
  List<String>sequenceNo= [
    'PO01',
    'SO01',
    'GRN01',
    'DN01',
    'PRL01',
    'RP01',
    'INA01',
    'LC01',
    'DP01',
    'BR01'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18,top: 10),
          child: OutLinedTable(
              visible: false,
              scrollController: sequenceController,
              tableHeight: MediaQuery.of(context).size.height / 2,
              tableDataWidgets: List.generate(sequenceName.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(38),
                    width: AppScreenUtil().screenWidth(325),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: searchTextColor.withOpacity(0.15)),
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
                                width: AppScreenUtil().screenWidth(105),
                                child: Center(
                                  child:  Text(
                                    sequenceName[index],
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
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child:  Text(sequenceNo[index],
                                      style: tableSubTitleLabelStyle,
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
                  onTap: () {
                    // bottomBar(context);
                  },
                );
              }),
              tableRowWidth: 325,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(105),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sequence Name',
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
                          'Sequence No.',
                          style: tableTitleLabelStyle,
                          maxLines: 1,
                        ),
                      ],
                    )),
              ]),
        ),
      ],
    );
  }
}

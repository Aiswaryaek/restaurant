// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../../utiles/app_screen_util.dart';
import '../../../../../widgets/colored_dropdown.dart';
import '../../../../../widgets/outlined_table.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;
  ScrollController logController = ScrollController();

  List<String>dateTime=[
    '12-09-2024 09:00am',
    '12-09-2024 09:00am',
    '12-09-2024 09:00am',
    '12-09-2024 09:00am',
    '12-09-2024 09:00am',
    '12-09-2024 09:00am',
  ];
  List<String>name=[
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
    'Munshid',
  ];
  List<String>type=[
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
    'Lorem',
  ];
  List<String>description=[
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
    'Lorem ipsum',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: AppScreenUtil().screenWidth(165),
                  child: ColoredDropDown(isVisible: true,
                    dropDownItems: _dropdownItems,
                    title: 'Branch',
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: OutLinedTable(
              visible: false,
              scrollController: logController,
              // tableHeight: MediaQuery.of(context).size.height / 2,
              tableDataWidgets: List.generate(dateTime.length, (index) {
                return InkWell(
                  child: Container(
                    height: AppScreenUtil().screenHeight(38),
                    width: AppScreenUtil().screenWidth(428),
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
                                width: AppScreenUtil().screenWidth(95),
                                child: Text(
                                  dateTime[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: AppScreenUtil().screenWidth(95),
                              child: Center(
                                child: Text(name[index],
                                    style: tableSubTitleLabelStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child:  Text(type[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: AppScreenUtil().screenWidth(100),
                                child: Center(
                                  child: Text(description[index],
                                      style: tableSubTitleLabelStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
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
              tableRowWidth: 428,
              titleWidgets: [
                Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date & Time',
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
                    )),
                Container(
                    color: Colors.transparent,
                    width: AppScreenUtil().screenWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Type',
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
                        'Description',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
        SizedBox(height: AppScreenUtil().screenHeight(30),),
      ],
    );
  }
}

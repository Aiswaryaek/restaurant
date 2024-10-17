import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/Custom_drop_down_button.dart';
import 'package:restaurant/presentation/admin_app/widgets/branch_settings_table_layout.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_textform_field_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/inventory_table_layout_without_scroll.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class BranchSettings extends StatefulWidget {
  const BranchSettings({super.key});

  @override
  State<BranchSettings> createState() => _BranchSettingsState();
}

class _BranchSettingsState extends State<BranchSettings> {
  final List<String> dropDownItems = [
    '012',
    '013',
    '014',
    '015',
  ];
  String selectedDropDown = '012';
  final SizedBox height18 = SizedBox(
    height: AppScreenUtil().screenHeight(18),
  );
    ScrollController branchSettingsCreateTableController = ScrollController();
  double branchSettingsCreateIndicatorPosition = 0.0;
  List<String> typeList = [
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash',
    'Cash'
  ];


  List<String> journalList = [
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

  List<Color> tableDataAlternateColor = [
    adminDashBoardTableAlternateColor.withOpacity(0.05),
    constantWhite,
  ];


  @override
  void initState() {
    branchSettingsCreateTableController.addListener(() {
      setState(() {
        branchSettingsCreateIndicatorPosition = (branchSettingsCreateTableController.offset /
                branchSettingsCreateTableController.position.maxScrollExtent) *
            AppScreenUtil().screenWidth(110);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    branchSettingsCreateTableController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: AppScreenUtil().screenWidth(16),right: AppScreenUtil().screenWidth(16),bottom: AppScreenUtil().screenWidth(20) ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomDropDownButton(
                  titleLabelStyle: posSettingsSubTitleStyle(null),
                  title: 'Branch*',
                  value: selectedDropDown,
                  dropdownItems: dropDownItems,
                  onChanged: (v) {
                    selectedDropDown = v.toString();
                    setState(() {});
                  },
                  iconColor: posSettingsSubTitleLabelColor,
                ),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              Expanded(
                flex: 1,
                child: CustomDropDownButton(
                  titleLabelStyle: posSettingsSubTitleStyle(null),
                  title: 'Location*',
                  value: selectedDropDown,
                  dropdownItems: dropDownItems,
                  onChanged: (v) {
                    selectedDropDown = v.toString();
                    setState(() {});
                  },
                  iconColor: posSettingsSubTitleLabelColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(13),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomDropDownButton(
                  titleLabelStyle: posSettingsSubTitleStyle(null),
                  title: 'Price List*',
                  value: selectedDropDown,
                  dropdownItems: dropDownItems,
                  onChanged: (v) {
                    selectedDropDown = v.toString();
                    setState(() {});
                  },
                  iconColor: posSettingsSubTitleLabelColor,
                ),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              Expanded(
                flex: 1,
                child: CustomDropDownButton(
                  titleLabelStyle: posSettingsSubTitleStyle(null),
                  title: 'Default Tax',
                  value: selectedDropDown,
                  dropdownItems: dropDownItems,
                  onChanged: (v) {
                    selectedDropDown = v.toString();
                    setState(() {});
                  },
                  iconColor: posSettingsSubTitleLabelColor,
                ),
              ),
            ],
          ),
          SizedBox(height: AppScreenUtil().screenHeight(17)),
          Text(
            'Sequence',
            style: branchSettingsSequenceLabelStyle,
          ),
          SizedBox(height: AppScreenUtil().screenHeight(19)),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Branch Transfer',
                style: posSettingsSubTitleStyle(null),
              )),
          SizedBox(height: AppScreenUtil().screenHeight(15)),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Prefix*'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(
                    textFieldTitle: 'Sequence Size'),
              ),
            ],
          ),
          height18,
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Next No'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Sequence'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(23),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Internal Transfer',
                style: posSettingsSubTitleStyle(null),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(11),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Prefix*'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(
                    textFieldTitle: 'Sequence Size'),
              ),
            ],
          ),
          height18,
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Next No'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Sequence'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Workorder',
                style: posSettingsSubTitleStyle(null),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(11),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Prefix*'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(
                    textFieldTitle: 'Sequence Size'),
              ),
            ],
          ),
          height18,
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Next No'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Sequence'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Billing',
                style: posSettingsSubTitleStyle(null),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(11),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Prefix*'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(
                    textFieldTitle: 'Sequence Size'),
              ),
            ],
          ),
          height18,
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Next No'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Sequence'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Payment',
                style: posSettingsSubTitleStyle(null),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(11),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Prefix*'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(
                    textFieldTitle: 'Sequence Size'),
              ),
            ],
          ),
          height18,
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Next No'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Sequence'),
              ),
            ],
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(15),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Alteration',
                style: posSettingsSubTitleStyle(null),
              )),
          SizedBox(
            height: AppScreenUtil().screenHeight(11),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Prefix*'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(
                    textFieldTitle: 'Sequence Size'),
              ),
            ],
          ),
          height18,
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Next No'),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
              const Expanded(
                flex: 1,
                child: CustomTextFormFieldWithTitle(textFieldTitle: 'Sequence'),
              ),
            ],
          ),
          height18,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: CustomDropDownButton(
                  titleLabelStyle: posSettingsSubTitleStyle(blackColor),
                  title: 'Type*',
                  value: selectedDropDown,
                  dropdownItems: dropDownItems,
                  onChanged: (v) {
                    selectedDropDown = v.toString();
                    setState(() {});
                  },
                  iconColor: posSettingsSubTitleLabelColor,
                ),
              ),
              SizedBox(
                width: AppScreenUtil().screenWidth(25),
              ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    Expanded(
                      flex: 125,
                      child: CustomDropDownButton(
                      titleLabelStyle: posSettingsSubTitleStyle(blackColor),
                      title: 'Journal*',
                      value: selectedDropDown,
                      dropdownItems: dropDownItems,
                      onChanged: (v) {
                        selectedDropDown = v.toString();
                        setState(() {});
                      },
                      iconColor: posSettingsSubTitleLabelColor,
                                        ),
                    ),
                  SizedBox(width: AppScreenUtil().screenWidth(6),),
                  Expanded(
                    flex: 27,
                    child: Container(
                      height: AppScreenUtil().screenHeight(30),
                      decoration: BoxDecoration(color:branchSettingsPlusButtonColor ,borderRadius: BorderRadius.circular(5),boxShadow:const [BoxShadow(color:payTemplateListShadow ,offset:  Offset(0, 0),blurRadius: 15,)]),
                      child:const Center(child: Icon(Icons.add,color: whiteColor,),),
                      ),
                  )
              ],),
            ),
          )
            ],
          ),
SizedBox(height: AppScreenUtil().screenHeight(15),),
        BranchSettingsTableLayout(

            tableDataWidgets: List.generate(typeList.length, (index) {
              return InkWell(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: AppScreenUtil().screenWidth(5)),
                  child: Container(
                    height: AppScreenUtil().screenHeight(28),
                    width: AppScreenUtil().screenWidth(350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: tableDataAlternateColor[
                          index % tableDataAlternateColor.length],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  typeList[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )),
                       
                        Container(
                            color: Colors.transparent,
                            width: AppScreenUtil().screenWidth(90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  journalList[index],
                                  style: tableSubTitleLabelStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                },
              );
            }),
            tableRowWidth: 350,
            titleWidgets: [
              Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Type',
                      style: tableTitleLabelStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
          
              Container(
                  color: Colors.transparent,
                  width: AppScreenUtil().screenWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Journal',
                        style: tableTitleLabelStyle,
                        maxLines: 1,
                      ),
                    ],
                  )),
            ])
        ],
      ),
    );
  }
}

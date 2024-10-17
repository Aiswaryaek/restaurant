// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/sub_settings.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../models/product_categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/app_screen_util.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int? tappedSettings;
  final settings = <ProductCategoriesModel>[];
  dynamic currentTab;

  @override
  void initState() {
    settings.add(ProductCategoriesModel(
        'Change Password', ImageCons.imgChangePassword));
    settings.add(ProductCategoriesModel(
        'Company Settings', ImageCons.imgCompanySettings));
    settings.add(ProductCategoriesModel(
        'Roles And Permission Settings', ImageCons.imgRolesAndPermissions));
    settings.add(ProductCategoriesModel('SMS Settings', ImageCons.imgSms));
    settings.add(ProductCategoriesModel('Discount', ImageCons.imgDiscount));
    settings.add(
        ProductCategoriesModel('Rewards & Points', ImageCons.imgRewardPoints));
    settings.add(ProductCategoriesModel('Utility', ImageCons.imgUtility));
    settings.add(ProductCategoriesModel('Currency', ImageCons.imgCurrency));
    settings.add(ProductCategoriesModel('Sequence', ImageCons.imgSequences));
    settings.add(ProductCategoriesModel('Tax', ImageCons.imgTax));
    settings.add(
        ProductCategoriesModel('Card & UPI Type', ImageCons.imgCardAndUpi));
    settings
        .add(ProductCategoriesModel('Aggregators', ImageCons.imgAggregators));
    settings.add(ProductCategoriesModel('Shift', ImageCons.imgShift));
    settings.add(
        ProductCategoriesModel('Report Forward', ImageCons.imgReportForward));
    settings.add(ProductCategoriesModel('Log', ImageCons.imgLog));
    settings.add(
        ProductCategoriesModel('Backup & Restore', ImageCons.imgBackUpRestore));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentTab == 'Change Password' ||
            currentTab == 'Company Settings' ||
            currentTab == 'Roles And Permission Settings' ||
            currentTab == 'SMS Settings' ||
            currentTab == 'Discount' ||
            currentTab == 'Rewards & Points' ||
            currentTab == 'Utility' ||
            currentTab == 'Currency' ||
            currentTab == 'Sequence' ||
            currentTab == 'Tax' ||
            currentTab == 'Card & UPI Type' ||
            currentTab == 'Aggregators' ||
            currentTab == 'Shift' ||
            currentTab == 'Report Forward' ||
            currentTab == 'Log' ||
            currentTab == 'Backup and Restore'
        ? SubSettings(currentTab)
        : currentTab == 'Backup & Restore'
            ? SubSettings(currentTab)
            : Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
                // height: 600,
                width: double.infinity,
                // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        tabPageLeftGradientColor,
                        tabPageRightGradientColor,
                      ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppScreenUtil().screenHeight(25),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: Offset(0, -2),
                            child: Text(
                              'Settings',
                              style: dashBoardLabelTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(35),
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 9,
                            children: List<Widget>.generate(settings.length,
                                (int index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      tappedSettings = index;
                                      currentTab = settings[index].text;
                                    });
                                    print('current Tab :$currentTab');
                                  },
                                  child: Container(
                                    width: AppScreenUtil().screenWidth(80),
                                    color: Colors.transparent,
                                    padding: EdgeInsets.only(right: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(9),
                                          height:
                                              AppScreenUtil().screenHeight(38),
                                          width:
                                              AppScreenUtil().screenWidth(47),
                                          decoration: BoxDecoration(
                                            color: tabSelectionAColor
                                                .withOpacity(0.20),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: SvgPicture.asset(
                                              settings[index].icon),
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(6),
                                        ),
                                        Center(
                                          child: Text(
                                            settings[index].text.toString(),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.fade,
                                            style:
                                                clearDataAlertYesButtonLabelStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }).toList(),
                          ),
                        ],
                      ),
                    ))
                  ],
                ));
  }
}

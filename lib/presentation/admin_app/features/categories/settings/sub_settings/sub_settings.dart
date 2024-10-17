// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/aggregators/aggregators.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/backup_and_restore.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/card_and_upi_type/card_and_upi_type.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/company_settings/view/company_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/discount/discount.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/log/log.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/rewards_and_points/rewards_and_points.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/sequence/create/sequence.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/sequence/list/sequence_list.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/shift/shift.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/sms_settings/sms_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/roles_and_permission_settings/roles_and_permission_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/tax/create/tax_create.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/tax/list/tax_screen.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/utility/utility.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../styles/colors.dart';
import '../../../../../../styles/textstyles.dart';
import '../../../../../../utiles/app_screen_util.dart';
import '../../../../../../utiles/image_constant.dart';
import '../../../../../user_app/widgets/custom_button.dart';
import 'change_password/change_password.dart';
import 'currency/controller/currency_controller.dart';
import 'currency/view/create/currency.dart';
import 'currency/view/list/currency_list.dart';

class SubSettings extends StatefulWidget {
  String tappedItem;

  SubSettings(this.tappedItem, {super.key});

  @override
  State<SubSettings> createState() => _SubSettingsState();
}

class _SubSettingsState extends State<SubSettings> {
  final CurrencyController currencyCtrl = Get.put(CurrencyController());

  bool isValidName = true;
  bool isValidSymbol = true;
  bool isValidCurrencySubUnit = true;
  bool isValidCurrencyUnit = true;
  bool isValidCurrencyCode = true;
  bool isValidUnitPerUSD = true;
  bool isValidUnitPerUnit = true;
  String datetime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return widget.tappedItem == 'Settings'
        ? Settings()
        : Column(
            children: [
              SizedBox(
                height: AppScreenUtil().screenHeight(25),
              ),
              Expanded(
                  child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppScreenUtil().screenWidth(16),
                    right: AppScreenUtil().screenWidth(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      ///Filter button
                      widget.tappedItem == 'Change Password' ||
                              widget.tappedItem == 'Company Settings' ||
                              widget.tappedItem ==
                                  'Roles And Permission Settings' ||
                              widget.tappedItem == 'SMS Settings' ||
                              widget.tappedItem == 'Discount' ||
                              widget.tappedItem == 'Rewards & Points' ||
                              widget.tappedItem == 'Utility' ||
                              widget.tappedItem == 'Tax Create' ||
                              widget.tappedItem == 'Card & UPI Type' ||
                              widget.tappedItem == 'Aggregators' ||
                              widget.tappedItem == 'Shift' ||
                              widget.tappedItem == 'Report Forward' ||
                              widget.tappedItem == 'Log' ||
                              widget.tappedItem == 'Backup and Restore' ||
                              currencyCtrl.isCurrencyCreateTapped.value == true
                          ? GestureDetector(
                              onTap: () {
                                if (currencyCtrl.isCurrencyCreateTapped.value ==
                                    true) {
                                  currencyCtrl.validateFields();
                                  currencyCtrl.saveCurrency();
                                } else {
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: confirmColor,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Transform.translate(
                                offset: Offset(0, -2),
                                child: SvgPicture.asset(
                                  ImageCons.save,
                                  height: 23,
                                  width: 12,
                                ),
                              ),
                            )
                          : Transform.translate(
                              offset: Offset(0, 5),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                height: AppScreenUtil().screenHeight(14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: reductionBottomSheetButtonColor
                                        .withOpacity(0.1)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImageCons.imgTableFilterIcon,
                                      height: 6.71,
                                      width: 10.06,
                                    ),
                                    SizedBox(
                                      width: AppScreenUtil().screenWidth(5.7),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Filter',
                                        style: mainRedTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      widget.tappedItem == 'Change Password' ||
                              widget.tappedItem == 'Company Settings' ||
                              widget.tappedItem ==
                                  'Roles And Permission Settings' ||
                              widget.tappedItem == 'SMS Settings' ||
                              widget.tappedItem == 'Discount' ||
                              widget.tappedItem == 'Rewards & Points' ||
                              widget.tappedItem == 'Utility' ||
                              widget.tappedItem == 'Tax' ||
                              widget.tappedItem == 'Card & UPI Type' ||
                              widget.tappedItem == 'Aggregators' ||
                              widget.tappedItem == 'Shift' ||
                              widget.tappedItem == 'Report Forward' ||
                              widget.tappedItem == 'Log' ||
                              widget.tappedItem == 'Backup and Restore' ||
                              currencyCtrl.isCurrencyCreateTapped.value == true
                          ? Transform.translate(
                              offset: Offset(0, -25),
                              child: Center(
                                child: Text(
                                  'Settings',
                                  style: btnTextStyle,
                                ),
                              ),
                            )
                          : Transform.translate(
                              offset: Offset(0, -17.5),
                              child: Center(
                                child: Text(
                                  'Settings',
                                  style: btnTextStyle,
                                ),
                              ),
                            ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.tappedItem = 'Settings';
                                      currencyCtrl
                                          .isCurrencyCreateTapped.value = false;
                                    });
                                  },
                                  child: Text(
                                    'Settings',
                                    style: taxCreateEnterAPassWordLabelStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(2),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: blackColor,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(4),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.tappedItem = 'Settings';
                                          currencyCtrl.isCurrencyCreateTapped
                                              .value = false;
                                        });
                                      },
                                      child: Text(
                                        widget.tappedItem == 'Currency Create'
                                            ? 'Currency'
                                            : widget.tappedItem ==
                                                    'Sequence Create'
                                                ? 'Sequence'
                                                : widget.tappedItem ==
                                                        'Tax Create'
                                                    ? 'Tax'
                                                    : widget.tappedItem,
                                        style: gridTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(15),
                                )
                              ],
                            ),
                          ),
                          widget.tappedItem == 'Change Password' ||
                                  widget.tappedItem == 'Company Settings' ||
                                  widget.tappedItem ==
                                      'Roles And Permission Settings' ||
                                  widget.tappedItem == 'SMS Settings' ||
                                  widget.tappedItem == 'Discount' ||
                                  widget.tappedItem == 'Rewards & Points' ||
                                  widget.tappedItem == 'Utility' ||
                                  widget.tappedItem == 'Card & UPI Type' ||
                                  widget.tappedItem == 'Aggregators' ||
                                  widget.tappedItem == 'Shift' ||
                                  widget.tappedItem == 'Sequence Create' ||
                                  widget.tappedItem == 'Report Forward' ||
                                  widget.tappedItem == 'Log' ||
                                  widget.tappedItem == 'Tax Create' ||
                                  widget.tappedItem == 'Backup and Restore' ||
                                  currencyCtrl.isCurrencyCreateTapped.value ==
                                      true
                              ? SizedBox()
                              : CustomButton(
                                  buttonHeight:
                                      AppScreenUtil().screenHeight(18),
                                  buttonWidth: AppScreenUtil().screenWidth(61),
                                  buttonColor: confirmColor,
                                  borderRadius: 4,
                                  buttonText: 'Create',
                                  onTap: () {
                                    setState(() {
                                      if (widget.tappedItem == 'Currency') {
                                        // widget.tappedItem = 'Currency Create';
                                        currencyCtrl.isCurrencyCreateTapped
                                            .value = true;
                                      } else if (widget.tappedItem ==
                                          'Sequence') {
                                        widget.tappedItem = 'Sequence Create';
                                      } else if (widget.tappedItem == 'Tax') {
                                        widget.tappedItem = 'Tax Create';
                                      }
                                    });
                                  },
                                  buttonLabelStyle:
                                      inventoryCreateButtonLabelStyle),
                        ],
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: widget.tappedItem == 'Company Settings'
                            ? CompanySettings()
                            : widget.tappedItem == 'SMS Settings'
                                ? SmsSettings()
                                : widget.tappedItem ==
                                        'Roles And Permission Settings'
                                    ? RolesAndPermissionSettings()
                                    : widget.tappedItem == 'Discount'
                                        ? Discount()
                                        : widget.tappedItem ==
                                                'Rewards & Points'
                                            ? RewardsAndPoints()
                                            : widget.tappedItem == 'Utility'
                                                ? Utility()
                                                : Obx(() => currencyCtrl
                                                            .isCurrencyCreateTapped
                                                            .value ==
                                                        true
                                                    ? Currency()
                                                    : widget.tappedItem ==
                                                            'Settings'
                                                        ? Settings()
                                                        : widget.tappedItem ==
                                                                'Currency'
                                                            ? CurrencyList()
                                                            : widget.tappedItem ==
                                                                    'Sequence'
                                                                ? SequenceList()
                                                                : widget.tappedItem ==
                                                                        'Sequence Create'
                                                                    ? Sequence()
                                                                    : widget.tappedItem ==
                                                                            'Change Password'
                                                                        ? ChangePassword()
                                                                        : widget.tappedItem ==
                                                                                'Card & UPI Type'
                                                                            ? CardAndUpiType()
                                                                            : widget.tappedItem == 'Aggregators'
                                                                                ? Aggregators()
                                                                                : widget.tappedItem == 'Shift'
                                                                                    ? Shift()
                                                                                    : widget.tappedItem == 'Tax'
                                                                                        ? TaxListScreen()
                                                                                        : widget.tappedItem == 'Tax Create'
                                                                                            ? TaxCreate()
                                                                                            : widget.tappedItem == 'Log'
                                                                                                ? LogPage()
                                                                                                : widget.tappedItem == 'Backup & Restore'
                                                                                                    ? BackupAndRestore()
                                                                                                    : Text('Last Item'))))
              ])),
            ],
          );
  }
}

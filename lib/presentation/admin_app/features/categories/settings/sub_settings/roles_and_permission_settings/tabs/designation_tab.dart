import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:restaurant/presentation/admin_app/widgets/colored_dropdown.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_bordered_drop_down.dart';
import 'package:restaurant/presentation/admin_app/widgets/roles_and_permission_drop_down_item.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class DesignationTab extends StatefulWidget {
  const DesignationTab({super.key});

  @override
  State<DesignationTab> createState() => _DesignationTabState();
}

class _DesignationTabState extends State<DesignationTab> {
    final dynamic settingsDropDownFixedHeight = AppScreenUtil().screenHeight(33);
  dynamic inventoryInnerDropDownItemFixedHeight =
      AppScreenUtil().screenHeight(33);

  dynamic inventoryDropDownHeight = AppScreenUtil().screenHeight(250);

  bool status = false;

  bool isInventoryProductDropDownVisible = false;
  bool isInventoryDropDownVisible = false;
  bool isSalesDropDownVisible = false;
  bool isPurchaseDropDownVisible = false;
  bool isInventoryOperationDropDownVisible = false;
  bool isInventoryConfigurationDropDownVisible = false;
  bool isPointOfSalesDropDownVisible = false;
  bool isCustomerDropDownVisible = false;
  bool isReportsDropDownVisible = false;
  bool isAccountsDropDownVisible = false;
  bool isStaffDropDownVisible = false;

  ///These Dropdown items are used only for testing purpose
  final List<String> _dropdownItems = ['01', '02', '03'];
  String? _selectedItem;

  ///Switch values
  List<bool> inventoryDropDownItemsOnTapBoolean =
      List.generate(3, (index) => false);

  List<bool> purchaseDropDownswitchValues = List.generate(8, (index) => false);
    List<bool> inventoryDropDownswitchValues = List.generate(15, (index) => false);
  List<bool> salesDropDownswitchValues = List.generate(6, (index) => false);
  List<bool> pointOfSalesDropDownswitchValues =
      List.generate(6, (index) => false);
  List<bool> customerDropDownswitchValues = List.generate(6, (index) => false);
  List<bool> reportsDropDownswitchValues = List.generate(6, (index) => false);
  List<bool> accountsDropDownswitchValues = List.generate(6, (index) => false);
  List<bool> staffDropDownswitchValues = List.generate(6, (index) => false);
  List<bool> inventoryProductsSwitchValues = List.generate(2, (index) => false);
  List<bool> inventoryOperationSwitchValues =
      List.generate(4, (index) => false);

  final List<String> inventoryInnerDropDownItems = [
    'All',
    'Product Master',
    'Product',
    'Internal Transfer',
    'Branch Transfer',
    'Branch Receipt',
    'Stock Moves',
    'Inventory Adjustment',
    'Warehouse',
    'Location',
    'Settings',
    'Attribute',
    'POS Category',
    'Category',
    'Stock Move Report'
  ];

  final List<String> purchaseDropDownTitleItems = [
    'All',
    'Request for Quotation',
    'Purchase Order',
    'Goods Received Note',
    'Unit of Measurement',
    'Vendors',
    'Configuration',
    'Purchase Report'
  ];



  String? inventorySelectedItem = 'Inventory';
  final List<String> salesDropdownItems = ['Sales', 'Loream', 'Loream1'];
  String? salesSelectedItem = 'Sales';

  String selectedTab = 'Designation';
  void purchaseOnToggle(int index) {
    print('Toggle function for Switch $index');
  }

  void handleOnTap(int index) {
    setState(() {
      inventoryDropDownItemsOnTapBoolean[index] =
          !inventoryDropDownItemsOnTapBoolean[index];

      if (index == 0) {
        inventoryDropDownItemsOnTapBoolean[index]
            ? (inventoryDropDownHeight += AppScreenUtil().screenHeight(38))
            : (inventoryDropDownHeight -= AppScreenUtil().screenHeight(38));
      } else if (index == 1) {
        inventoryDropDownItemsOnTapBoolean[index]
            ? (inventoryDropDownHeight += AppScreenUtil().screenHeight(82))
            : (inventoryDropDownHeight -= AppScreenUtil().screenHeight(82));
      }
    });
  }
  void toggleAllSwitches(bool value) {
    setState(() {
      // Toggle all switches to the specified value (true or false)
      purchaseDropDownswitchValues.fillRange(0, purchaseDropDownswitchValues.length, value);
      inventoryDropDownswitchValues.fillRange(0, inventoryDropDownswitchValues.length, value);
      salesDropDownswitchValues.fillRange(0, salesDropDownswitchValues.length, value);
      pointOfSalesDropDownswitchValues.fillRange(0, pointOfSalesDropDownswitchValues.length, value);
      customerDropDownswitchValues.fillRange(0, customerDropDownswitchValues.length, value);
      reportsDropDownswitchValues.fillRange(0, reportsDropDownswitchValues.length, value);
      accountsDropDownswitchValues.fillRange(0, accountsDropDownswitchValues.length, value);
      staffDropDownswitchValues.fillRange(0, staffDropDownswitchValues.length, value);
      inventoryProductsSwitchValues.fillRange(0, inventoryProductsSwitchValues.length, value);
      inventoryOperationSwitchValues.fillRange(0, inventoryOperationSwitchValues.length, value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredDropDown(isVisible: true,
                isTitleBold: true,
                dropDownItems: _dropdownItems,
                title: 'Designation',
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(23),
              ),
              Text(
                'Module Access',
                style: rolesAndPermissionModuleAccessTabLabelStyle,
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(18),
              ),

              ///Product Row
              Padding(
                padding:  EdgeInsets.only(left: AppScreenUtil().screenWidth(18),right: AppScreenUtil().screenWidth(13)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dashboard',
                      style: rolesAndPermissionUnSelectedTabLabelStyle,
                    ),
                    FlutterSwitch(
                      width: 36,
                      height: 16,
                      toggleSize: 11.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 2.0,
                      toggleColor: status == false ? confirmColor : greenColor,
                      switchBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      toggleBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      activeColor: whiteColor,
                      inactiveColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                          toggleAllSwitches(val);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppScreenUtil().screenWidth(18),right: AppScreenUtil().screenWidth(13)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Products',
                      style: rolesAndPermissionUnSelectedTabLabelStyle,
                    ),
                    FlutterSwitch(
                      width: 36,
                      height: 16,
                      toggleSize: 11.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 2.0,
                      toggleColor: status == false ? confirmColor : greenColor,
                      switchBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      toggleBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      activeColor: whiteColor,
                      inactiveColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                          toggleAllSwitches(val);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),

              ///Purchase dropdown

              CustomBorderedDropDown(
                isTitleBold: true,
                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isPurchaseDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(225)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Purchase',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isPurchaseDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems:
                    List.generate(purchaseDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          purchaseDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: purchaseDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: purchaseDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: purchaseDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: purchaseDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isPurchaseDropDownVisible = !isPurchaseDropDownVisible;
                  });
                },
              ),

              ///Inventory dropdown
              CustomBorderedDropDown(
                                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                isBorder: true,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(16.5),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(12),
                dropDownContainerHeight: (isInventoryDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(375)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                dropDownItem: 'Inventory',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isInventoryDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItems: List.generate(inventoryDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          inventoryDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: inventoryDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: inventoryInnerDropDownItems[index],
                      toggleBorderColor: inventoryDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: inventoryDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: inventoryDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isInventoryDropDownVisible = !isInventoryDropDownVisible;
                  });
                },
              ),

              ///Sales Dropdown
              CustomBorderedDropDown(
                                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isSalesDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(175)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Sales',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isSalesDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems:
                    List.generate(salesDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          salesDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: salesDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: salesDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: salesDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: salesDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isSalesDropDownVisible = !isSalesDropDownVisible;
                  });
                },
              ),
              ///Food Management dropdown
              CustomBorderedDropDown(
                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isCustomerDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(175)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Food Management',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                (isCustomerDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems:
                List.generate(customerDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          customerDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: customerDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: customerDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: customerDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: customerDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isCustomerDropDownVisible = !isCustomerDropDownVisible;
                  });
                },
              ),

              ///Point of sales dropdown
              CustomBorderedDropDown(
                                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isPointOfSalesDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(175)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Point of Sales',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isPointOfSalesDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems: List.generate(
                    pointOfSalesDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          pointOfSalesDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: pointOfSalesDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: pointOfSalesDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: pointOfSalesDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: pointOfSalesDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isPointOfSalesDropDownVisible =
                        !isPointOfSalesDropDownVisible;
                  });
                },
              ),


              ///Reports dropdown
              CustomBorderedDropDown(
                                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isReportsDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(175)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Reports',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isReportsDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems:
                    List.generate(reportsDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          reportsDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: reportsDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: reportsDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: reportsDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: reportsDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isReportsDropDownVisible = !isReportsDropDownVisible;
                  });
                },
              ),

              ///Accounts dropdown
              CustomBorderedDropDown(
                                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isAccountsDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(175)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Accounts',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isAccountsDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems:
                    List.generate(accountsDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          accountsDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: accountsDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: accountsDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: accountsDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: accountsDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isAccountsDropDownVisible = !isAccountsDropDownVisible;
                  });
                },
              ),

              ///Staff dropdown
              CustomBorderedDropDown(
                                isTitleBold: true,

                titleLeftPadding: 18.0,
                titleRightPadding: 13.0,
                dropDownContainerHeight: (isStaffDropDownVisible == true)
                    ? AppScreenUtil().screenHeight(175)
                    : settingsDropDownFixedHeight,
                borderColor: rolesAndPermissionsDropDownBorderColor,
                isBorder: true,
                dropDownItem: 'Staff',
                physics: NeverScrollableScrollPhysics(),
                dropDownContainerColor: Colors.transparent,
                dropDownItemOpacity:
                    (isStaffDropDownVisible == true) ? 1.0 : 0.0,
                dropDownItemLeftPadding: AppScreenUtil().screenWidth(18),
                dropDownItemRightPadding: AppScreenUtil().screenWidth(13),
                dropDownItemTopPadding: AppScreenUtil().screenHeight(10),
                dropDownItems:
                    List.generate(staffDropDownswitchValues.length, (index) {
                  return RolesAndPermissionDropDownItem(
                      activeColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          staffDropDownswitchValues[index] = val;

                          purchaseOnToggle(index);
                        });
                      },
                      inActiveColor: whiteColor,
                      switchBorderColor: staffDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      itemName: purchaseDropDownTitleItems[index],
                      toggleBorderColor: staffDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      toggleColor: staffDropDownswitchValues[index]
                          ? greenColor : confirmColor,
                      value: staffDropDownswitchValues[index]);
                }),
                onTap: () {
                  setState(() {
                    isStaffDropDownVisible = !isStaffDropDownVisible;
                  });
                },
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppScreenUtil().screenWidth(18),right: AppScreenUtil().screenWidth(13)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Device Settings',
                      style: rolesAndPermissionUnSelectedTabLabelStyle,
                    ),
                    FlutterSwitch(
                      width: 36,
                      height: 16,
                      toggleSize: 11.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 2.0,
                      toggleColor: status == false ? confirmColor : greenColor,
                      switchBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      toggleBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      activeColor: whiteColor,
                      inactiveColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                          toggleAllSwitches(val);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppScreenUtil().screenHeight(12),
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppScreenUtil().screenWidth(18),right: AppScreenUtil().screenWidth(13)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Generate QR/Barcode',
                      style: rolesAndPermissionUnSelectedTabLabelStyle,
                    ),
                    FlutterSwitch(
                      width: 36,
                      height: 16,
                      toggleSize: 11.0,
                      value: status,
                      borderRadius: 30.0,
                      padding: 2.0,
                      toggleColor: status == false ? confirmColor : greenColor,
                      switchBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      toggleBorder: Border.all(
                        color: status == false ? confirmColor : greenColor,
                        width: 1,
                      ),
                      activeColor: whiteColor,
                      inactiveColor: whiteColor,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                          toggleAllSwitches(val);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
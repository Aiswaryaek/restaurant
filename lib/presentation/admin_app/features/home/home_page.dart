// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:get/instance_manager.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/models/categories_model.dart';
import 'package:restaurant/presentation/admin_app/features/categories/accounts/accounts.dart';
import 'package:restaurant/presentation/admin_app/features/categories/dash_board/admin_dash_board.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/presentation/admin_app/features/categories/device_settings/device_settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/generate_qr/generate_qr.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/inventory.dart';
import 'package:restaurant/presentation/admin_app/features/categories/payroll/payroll.dart';
import 'package:restaurant/presentation/admin_app/features/categories/point_of_sale/point_of_sale.dart';
import 'package:restaurant/presentation/admin_app/features/categories/product_list/product_list_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/purchase/purchase.dart';
import 'package:restaurant/presentation/admin_app/features/categories/sales/sales.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/settings.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/staff.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/controller/add_employe_controller.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/manage_employee/controller/manage_employee_controller.dart';
import 'package:restaurant/presentation/admin_app/widgets/employee_dash_board_drawer.dart';
import 'package:restaurant/presentation/admin_app/widgets/tab_grid_view_items.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';
import 'package:restaurant/routes/index.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../user_app/widgets/top_categories_card.dart';
import '../categories/food_management/food_management.dart';
import '../categories/inventory/sub_inventory/inventory_stock_moves/stock_moves_controller.dart';
import '../categories/point_of_sale/sub_pos/floor_management/floor_management_controller.dart';
import '../categories/point_of_sale/sub_pos/floor_management/floor_management_left_menu.dart';
import '../categories/staff/sub_staff/add_employee/drawer/add_employee_drawer.dart';
import 'controller/home_controller.dart';

dynamic item = 'Dashboard';
double tabItemContainerHeight = AppScreenUtil().screenHeight(75);

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final searchKeywordController = TextEditingController();
  final items = <CategoriesModel>[];
  final gridItems = <CategoriesModel>[];

  double _topContainerHeight = AppScreenUtil().screenHeight(96);
  double expandedHeight = AppScreenUtil().screenHeight(470);
  double reductionHeight = AppScreenUtil().screenHeight(96);
  double finiteHeight = double.infinity;
  double _bottomContainerHeight = double.infinity;
  double _containerPosition = 0.0;
  bool isContainerVisible = true;

  void _toggleHeight() {
    setState(() {
      _topContainerHeight = _topContainerHeight == reductionHeight
          ? expandedHeight
          : reductionHeight;
    });
  }

  void reduceTopContainerHeight() {
    setState(() {
      _topContainerHeight = reductionHeight;
    });
  }

  void toggleVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
      if (isContainerVisible == false) {
        _topContainerHeight = 0;
        tabItemContainerHeight = 0;
        Future.delayed(Duration(milliseconds: 500), () {
          isContainerVisible = false;
        });
      } else {
        _topContainerHeight = AppScreenUtil().screenHeight(96);
        tabItemContainerHeight = AppScreenUtil().screenHeight(75);
        Future.delayed(Duration(milliseconds: 500), () {
          isContainerVisible = true;
        });
      }
    });
  }

  void nonVisible() {
    print('Not draggable');
  }

  final SizedBox constHeight = SizedBox(
    height: AppScreenUtil().screenHeight(25),
  );
  final ManageEmployeeController manageEmployeCtrl =
      Get.put(ManageEmployeeController());
  final FloorManagementLeftMenuController floorLeftEMenuCtrl =
      Get.put(FloorManagementLeftMenuController());
  final StockMovesController stockMovesCtrl = Get.put(StockMovesController());
  final AdminHomeController adminHomeController =
      Get.put(AdminHomeController());

  final addEmployeeCtrl = Get.find<AddEmployeeController>();
  String userName = '';
  Future<void> _getUserName() async {
    String name = await AppUtils.getUserName();
    print('UserName: $name');
    setState(() {
      userName = name; // Update the state with the fetched username
    });
  }

  @override
  void initState() {
    ///Tab horizontal listview items
    items.add(CategoriesModel('Dashboard', ImageCons.dashBoard));
    items.add(CategoriesModel('Inventory', ImageCons.inventory));
    items.add(CategoriesModel('Purchase', ImageCons.purchase));
    items.add(CategoriesModel('Sales', ImageCons.mainCategorySales));
    items.add(CategoriesModel('Product List', ImageCons.productList));
    items.add(CategoriesModel('Point Of Sale', ImageCons.pointOfSale));
    //
    ///Tab grid view items
    gridItems.add(CategoriesModel('Dashboard', ImageCons.dashBoard));
    gridItems.add(CategoriesModel('Product List', ImageCons.productList));
    gridItems.add(CategoriesModel('Purchase', ImageCons.purchase));
    gridItems.add(CategoriesModel('Inventory', ImageCons.inventory));
    gridItems.add(CategoriesModel('Sales', ImageCons.mainCategorySales));
    gridItems
        .add(CategoriesModel('Food Management', ImageCons.imgFoodManagement));
    gridItems.add(CategoriesModel('Point Of Sale', ImageCons.pointOfSale));
    gridItems.add(CategoriesModel('Accounts', ImageCons.accounts));
    gridItems.add(CategoriesModel('Staff', ImageCons.employee));
    gridItems.add(CategoriesModel('Payroll', ImageCons.payroll));
    gridItems.add(CategoriesModel('Device Settings', ImageCons.deviceSettings));
    gridItems.add(CategoriesModel('QR/Barcode', ImageCons.generateQrBarcode));
    gridItems.add(CategoriesModel('Settings', ImageCons.settings));
    gridItems.add(CategoriesModel('Logout', ImageCons.imgLogout));
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//  adminDashBoardBottomSheet(context);    });
    _getUserName();
    super.initState();
  }

  final loginCtrl = Get.find<LogInController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        manageEmployeCtrl.isEmployeeDashboardDrawer.value = false;
        floorLeftEMenuCtrl.isFloorManagementDashboardDrawer.value = false;
        addEmployeeCtrl.isStaffAddEmployeeDrawer.value = false;
      },
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Tab user name layout
                      Text(
                        'Hi,',
                        style: btnTextStyle,
                      ),
                      Text(
                        userName,
                        style: titleTextStyle,
                      )
                    ],
                  ),
                  SizedBox(width: AppScreenUtil().screenWidth(10)),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                            false;
                        floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value = false;
                        addEmployeeCtrl.isStaffAddEmployeeDrawer.value = false;
                      },
                      child: SizedBox(
                        height: AppScreenUtil().screenHeight(35),
                        child: TextField(
                          style: searchInputTextStyle,
                          cursorColor: searchTextColor,
                          controller: searchKeywordController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 2),
                            hintText: 'Search foods,order id etc',
                            hintStyle: searchTextStyle,
                            filled: true,
                            fillColor: whiteColor,
                            prefixIconConstraints: BoxConstraints(
                                maxWidth: AppScreenUtil().screenWidth(33)),
                            prefixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: searchTextColor,
                                size: 18,
                              ),
                              onPressed: () {
                                if (searchKeywordController.text.isEmpty) {
                                  Dialog(
                                    child: Container(
                                      height: 305,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  );
                                  Dialog(
                                    child: Container(
                                      height: 305,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  );
                                  final snackBar = SnackBar(
                                    backgroundColor: backGroundColor,
                                    content: SizedBox(
                                      height: 30,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Please enter a keyword to search',
                                            style: dialogTextStyle,
                                          )),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             SearchProductList(searchKeywordController.text)
                                  //     ));
                                }
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(color: whiteColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///Scrollable top container
            (_topContainerHeight == 470)
                ? GestureDetector(
                    onTap: () {
                      manageEmployeCtrl.isEmployeeDashboardDrawer.value = false;
                      floorLeftEMenuCtrl
                          .isFloorManagementDashboardDrawer.value = false;
                      addEmployeeCtrl.isStaffAddEmployeeDrawer.value = false;
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 20, top: 15, left: 20, bottom: 20),
                            width: MediaQuery.of(context).size.width,
                            height: AppScreenUtil().screenHeight(470),
                            child: _buildAnimatedGridView(),
                          ),
                        )
                      ],
                    ))
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                            false;
                        floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value = false;
                        addEmployeeCtrl.isStaffAddEmployeeDrawer.value = false;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 14),
                        height: AppScreenUtil().screenHeight(98),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: items.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => Padding(
                                            padding: EdgeInsets.only(right: 6),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  manageEmployeCtrl
                                                      .isEmployeeDashboardDrawer
                                                      .value = false;
                                                  floorLeftEMenuCtrl
                                                      .isFloorManagementDashboardDrawer
                                                      .value = false;
                                                  addEmployeeCtrl
                                                      .isStaffAddEmployeeDrawer
                                                      .value = false;
                                                  item = items[index].text;
                                                });
                                                print('Tapped category $item');
                                              },
                                              child: Container(
                                                width: AppScreenUtil()
                                                    .screenWidth(80),
                                                decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Transform.translate(
                                                      offset: Offset(0, 17),
                                                      child: SvgPicture.asset(
                                                          items[index].icon,
                                                          height: 27),
                                                    ),
                                                    Transform.translate(
                                                      offset: Offset(0, 25),
                                                      child: Text(
                                                        items[index].text,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: mainRedTextStyle,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(3),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _topContainerHeight = 470;
                                    });
                                  },
                                  child: Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 2, 10, 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: redColor,
                                      ),
                                      child: Text('View All',
                                          style:
                                              placeOrderingAndConfirmPaymentButtonLabelStyle),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppScreenUtil().screenWidth(10),
                                ),
                              ],
                            ))),
                  ),
// SizedBox(height: AppScreenUtil().screenHeight(20),),
            /// Fixed main container
            Flexible(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.primaryDelta! < 0) {
                      setState(() {
                        manageEmployeCtrl.isEmployeeDashboardDrawer.value =
                            false;
                        floorLeftEMenuCtrl
                            .isFloorManagementDashboardDrawer.value = false;
                        addEmployeeCtrl.isStaffAddEmployeeDrawer.value = false;
                        _containerPosition += details.primaryDelta!;
                      });

                      if (_containerPosition < -50) {
                        setState(() {
                          if (_topContainerHeight == expandedHeight) {
                            _topContainerHeight = reductionHeight;
                            print('Drag success');
                          }
                        });
                      }
                    }
                  },
                  child: Container(
                    height: _bottomContainerHeight,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: Stack(
                      children: [
                        item == 'Inventory'
                            ? Inventory()
                            : item == 'Purchase'
                                ? Purchase()
                                : item == 'Point Of Sale'
                                    ? PointOfSale()
                                    : item == 'Accounts'
                                        ? Accounts()
                                        : item == 'Settings'
                                            ? Settings()
                                            : item == 'Device Settings'
                                                ? DeviceSettings()
                                                : item == 'QR/Barcode'
                                                    ? GenerateQrCode()
                                                    : item == 'Sales'
                                                        ? Sales()
                                                        : item == 'Staff'
                                                            ? Staff()
                                                            : item == 'Payroll'
                                                                ? Payroll()
                                                                : item ==
                                                                        'Product List'
                                                                    ? ProductListTab()
                                                                    : item ==
                                                                            'Food Management'
                                                                        ? FoodManagement()
                                                                        : AdminDashBoard(),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                            offset: Offset(0, -2),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isContainerVisible = !isContainerVisible;
                                  if (isContainerVisible == false) {
                                    _topContainerHeight = 0;
                                    tabItemContainerHeight = 0;
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      isContainerVisible = false;
                                    });
                                  } else {
                                    _topContainerHeight =
                                        AppScreenUtil().screenHeight(96);
                                    tabItemContainerHeight =
                                        AppScreenUtil().screenHeight(75);
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      isContainerVisible = true;
                                    });
                                  }
                                });
                              },
                              child: SizedBox(
                                width: AppScreenUtil().screenWidth(60),
                                child: Divider(
                                  thickness: 2.3,
                                  color: dividerColor.withOpacity(0.98),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: AppScreenUtil().screenHeight(22),
                            child: FloorManagementDashBoardDrawer()),
                        Positioned(
                            top: AppScreenUtil().screenHeight(22),
                            child: EmployeeDashBoardDrawer()),
                        Positioned(
                            top: AppScreenUtil().screenHeight(22),
                            child: StaffAddEmployeeDrawer())
                      ],
                    ),
                  ),
                ),
              ),
            )
          ])),
    ));
  }

  Widget _buildAnimatedGridView() {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 17,
          mainAxisSpacing: 17,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 3,
            duration: const Duration(milliseconds: 500),
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: InkWell(
                    onTap: () {
                      manageEmployeCtrl.isEmployeeDashboardDrawer.value = false;
                      floorLeftEMenuCtrl
                          .isFloorManagementDashboardDrawer.value = false;
                      addEmployeeCtrl.isStaffAddEmployeeDrawer.value = false;
                      setState(() {
                        // if (_topContainerHeight == expandedHeight) {
                        //   _topContainerHeight = reductionHeight;
                        // }
                        _topContainerHeight = 96;
                        item = gridItems[index].text;
                      });
                      print('Tapped Item : $item');
                      item == 'View More'
                          ? context.push('/AdminAllCategories')
                          : dispose;
                      if (item == 'Logout') {
                        loginCtrl.clearAuthToken().then((value) {
                          Get.offAllNamed(routeName.loginPage);
                        });
                      }
                    },
                    child: tabGridViewItems(
                      context,
                      gridItems[index].icon!,
                      gridItems[index].text!,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

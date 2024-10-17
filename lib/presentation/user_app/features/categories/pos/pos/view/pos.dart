// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use, prefer_if_null_operators, unnecessary_null_comparison, unused_local_variable, unnecessary_brace_in_string_interps, avoid_print, avoid_function_literals_in_foreach_calls, avoid_init_to_null, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_awesome_calculator/flutter_awesome_calculator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/admin_app/features/categories/inventory/sub_inventory/product/create/product.dart';
import 'package:restaurant/presentation/admin_app/widgets/reusable_text.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/get_all_employees.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_all_aggregators_list_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_pos_order_by_id_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/controller/table_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_designs_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_model.dart';
import 'package:restaurant/routes/index.dart';
import 'package:restaurant/models/subcategories_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_customer_for_dropdown.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/reservation/user_reservation.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos_tables/pos_table.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/view_orders/view_orders.dart';
import 'package:restaurant/routes/route_name.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';
import '../../../../../../../core/config/session.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../styles/colors.dart';
import '../../../../../../../styles/textstyles.dart';
import '../../../../../../admin_app/widgets/empty_layout.dart';
import '../../../../../../common/features/error/app_error.dart';
import '../../../../../widgets/custom_alert_dialogue.dart';
import '../../../../../widgets/custom_alert_dialogue_with_image.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/label_dropdown.dart';
import '../../../../../widgets/label_textfield.dart';
import '../../../../../widgets/user_outlined_textfield.dart';
import '../../confirmPayment/confirm_payment.dart';
import '../../customer/customer.dart';
import '../../ongoing_orders/view/ongoing_orders_grid.dart';
import '../../ongoing_orders/view/ongoing_orders_list.dart';
import '../controller/pos_controller.dart';
import '../service/res_model/view_products_for_pos_model.dart';

class POSPage extends StatefulWidget {
  const POSPage({super.key});

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {
  ///API
  final posCtrl = Get.find<POSController>();
  final tableCtrl = Get.find<TableController>();
  final ongoingCtrl = Get.find<OngoingOrdersController>();

  final noteController = TextEditingController();
  final customerNoteController = TextEditingController();
  dynamic mainCategory = '';
  int currentIndex = 0;
  int cartTabCurrentIndex = 0;
  List<String> headTitle = ['Dine In', 'Take Away', 'Delivery'];
  String tappedHeadItem = 'Dine In';
  List<String> subHeadTitle = ['View Orders', 'Reservation', 'Special Items'];
  String? tappedCategoryItem;
  String? tappedSubCategoryItem = '';
  String? selectedFloorValue;
  String? selectedDropdownValue;
  bool categoriesTapped = false;
  String passwordErrorMessage = 'Enter a valid password';
  int? tappedIndex;
  String? _selectedItem;
  String addedCustomerId = '';
  String selectedCustomerMobile = '';
  dynamic _count = 1;
  bool isValidCustomerName = true;
  bool isValidCustomerMobile = true;
  bool isValidCustomerBuildingName = true;
  bool isValidCustomerCity = true;
  bool isValidCustomerStreet = true;
  bool isValidCustomerBuildingNo = true;
  bool isValidCustomerRoomNo = true;
  bool isPayment = false;
  List<bool> isSelected = [];
  List<String> selectedTableIds = [];
  final customerNameController = TextEditingController();
  final customerMobileController = TextEditingController();
  final customerBuildingNameController = TextEditingController();
  final customerCityController = TextEditingController();
  final customerStreetController = TextEditingController();
  final customerBuildingNoController = TextEditingController();
  final customerRoomNoController = TextEditingController();
  final customerController = TextEditingController();
  final mobileController = TextEditingController();
  final personController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final aggregatorRefController = TextEditingController();
  final totalPersonController = TextEditingController();
  final floorController = TextEditingController();
  final removeCartController = TextEditingController();
  final updatePasswordController = TextEditingController();
  bool tappedMoreDetails = false;
  dynamic selectedWaiter;
  // bool specialItemTapped = false;
  bool _isChecked = false;
  dynamic tappedOffer;
  bool tappedOngoingOrderGrid = true;
  String mainCatId = '';
  String catId = '';
  String addedCustomer = '';
  String selectedOrdType = 'Dine In';
  int tappedCartIndex = 0;
  dynamic aggregatorId;
  dynamic aggregatorIsSelf;
  dynamic aggregator;
  bool isValidPassword = true;
  bool paymentConfirmed = false;
  bool orderPlaced = false;
  final storage = GetStorage();

  void dateSelection({required TextEditingController controller}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Format the date to dd/MM/yyyy
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

      setState(() {
        // Update the controller text with formatted date
        controller.text = formattedDate;
      });
    } else {
      if (kDebugMode) {
        print("Date is not selected");
      }
    }
  }

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String currentTime = DateFormat('hh:mm').format(DateTime.now());
  List<dynamic> orderInfo = [];
  void addProductsToCart(List<dynamic> orderInfo,
      List<ViewProductsForPosModel> productList, String batchId) {
    setState(() {
      // Create a map of product IDs to their quantities, kotid, and kotStatus from orderInfo
      var orderDetails = {
        for (var item in orderInfo)
          item['productId'] as String: {
            'qty': item['qty'] as int,
            'kotOrderId': item['kotOrderId'] as String?,
            'kotStatus': item['kotStatus'] as String?,
            'customerNote': item['customerNote'] as String?
          }
      };

      // Iterate over productList and add matching products to the cart
      for (var product in productList) {
        if (orderDetails.containsKey(product.id)) {
          var details = orderDetails[product.id]!;
          print(
              'Adding product ${product.id} with quantity ${details['qty']} ,KotId:${details['kotOrderId']},KotStatus:${details['kotStatus']}');
          cart.add(CartItem(
              product: product,
              quantity: details['qty']!,
              batchId: batchId,
              kotId: details['kotOrderId'],
              kotStatus: details['kotStatus'],
              customerNote: details['customerNote']));
        }
      }
    });
  }

  final _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
  bool veg = false;
  List<CartItem> cart = [];
  String orderIdFromOngoingOrders = '';
  void addToCart(ViewProductsForPosModel product, String batchId) {
    setState(() {
      // Extract kotid and kotStatus from orderInfo if it's not null

      int index = cart.indexWhere((item) => item.product.id == product.id);

      if (index != -1) {
        // If the product exists, increment the quantity and update kotid and kotStatus
        cart[index] = CartItem(
          product: product,
          quantity: cart[index].quantity + 1,
          batchId: batchId,
          kotId: null,
          kotStatus: 'DRAFT',
        );
      } else {
        // If the product does not exist, add it to the cart with quantity 1
        cart.add(CartItem(
          product: product,
          quantity: 1,
          batchId: batchId,
          kotId: null,
          kotStatus: 'DRAFT',
        ));
      }
    });

    print('Cart : ${cart.length}');

    cart.forEach((item) {
      print(
          'Product: ${item.product.productName}, Quantity: ${item.quantity}, Amount: ${item.product.salesPrice}, Tax: ${item.product.includedPrice}, KOT ID: ${item.kotId}, KOT Status: ${item.kotStatus}');
    });
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime({required TextEditingController controller}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        controller.text = _selectedTime.format(context);
      });
      print('Selected Time: ${timeController.text}');
    }
  }

  dynamic amountTotal;

  ///Tax Calculation
  void calculateAndSetCalculatedValues() {
    double amtTotal = 0.0;

    for (int i = 0; i < cart.length; i++) {
      var item = cart[i];

      double totalAmt;
      if (item.updatedPrice != null) {
        var updatedPrice = double.parse(item.updatedPrice);
        if (updatedPrice != null) {
          totalAmt = item.quantity.toDouble() * updatedPrice;
        } else {
          totalAmt = 0.0;
        }
      } else {
        totalAmt = item.quantity.toDouble() * item.product.salesPrice;
      }

      String subtotalBeforeTax = totalAmt.toStringAsFixed(2);

      double totalTax =
          item.product.taxes!.fold(0, (sum, tax) => sum + (tax.amount ?? 0.0));

      double totalExclTax = (double.parse(subtotalBeforeTax) * totalTax) / 100;

      if (item.product.includedPrice == true) {
        List<double> taxesAmount =
            item.product.taxes?.map((tax) => tax.amount!.toDouble()).toList() ??
                [];
        List<double> totalInclArr = taxesAmount.map((tax) {
          double total = (double.parse(subtotalBeforeTax) * tax) / (100 + tax);
          return total;
        }).toList();
        double totalIncl = totalInclArr.fold(0, (sum, value) => sum + value);

        cart[i].exclTax = 0;
        cart[i].inclTax = totalIncl;
        cart[i].subTotalWoTax = totalAmt;
        cart[i].linTotal = totalAmt;
        amtTotal += totalAmt;
        cart[i].amtTotal = totalAmt.toInt();
        tappedCartIndex = i;
        print(
            'Total Inclusive TRUE: InclTax : $totalIncl, TotalAmt : $totalAmt');
      } else if (item.product.includedPrice == false) {
        cart[i].exclTax = totalExclTax;
        cart[i].inclTax = 0;
        cart[i].subTotalWoTax = totalAmt;
        cart[i].linTotal = totalAmt + totalExclTax;
        amtTotal += cart[i].linTotal;
        cart[i].amtTotal = cart[i].linTotal.toInt();
        tappedCartIndex = i;
        print(
            'Total Inclusive FALSE : TotalExcl : $totalExclTax, totalAmt : $totalAmt, LineTotal : ${totalAmt + totalExclTax}');
      } else {
        cart[i].exclTax = 0;
        cart[i].inclTax = 0;
        cart[i].subTotalWoTax = totalAmt;
        cart[i].linTotal = totalAmt;
        amtTotal += totalAmt;
        cart[i].amtTotal = totalAmt.toInt();
        tappedCartIndex = i;
        print('Total Inclusive NULL: Total Amount :$totalAmt');
      }
    }

    amountTotal = amtTotal;

    print('amtTotal: $amtTotal - ${amountTotal}');
  }

// Function to clear the cart after order placement
  void clearCart() {
    cart.clear();
  }

  String selectedFloorId = '';
  String orderId = '';
  List<dynamic> ongoingOrdersById = [];
  int tappedFloorIndex = 0;
  String OngoingOrderCount = '';
  void deleteItem(int index) {
    setState(() {
      cart.removeAt(index);
      calculateAndSetCalculatedValues();
    });
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  Color buttonColor = whiteColor;
  @override
  void initState() {
    super.initState();
    posCtrl.getAllCategoriesList(veg);
    DateTime now = DateTime.now();
    print("Current Date and Time: $now");
    print(
        'POS ConfigurationSettings:${posCtrl.viewPosConfigurationSettingsResData.posStatus}');
    // ongoingCtrl.ongoingOrderCount.value =
    //     ongoingCtrl.allOngoingOrderViewMainList.length.toString();
    // posCtrl.getProductListForPOS(mainCatId, catId);
    print('Order Id From POS :${tableCtrl.floorPlanOrderId}');
    // tableCtrl.floorPlanOrderId == 'Test'
    //     ? print('hi')
    //     : posCtrl.viewPosOrderByIdRes('${tableCtrl.floorPlanOrderId}');
    posCtrl.getCustomerDropdownList();
    posCtrl.allAggregatorsList();
    posCtrl.getViewCashCustomer();
    posCtrl.getAllPaymentsForPOSByBranchList();
    posCtrl.getAllCardsList();
    tableCtrl.getAllFloorDesignsList('${tableCtrl.viewFloorMainList[0].id}');
    // isSelected = List<bool>.filled(9, false);
  }

  @override
  Widget build(BuildContext context) {
    // addedCustomerId = '${posCtrl.viewCashCustomerResData.id}';
    // ongoingCtrl.ongoingOrderCount.value =
    //     ongoingCtrl.allOngoingOrderViewMainList.length.toString();

    posCtrl.getAllCategoriesList(veg);
    return SafeArea(
        child: RefreshIndicator(
            color: confirmColor,
            onRefresh: () async {
              await posCtrl.getAllCategoriesList(veg);
              await posCtrl.getCustomerDropdownList();
              await posCtrl.allAggregatorsList();
              await posCtrl.getViewCashCustomer();
              await posCtrl.getAllPaymentsForPOSByBranchList();
              await posCtrl.getAllCardsList();
              await tableCtrl.getAllFloorDesignsList(
                  '${tableCtrl.viewFloorMainList[0].id}');
            },
            child: Scaffold(
                backgroundColor: backGroundColor,
                body: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                AppScreenUtil().screenWidth(25)),
                            topRight: Radius.circular(
                                AppScreenUtil().screenWidth(25))),
                        color: whiteColor),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: AppScreenUtil().screenHeight(145),
                                width: AppScreenUtil().screenWidth(84),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                  ),
                                  color: employeeDashBoardTableHeadingColor
                                      .withOpacity(0.3),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(15),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          tappedCategoryItem = 'Home';
                                          tappedCategoryItem = 'Customer';
                                          posCtrl.tappedCategoryItem.value = '';
                                          // specialItemTapped = false;
                                          // tappedOngoingOrderGrid = false;
                                          categoriesTapped = false;
                                          posCtrl.productOrderId.value = '';
                                          posCtrl.customerId.value = '';
                                          posCtrl.isAddOrderFromChDraftTapped =
                                              false.obs;
                                          posCtrl.isOrderReservationIsSuccess =
                                              false.obs;
                                          tableCtrl.floorPlanOrderId == 'Test';
                                          print(
                                              'IsDisabledOrderUpdating: ${posCtrl.isAddOrderFromChDraftTapped.value}');
                                          tableCtrl
                                                  .isOrderFromFloorPlanIsSuccess =
                                              true.obs;
                                          posCtrl.orderStatus =
                                              'OrderFromCategories'.obs;
                                        });
                                        cart.clear();
                                        aggregatorId = '';
                                        selectedValue = null;
                                        aggregatorRefController.text = '';
                                      },
                                      child: ClipOval(
                                        child: Container(
                                          padding: EdgeInsets.all(11.5),
                                          height:
                                              AppScreenUtil().screenHeight(42),
                                          width:
                                              AppScreenUtil().screenWidth(42),
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                color:
                                                    adminDashBoardDateDropDownContainerBoxShadowColor,
                                                offset: Offset(1, 2),
                                                blurRadius: 6,
                                              ),
                                            ],
                                            color:
                                                tappedCategoryItem == 'Customer'
                                                    ? confirmColor
                                                    : whiteColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                            color:
                                                tappedCategoryItem == 'Customer'
                                                    ? whiteColor
                                                    : confirmColor,
                                            ImageCons.posCustomer,
                                            height: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(3)),
                                    Text(
                                      'Customer',
                                      style: categoryRedTextStyle,
                                    ),
                                    SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(12)),
                                    Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              tappedCategoryItem = 'Home';
                                              tappedCategoryItem =
                                                  'Ongoing Orders';
                                              posCtrl.tappedCategoryItem.value =
                                                  '';
                                              // specialItemTapped = false;
                                              // tappedOngoingOrderGrid = false;
                                              posCtrl.productOrderId.value = '';
                                              posCtrl.customerId.value = '';
                                              categoriesTapped = false;
                                              posCtrl.isOrderReservationIsSuccess =
                                                  false.obs;
                                              tableCtrl.floorPlanOrderId ==
                                                  'Test';
                                              posCtrl.orderStatus =
                                                  'OrderFromCategories'.obs;
                                            });
                                            cart.clear();
                                            aggregatorId = '';
                                            selectedValue = null;
                                            aggregatorRefController.text = '';
                                          },
                                          child: ClipOval(
                                            child: Container(
                                              padding: EdgeInsets.all(8.5),
                                              height: AppScreenUtil()
                                                  .screenHeight(42),
                                              width: AppScreenUtil()
                                                  .screenWidth(42),
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color:
                                                        adminDashBoardDateDropDownContainerBoxShadowColor,
                                                    offset: Offset(1, 2),
                                                    blurRadius: 6,
                                                  ),
                                                ],
                                                color: tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders List'
                                                    ? confirmColor
                                                    : whiteColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                color: tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders List'
                                                    ? whiteColor
                                                    : confirmColor,
                                                ImageCons.helpOrders,
                                                height: 17,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Obx(() {
                                          return ongoingCtrl.ongoingOrderCount
                                                      .value !=
                                                  0
                                              ? Positioned(
                                                  right: 0,
                                                  top: 0.5,
                                                  child: Container(
                                                    width: 16,
                                                    height: 16,
                                                    decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      border: Border.all(
                                                        color: confirmColor,
                                                        width: 0.7,
                                                      ), // border color
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              2, 1, 2, 4),
                                                      child: Text(
                                                        ongoingCtrl
                                                            .ongoingOrderCount
                                                            .value
                                                            .toString(),
                                                        style: pangramMedium(
                                                          size: 9.0,
                                                          color: confirmColor,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox();
                                        }),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(3)),
                                    Text(
                                      'Ongoing Orders',
                                      style: categoryRedTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Transform.translate(
                                  offset: Offset(4, 0),
                                  child: Center(
                                    child: Column(children: [
                                      SizedBox(
                                        height:
                                            AppScreenUtil().screenHeight(10),
                                      ),
                                      tableCtrl.floorPlanOrderId == 'Test'
                                          ? Transform.translate(
                                              offset: Offset(-5, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(child: SizedBox()),
                                                  Expanded(
                                                    child: Text(
                                                      'Billing',
                                                      style: billingTextStyle,
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20),
                                                      child: Stack(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                ///Carr bottom sheet

                                                                cartBottomSheet(
                                                                    context,
                                                                    ongoingOrdersById,
                                                                    posCtrl
                                                                        .viewPosOrderByIdResData
                                                                        .status,
                                                                    posCtrl
                                                                        .productOrderId
                                                                        .value);
                                                              },
                                                              child: Card(
                                                                elevation: 0.2,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          6,
                                                                          6,
                                                                          6,
                                                                          6),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          25),
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          26),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color:
                                                                        whiteColor,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: payTemplateListShadow
                                                                            .withOpacity(0.1),
                                                                        spreadRadius:
                                                                            1,
                                                                        blurRadius:
                                                                            0.5,
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    ImageCons
                                                                        .cart,
                                                                    color:
                                                                        confirmColor,
                                                                    height: 10,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              )),
                                                          cart.isNotEmpty
                                                              ? Positioned(
                                                                  right: 0,
                                                                  top: 0.5,
                                                                  child:
                                                                      Container(
                                                                    width: 15,
                                                                    height: 15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          confirmColor,
                                                                      // border color
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              2,
                                                                              1,
                                                                              2,
                                                                              4),
                                                                      // border width
                                                                      child:
                                                                          Text(
                                                                        cart.length
                                                                            .toString(),
                                                                        style:
                                                                            confirmTextStyle,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : SizedBox()
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            )
                                          : Transform.translate(
                                              offset: Offset(6, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      height: 12,
                                                      child: ListView.separated(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: posCtrl
                                                                .viewPosOrderByIdResData
                                                                .tableNames!
                                                                .length +
                                                            1,
                                                        itemBuilder:
                                                            (context, index) {
                                                          if (index <
                                                              posCtrl
                                                                  .viewPosOrderByIdResData
                                                                  .tableNames!
                                                                  .length) {
                                                            String tableName =
                                                                posCtrl
                                                                    .viewPosOrderByIdResData
                                                                    .tableNames![
                                                                        index]
                                                                    .toString()
                                                                    .trim();
                                                            tableName += (index <
                                                                    posCtrl
                                                                            .viewPosOrderByIdResData
                                                                            .tableNames!
                                                                            .length -
                                                                        1)
                                                                ? ','
                                                                : '';

                                                            return Text(
                                                              tableName,
                                                              style:
                                                                  categoryRedTextStyle,
                                                            );
                                                          } else {
                                                            return Text(
                                                              ' / CH${posCtrl.viewPosOrderByIdResData.chairId!.length}',
                                                              style:
                                                                  categoryRedTextStyle,
                                                            );
                                                          }
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return SizedBox(
                                                              width: 1);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      'Billing',
                                                      style: billingTextStyle,
                                                    ),
                                                  ),

                                                  ///Cart icon
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20),
                                                      child: Stack(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                ///Carr bottom sheet

                                                                cartBottomSheet(
                                                                    context,
                                                                    ongoingOrdersById,
                                                                    posCtrl
                                                                        .viewPosOrderByIdResData
                                                                        .status,
                                                                    posCtrl
                                                                        .productOrderId
                                                                        .value);
                                                              },
                                                              child: Card(
                                                                elevation: 0.2,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          6,
                                                                          6,
                                                                          6,
                                                                          6),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          25),
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          26),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color:
                                                                        whiteColor,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: payTemplateListShadow
                                                                            .withOpacity(0.1),
                                                                        spreadRadius:
                                                                            1,
                                                                        blurRadius:
                                                                            0.5,
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    ImageCons
                                                                        .cart,
                                                                    color:
                                                                        confirmColor,
                                                                    height: 10,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              )),
                                                          cart.isNotEmpty
                                                              ? Positioned(
                                                                  right: 0,
                                                                  top: 0.5,
                                                                  child:
                                                                      Container(
                                                                    width: 15,
                                                                    height: 15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          confirmColor,
                                                                      // border color
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              2,
                                                                              1,
                                                                              2,
                                                                              4),
                                                                      // border width
                                                                      child:
                                                                          Text(
                                                                        cart.length
                                                                            .toString(),
                                                                        style:
                                                                            confirmTextStyle,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : SizedBox()
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                      SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(7)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 25,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        tappedHeadItem =
                                                            headTitle[0];
                                                        selectedOrdType =
                                                            headTitle[0];
                                                        buttonColor =
                                                            whiteColor;
                                                      });

                                                      aggregatorId = '';
                                                      selectedValue = null;
                                                      aggregatorRefController
                                                          .text = '';
                                                    },
                                                    child: Card(
                                                      elevation: 1,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(28),
                                                      ),
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(11, 2,
                                                                  11, 2),
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      17),
                                                          width: AppScreenUtil()
                                                              .screenWidth(61),
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color:
                                                                    adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                offset: Offset(
                                                                    1, 2),
                                                                blurRadius: 6,
                                                              ),
                                                            ],
                                                            color: tappedHeadItem ==
                                                                        'Dine In' ||
                                                                    selectedOrdType ==
                                                                        'Dine In'
                                                                ? confirmColor
                                                                : whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        28),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              headTitle[0],
                                                              style: tappedHeadItem ==
                                                                          'Dine In' ||
                                                                      selectedOrdType ==
                                                                          'Dine In'
                                                                  ? dineInTextStyle
                                                                  : takeAwayTextStyle,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: AppScreenUtil()
                                                        .screenHeight(7),
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          tappedCategoryItem =
                                                              subHeadTitle[0];
                                                          tappedCategoryItem =
                                                              'Home';
                                                          tappedCategoryItem =
                                                              'View Orders';
                                                          posCtrl
                                                              .tappedCategoryItem
                                                              .value = '';
                                                          // specialItemTapped =
                                                          //     false;
                                                          // tappedOngoingOrderGrid =
                                                          //     false;
                                                          posCtrl.productOrderId
                                                              .value = '';
                                                          posCtrl.customerId
                                                              .value = '';
                                                          categoriesTapped =
                                                              false;
                                                          posCtrl.isAddOrderFromChDraftTapped =
                                                              false.obs;
                                                          tableCtrl
                                                                  .isOrderFromFloorPlanIsSuccess =
                                                              true.obs;
                                                          posCtrl.isOrderReservationIsSuccess =
                                                              false.obs;
                                                          tableCtrl
                                                                  .floorPlanOrderId ==
                                                              'Test';
                                                          posCtrl.orderStatus =
                                                              'OrderFromCategories'
                                                                  .obs;
                                                        });
                                                        cart.clear();
                                                        aggregatorId = '';
                                                        selectedValue = null;
                                                        aggregatorRefController
                                                            .text = '';
                                                      },
                                                      child: Column(
                                                        children: [
                                                          ClipOval(
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        15),
                                                                height: AppScreenUtil()
                                                                    .screenHeight(
                                                                        42),
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        42),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color:
                                                                          adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              2),
                                                                      blurRadius:
                                                                          6,
                                                                    ),
                                                                  ],
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: tappedCategoryItem ==
                                                                          'View Orders'
                                                                      ? confirmColor
                                                                      : whiteColor,
                                                                ),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  ImageCons
                                                                      .imgPosViewOrders,
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          11),
                                                                  color: tappedCategoryItem ==
                                                                          'View Orders'
                                                                      ? whiteColor
                                                                      : confirmColor,
                                                                )),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        3),
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              subHeadTitle[0],
                                                              style:
                                                                  takeAwayTextStyle,
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        tappedHeadItem =
                                                            headTitle[1];
                                                        selectedOrdType =
                                                            headTitle[1];
                                                        buttonColor =
                                                            whiteColor;
                                                      });

                                                      aggregatorId = '';
                                                      selectedValue = null;
                                                      aggregatorRefController
                                                          .text = '';
                                                    },
                                                    child: Card(
                                                      elevation: 1,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(28),
                                                      ),
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(5, 2, 5,
                                                                  2),
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      17),
                                                          width: AppScreenUtil()
                                                              .screenWidth(61),
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color:
                                                                    adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                offset: Offset(
                                                                    1, 2),
                                                                blurRadius: 6,
                                                              ),
                                                            ],
                                                            color: tappedHeadItem ==
                                                                        'Take Away' ||
                                                                    selectedOrdType ==
                                                                        'Take Away'
                                                                ? confirmColor
                                                                : whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        28),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              headTitle[1],
                                                              style: tappedHeadItem ==
                                                                          'Take Away' ||
                                                                      selectedOrdType ==
                                                                          'Take Away'
                                                                  ? dineInTextStyle
                                                                  : takeAwayTextStyle,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: AppScreenUtil()
                                                        .screenHeight(7),
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          tappedCategoryItem =
                                                              subHeadTitle[1];
                                                          tappedCategoryItem =
                                                              'Home';
                                                          tappedCategoryItem =
                                                              'Reservation';
                                                          posCtrl.productOrderId
                                                              .value = '';
                                                          posCtrl.customerId
                                                              .value = '';
                                                          posCtrl
                                                              .tappedCategoryItem
                                                              .value = '';
                                                          // specialItemTapped =
                                                          //     false;
                                                          // tappedOngoingOrderGrid =
                                                          //     false;
                                                          categoriesTapped =
                                                              false;
                                                          posCtrl.isAddOrderFromChDraftTapped =
                                                              false.obs;
                                                          tableCtrl
                                                                  .isOrderFromFloorPlanIsSuccess =
                                                              true.obs;
                                                          posCtrl.isOrderReservationIsSuccess =
                                                              false.obs;
                                                          tableCtrl
                                                                  .floorPlanOrderId ==
                                                              'Test';
                                                          posCtrl.orderStatus =
                                                              'OrderFromCategories'
                                                                  .obs;
                                                        });
                                                        cart.clear();
                                                        aggregatorId = '';
                                                        selectedValue = null;
                                                        aggregatorRefController
                                                            .text = '';
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipOval(
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        15),
                                                                height: AppScreenUtil()
                                                                    .screenHeight(
                                                                        42),
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        42),
                                                                decoration: BoxDecoration(
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color:
                                                                            adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                        offset: Offset(
                                                                            1,
                                                                            2),
                                                                        blurRadius:
                                                                            6,
                                                                      ),
                                                                    ],
                                                                    color: tappedCategoryItem ==
                                                                            'Reservation'
                                                                        ? confirmColor
                                                                        : whiteColor,
                                                                    shape: BoxShape
                                                                        .circle),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  ImageCons
                                                                      .imgPosReservation,
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          11),
                                                                  color: tappedCategoryItem ==
                                                                          'Reservation'
                                                                      ? whiteColor
                                                                      : confirmColor,
                                                                )),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        3),
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              subHeadTitle[1],
                                                              style:
                                                                  takeAwayTextStyle,
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Obx(() => (posCtrl
                                                              .allAggregatorsViewDetailsLoading
                                                              .value ==
                                                          true)
                                                      ? SizedBox()
                                                      : (posCtrl.isAllAggregatorsListError
                                                                  .value ==
                                                              true)
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                posCtrl
                                                                    .allAggregatorsList();
                                                              },
                                                              child: Container(
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          16),
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          57),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        confirmColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            28),
                                                                  )),
                                                            )
                                                          : (posCtrl
                                                                  .allAggregatorsViewMainList
                                                                  .isEmpty)
                                                              ? Text('😢')
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      buttonColor =
                                                                          confirmColor;
                                                                      tappedHeadItem =
                                                                          headTitle[
                                                                              2];
                                                                      selectedOrdType =
                                                                          headTitle[
                                                                              2];
                                                                      categoriesTapped =
                                                                          false;
                                                                      tappedCategoryItem =
                                                                          '';
                                                                      tappedSubCategoryItem =
                                                                          '';
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              28),
                                                                      color:
                                                                          buttonColor,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton2<
                                                                            String>(
                                                                          isExpanded:
                                                                              true,
                                                                          hint:
                                                                              Text(
                                                                            headTitle[2],
                                                                            style: buttonColor == confirmColor
                                                                                ? dineInTextStyle
                                                                                : takeAwayTextStyle,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                          items: posCtrl
                                                                              .allAggregatorsViewMainList
                                                                              .map((AggregatorsListResModel item) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: item.name,
                                                                              child: Center(
                                                                                child: Text(
                                                                                  '${item.name}',
                                                                                  style: buttonColor == confirmColor ? dineInTextStyle : takeAwayTextStyle,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }).toList(),
                                                                          value:
                                                                              selectedValue,
                                                                          onChanged:
                                                                              (value) {
                                                                            setState(() {
                                                                              selectedValue = value;
                                                                              tappedHeadItem = headTitle[2];
                                                                              selectedOrdType = headTitle[2];
                                                                              buttonColor = whiteColor;
                                                                              aggregatorRefController.text = '';
                                                                              AggregatorsListResModel? aggregator = posCtrl.allAggregatorsViewMainList.firstWhereOrNull((item) => item.name == selectedValue);

                                                                              if (aggregator != null) {
                                                                                aggregatorId = aggregator.id!;
                                                                                aggregatorIsSelf = aggregator.isSelf;
                                                                                print('Aggregator Name: $selectedValue, Aggregator Id: $aggregatorId');
                                                                              }
                                                                              categoriesTapped = false;
                                                                              tappedCategoryItem = '';
                                                                              tappedSubCategoryItem = '';
                                                                            });

                                                                            // Show dialog
                                                                            aggregatorIsSelf == true
                                                                                ? SizedBox()
                                                                                : showDialog(
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return StatefulBuilder(builder: (context, setState) {
                                                                                        return Dialog(
                                                                                          alignment: Alignment.center,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(4),
                                                                                          ),
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Container(
                                                                                                padding: EdgeInsets.fromLTRB(18, 18, 18, 15),
                                                                                                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(4)),
                                                                                                child: Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        ClipOval(
                                                                                                          child: Container(
                                                                                                            width: 28,
                                                                                                            height: 28,
                                                                                                            color: posSpecialItems1Color,
                                                                                                            child: Center(
                                                                                                                child: SvgPicture.asset(
                                                                                                              ImageCons.imgCartAggregators,
                                                                                                              height: AppScreenUtil().screenHeight(10),
                                                                                                            )),
                                                                                                          ),
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: AppScreenUtil().screenHeight(21),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Add Reference ID',
                                                                                                          style: pangramMedium(size: 10.0, color: blackColor),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: AppScreenUtil().screenHeight(16),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      padding: EdgeInsets.only(right: 10),
                                                                                                      height: AppScreenUtil().screenHeight(32),
                                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: confirmColor.withOpacity(0.5), width: 0.8)),
                                                                                                      child: Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            height: AppScreenUtil().screenHeight(32),
                                                                                                            width: AppScreenUtil().screenWidth(72),
                                                                                                            color: posSpecialItems1Color,
                                                                                                            child: Center(
                                                                                                                child: Text(
                                                                                                              'Aggregator',
                                                                                                              style: pangramRegular(size: 10.0, color: blackColor),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                              child: Align(
                                                                                                                  alignment: Alignment.centerRight,
                                                                                                                  child: Text(
                                                                                                                    '${selectedValue}',
                                                                                                                    style: pangramRegular(size: 11.0, color: blackColor),
                                                                                                                  ))),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: AppScreenUtil().screenHeight(10),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      padding: EdgeInsets.only(right: 8, bottom: 2),
                                                                                                      height: AppScreenUtil().screenHeight(32),
                                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: confirmColor.withOpacity(0.5), width: 0.8)),
                                                                                                      child: Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            height: AppScreenUtil().screenHeight(32),
                                                                                                            width: AppScreenUtil().screenWidth(72),
                                                                                                            color: posSpecialItems1Color,
                                                                                                            child: Center(
                                                                                                                child: Text(
                                                                                                              'Ref ID',
                                                                                                              style: pangramRegular(size: 10.0, color: blackColor),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: TextField(
                                                                                                              textAlign: TextAlign.right,
                                                                                                              maxLines: 1,
                                                                                                              style: pangramRegular(size: 11.0, color: blackColor),
                                                                                                              controller: aggregatorRefController,
                                                                                                              // inputFormatters: widget.textInputFormatter,
                                                                                                              decoration: InputDecoration(
                                                                                                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                                                                contentPadding: const EdgeInsets.only(bottom: 7),
                                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                ),
                                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                ),
                                                                                                                errorBorder: OutlineInputBorder(
                                                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                ),
                                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                                  borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.only(right: 10, left: 10, top: 35),
                                                                                                      child: Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          GestureDetector(
                                                                                                            onTap: () {
                                                                                                              Navigator.pop(context);
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: AppScreenUtil().screenHeight(22),
                                                                                                              width: AppScreenUtil().screenWidth(45),
                                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: blackColor, width: 0.7)),
                                                                                                              child: Center(
                                                                                                                child: Text(
                                                                                                                  'Cancel',
                                                                                                                  style: kotDarkModeUnselectedTabLabelStyle,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            width: AppScreenUtil().screenWidth(5),
                                                                                                          ),
                                                                                                          GestureDetector(
                                                                                                            onTap: () {
                                                                                                              Navigator.of(context).pop();
                                                                                                              categoriesTapped = false;
                                                                                                              tappedCategoryItem = '';
                                                                                                              tappedSubCategoryItem = '';
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              height: AppScreenUtil().screenHeight(22),
                                                                                                              width: AppScreenUtil().screenWidth(91),
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: confirmColor,
                                                                                                                borderRadius: BorderRadius.circular(3),
                                                                                                              ),
                                                                                                              child: Center(
                                                                                                                child: Text(
                                                                                                                  'Submit',
                                                                                                                  style: kotSelectedTabLabelStyle,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          )
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: AppScreenUtil().screenHeight(8),
                                                                                                    ),
                                                                                                  ],
                                                                                                )),
                                                                                          ),
                                                                                        );
                                                                                      });
                                                                                    });
                                                                          },
                                                                          buttonStyleData:
                                                                              ButtonStyleData(
                                                                            height:
                                                                                AppScreenUtil().screenHeight(16),
                                                                            width:
                                                                                AppScreenUtil().screenWidth(57),
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                11,
                                                                                2,
                                                                                11,
                                                                                2),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              boxShadow: const [
                                                                                BoxShadow(
                                                                                  color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                                  offset: Offset(1, 2),
                                                                                  blurRadius: 0.5,
                                                                                  blurStyle: BlurStyle.normal,
                                                                                ),
                                                                              ],
                                                                              color: buttonColor,
                                                                              borderRadius: BorderRadius.circular(28),
                                                                            ),
                                                                            elevation:
                                                                                1,
                                                                          ),
                                                                          iconStyleData:
                                                                              const IconStyleData(
                                                                            iconSize:
                                                                                1,
                                                                            iconEnabledColor:
                                                                                Colors.transparent,
                                                                            iconDisabledColor:
                                                                                Colors.transparent,
                                                                          ),
                                                                          dropdownStyleData:
                                                                              DropdownStyleData(
                                                                            maxHeight:
                                                                                AppScreenUtil().screenHeight(166),
                                                                            width:
                                                                                AppScreenUtil().screenWidth(145),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(14),
                                                                              color: buttonColor,
                                                                            ),
                                                                            offset:
                                                                                const Offset(-20, 0),
                                                                            scrollbarTheme:
                                                                                ScrollbarThemeData(
                                                                              radius: const Radius.circular(40),
                                                                              thickness: MaterialStateProperty.all(6),
                                                                              thumbVisibility: MaterialStateProperty.all(true),
                                                                            ),
                                                                          ),
                                                                          menuItemStyleData:
                                                                              const MenuItemStyleData(
                                                                            height:
                                                                                40,
                                                                            padding:
                                                                                EdgeInsets.only(left: 14, right: 14),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )),
                                                  SizedBox(
                                                    height: AppScreenUtil()
                                                        .screenHeight(8),
                                                  ),
                                                  Transform.translate(
                                                    offset: Offset(0, 4),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            tappedCategoryItem =
                                                                subHeadTitle[2];
                                                            tappedCategoryItem =
                                                                'Home';
                                                            tappedCategoryItem =
                                                                'Special Items';
                                                            posCtrl
                                                                .productOrderId
                                                                .value = '';
                                                            posCtrl.customerId
                                                                .value = '';
                                                            posCtrl
                                                                .tappedCategoryItem
                                                                .value = '';
                                                            // specialItemTapped =
                                                            //     false;
                                                            // tappedOngoingOrderGrid =
                                                            //     false;
                                                            categoriesTapped =
                                                                false;
                                                            posCtrl.isAddOrderFromChDraftTapped =
                                                                false.obs;
                                                            tableCtrl
                                                                    .isOrderFromFloorPlanIsSuccess =
                                                                true.obs;
                                                            posCtrl.isOrderReservationIsSuccess =
                                                                false.obs;
                                                            tableCtrl
                                                                    .floorPlanOrderId ==
                                                                'Test';
                                                            posCtrl.orderStatus =
                                                                'OrderFromCategories'
                                                                    .obs;
                                                          });
                                                          cart.clear();
                                                          aggregatorId = '';
                                                          selectedValue = null;
                                                          aggregatorRefController
                                                              .text = '';
                                                        },
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipOval(
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets.all(
                                                                          14),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          42),
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          42),
                                                                  decoration: BoxDecoration(
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color:
                                                                              adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                          offset: Offset(
                                                                              1,
                                                                              2),
                                                                          blurRadius:
                                                                              6,
                                                                        ),
                                                                      ],
                                                                      color: tappedCategoryItem ==
                                                                              'Special Items'
                                                                          ? confirmColor
                                                                          : whiteColor,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    height: AppScreenUtil()
                                                                        .screenHeight(
                                                                            11),
                                                                    ImageCons
                                                                        .imgPosSpecialItems,
                                                                    color: tappedCategoryItem ==
                                                                            'Special Items'
                                                                        ? whiteColor
                                                                        : confirmColor,
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      3),
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                subHeadTitle[2],
                                                                style:
                                                                    takeAwayTextStyle,
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                      Divider(
                                          color:
                                              subDividerColor.withOpacity(0.1))
                                    ]),
                                  ),
                                ))
                          ],
                        ),
                        Flexible(
                            child: categoriesTapped == true
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () =>
                                            (posCtrl.categoriesViewDetailsLoading
                                                        .value ==
                                                    true)
                                                ? SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: confirmColor,
                                                      ),
                                                    ),
                                                  )
                                                : (posCtrl.isCategoriesListError
                                                            .value ==
                                                        true)
                                                    ? SizedBox(
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height /
                                                                3,
                                                        child: const Center(
                                                            child:
                                                                EmptyLayout()))
                                                    : (posCtrl
                                                            .categoriesViewMainList
                                                            .isEmpty)
                                                        ? Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            5),
                                                                width: AppScreenUtil()
                                                                    .screenWidth(
                                                                        84),
                                                                child: Center(
                                                                  child: Text(
                                                                    'No Categories Found!',
                                                                    style:
                                                                        shiftTotalListTextStyle,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                )))
                                                        : Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      84),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: employeeDashBoardTableHeadingColor
                                                                    .withOpacity(
                                                                        0.3),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Category',
                                                                    style:
                                                                        billingTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: AppScreenUtil()
                                                                        .screenHeight(
                                                                            10),
                                                                  ),
                                                                  Flexible(
                                                                      fit: FlexFit
                                                                          .loose,
                                                                      child: SingleChildScrollView(
                                                                          child: Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 50),
                                                                        child: ListView
                                                                            .separated(
                                                                          physics:
                                                                              NeverScrollableScrollPhysics(),
                                                                          shrinkWrap:
                                                                              true,
                                                                          itemCount: posCtrl
                                                                              .categoriesViewMainList
                                                                              .length,
                                                                          itemBuilder: (context, index) =>
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 10, right: 10),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  tappedIndex = index;
                                                                                  catId = '${posCtrl.categoriesViewMainList[index].id}';
                                                                                  print('Main Category Id : $mainCatId ' + 'Category ID : $catId');
                                                                                  posCtrl.getProductListForPOS(mainCatId, catId);
                                                                                  tappedSubCategoryItem = posCtrl.categoriesViewMainList[index].name;
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                                                  decoration: BoxDecoration(boxShadow: [
                                                                                    BoxShadow(
                                                                                      color: tappedIndex == index ? adminDashBoardDateDropDownContainerBoxShadowColor : Colors.transparent,
                                                                                      offset: Offset(0, 3),
                                                                                      blurRadius: 6,
                                                                                    ),
                                                                                  ], borderRadius: BorderRadius.circular(4), color: tappedIndex == index ? whiteColor : Colors.transparent),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${posCtrl.categoriesViewMainList[index].name}',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: whatsTextStyle,
                                                                                      )
                                                                                    ],
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                          separatorBuilder:
                                                                              (BuildContext context, int index) {
                                                                            return SizedBox(height: 10);
                                                                          },
                                                                        ),
                                                                      )))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          categoriesTapped =
                                                              false;
                                                          tappedCategoryItem =
                                                              '';
                                                          tappedSubCategoryItem =
                                                              '';

                                                          posCtrl
                                                              .getAllCategoriesList(
                                                                  veg);
                                                        });
                                                      },
                                                      child: Card(
                                                        color: whiteColor,
                                                        elevation:
                                                            tappedCategoryItem !=
                                                                    ''
                                                                ? 0
                                                                : 0.3,
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    2, 0, 2, 0),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        16),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        39),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: tappedCategoryItem !=
                                                                          ''
                                                                      ? Colors
                                                                          .transparent
                                                                      : adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2),
                                                                  blurRadius: 6,
                                                                ),
                                                              ],
                                                              color: tappedCategoryItem !=
                                                                      ''
                                                                  ? Colors
                                                                      .transparent
                                                                  : whiteColor,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons.home,
                                                                  size: 10,
                                                                  color:
                                                                      confirmColor,
                                                                ),
                                                                SizedBox(
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          2),
                                                                ),
                                                                Text(
                                                                  'Home',
                                                                  style:
                                                                      homeLocationTextStyle,
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                    tappedCategoryItem != ''
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                categoriesTapped =
                                                                    false;
                                                                // tappedIndex = 0;
                                                                tappedSubCategoryItem =
                                                                    '';
                                                                posCtrl
                                                                    .getAllCategoriesList(
                                                                        veg);
                                                              });
                                                            },
                                                            child: Card(
                                                              color: whiteColor,
                                                              elevation:
                                                                  tappedSubCategoryItem !=
                                                                          ''
                                                                      ? 0
                                                                      : 0.3,
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          16),
                                                                  width:
                                                                      AppScreenUtil()
                                                                          .screenWidth(
                                                                              45),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: tappedSubCategoryItem !=
                                                                                ''
                                                                            ? Colors.transparent
                                                                            : adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                        offset: Offset(
                                                                            1,
                                                                            2),
                                                                        blurRadius:
                                                                            6,
                                                                      ),
                                                                    ],
                                                                    color: tappedSubCategoryItem !=
                                                                            ''
                                                                        ? Colors
                                                                            .transparent
                                                                        : whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '$tappedCategoryItem',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          homeLocationTextStyle,
                                                                    ),
                                                                  )),
                                                            ),
                                                          )
                                                        : SizedBox(),
                                                    tappedSubCategoryItem !=
                                                                '' ||
                                                            tappedCategoryItem ==
                                                                ''
                                                        ? GestureDetector(
                                                            onTap: () {},
                                                            child: Card(
                                                              color: whiteColor,
                                                              elevation:
                                                                  tappedSubCategoryItem ==
                                                                          ''
                                                                      ? 0
                                                                      : 0.3,
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              4,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          16),
                                                                  width:
                                                                      AppScreenUtil()
                                                                          .screenWidth(
                                                                              40),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: tappedSubCategoryItem ==
                                                                                ''
                                                                            ? Colors.transparent
                                                                            : adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                        offset: Offset(
                                                                            1,
                                                                            2),
                                                                        blurRadius:
                                                                            6,
                                                                      ),
                                                                    ],
                                                                    color: tappedSubCategoryItem ==
                                                                            ''
                                                                        ? Colors
                                                                            .transparent
                                                                        : whiteColor,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '$tappedSubCategoryItem',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          homeLocationTextStyle,
                                                                    ),
                                                                  )),
                                                            ),
                                                          )
                                                        : SizedBox(),
                                                  ],
                                                ),

                                                ///sub categories
                                                Obx(
                                                  () => (posCtrl
                                                              .productListPosLoading
                                                              .value ==
                                                          true)
                                                      ? SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              3,
                                                          child: const Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  confirmColor,
                                                            ),
                                                          ),
                                                        )
                                                      : (posCtrl.isProductListPosError
                                                                  .value ==
                                                              true)
                                                          ? SizedBox(
                                                              height:
                                                                  MediaQuery.of(context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                              child: const Center(
                                                                  child:
                                                                      EmptyLayout()))
                                                          : (posCtrl
                                                                  .productListViewMainList
                                                                  .isEmpty)
                                                              ? SizedBox(
                                                                  height: MediaQuery.of(context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                                  child: Center(
                                                                      child: Text(
                                                                    'Something Wrong',
                                                                    style:
                                                                        bookedTextStyle,
                                                                  )))
                                                              : Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              12,
                                                                          right:
                                                                              13,
                                                                          top:
                                                                              35),
                                                                  child: GridView
                                                                      .builder(
                                                                    shrinkWrap:
                                                                        true,
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        mainAxisSpacing:
                                                                            50,
                                                                        childAspectRatio:
                                                                            2 /
                                                                                2,
                                                                        crossAxisSpacing:
                                                                            25),
                                                                    itemCount: posCtrl
                                                                        .productListViewMainList
                                                                        .length,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            int index) {
                                                                      return Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            13),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                            color: userSubCategoryContainerColor),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Flexible(
                                                                              fit: FlexFit.loose,
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                      child: Transform.translate(
                                                                                          offset: Offset(32, -15),
                                                                                          child: CircleAvatar(
                                                                                            radius: 60,
                                                                                            backgroundColor: userAddButtonColor.withOpacity(0.9),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsets.all(4.5),
                                                                                              child: ClipOval(
                                                                                                child: Image.network(
                                                                                                  (posCtrl.productListViewMainList.isNotEmpty && posCtrl.productListViewMainList[index].imageUrl != null && posCtrl.productListViewMainList[index].imageUrl!.isNotEmpty) ? posCtrl.productListViewMainList[index].imageUrl![0].toString() : 'https://tse3.mm.bing.net/th?id=OIP.2ALRW5urj4F4cRPcktY-tQAAAA&pid=Api&P=0&h=180',
                                                                                                  fit: BoxFit.cover,
                                                                                                  // height: AppScreenUtil().screenHeight(50),
                                                                                                  // width: AppScreenUtil().screenWidth(55),
                                                                                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                                                                    return Image.network(
                                                                                                      'https://tse3.mm.bing.net/th?id=OIP.2ALRW5urj4F4cRPcktY-tQAAAA&pid=Api&P=0&h=180',
                                                                                                      fit: BoxFit.cover,
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ))),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Transform.translate(
                                                                                offset: Offset(5, -10),
                                                                                child: Container(
                                                                                  padding: EdgeInsets.only(right: 2),
                                                                                  color: Colors.transparent,
                                                                                  width: AppScreenUtil().screenWidth(100),
                                                                                  child: Text(
                                                                                    maxLines: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    softWrap: true,
                                                                                    '${posCtrl.productListViewMainList[index].productName}',
                                                                                    style: userFullHalfTextStyle,
                                                                                  ),
                                                                                )),
                                                                            Row(
                                                                              children: [
                                                                                Transform.translate(
                                                                                  offset: Offset(4, 0),
                                                                                  child: Text(
                                                                                    '${posCtrl.productListViewMainList[index].salesPrice}',
                                                                                    style: shiftTotalListTextStyle,
                                                                                  ),
                                                                                ),
                                                                                GestureDetector(
                                                                                    child: Container(
                                                                                      height: AppScreenUtil().screenHeight(16),
                                                                                      width: AppScreenUtil().screenWidth(51),
                                                                                      padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
                                                                                      decoration: BoxDecoration(
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            color: cart.any((cartItem) => cartItem.product.id == posCtrl.productListViewMainList[index].id) ? adminDashBoardDateDropDownContainerBoxShadowColor : Colors.transparent,
                                                                                            offset: Offset(0, 0),
                                                                                            blurRadius: 6,
                                                                                          ),
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(25),
                                                                                        color: cart.any((cartItem) => cartItem.product.id == posCtrl.productListViewMainList[index].id) ? whiteColor : userAddButtonColor,
                                                                                      ),
                                                                                      child: Center(
                                                                                          child: Text(
                                                                                        cart.any((cartItem) => cartItem.product.id == posCtrl.productListViewMainList[index].id) ? 'View cart' : 'Add',
                                                                                        style: cart.any((cartItem) => cartItem.product.id == posCtrl.productListViewMainList[index].id) ? userViewCartButtonTextStyle : userAddButtonTextStyle,
                                                                                      )),
                                                                                    ),
                                                                                    onTap: () {
                                                                                      cartTabCurrentIndex = index;
                                                                                      print('UOM of the product : ${posCtrl.productListViewMainList[index].uom}');
                                                                                      if (cart.any((cartItem) => cartItem.product.id == posCtrl.productListViewMainList[index].id)) {
                                                                                        cartBottomSheet(context, ongoingOrdersById, posCtrl.viewPosOrderByIdResData.status, posCtrl.productOrderId.value);
                                                                                      } else {
                                                                                        addToCart(posCtrl.productListViewMainList[index], 'ProductsFromCategories');
                                                                                        calculateAndSetCalculatedValues();
                                                                                      }
                                                                                    })
                                                                              ],
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                ),
                                                SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(30),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                tappedCategoryItem ==
                                                            'View Orders' ||
                                                        tappedCategoryItem ==
                                                            'Reservation' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Customer' ||
                                                        tappedCategoryItem ==
                                                            'Special Items' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders List'
                                                    ? SizedBox()
                                                    : SizedBox(
                                                        height: AppScreenUtil()
                                                            .screenHeight(10),
                                                      ),
                                                tappedCategoryItem ==
                                                            'View Orders' ||
                                                        tappedCategoryItem ==
                                                            'Reservation' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Customer' ||
                                                        tappedCategoryItem ==
                                                            'Special Items' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders List'
                                                    //     ||
                                                    // tappedOngoingOrderGrid ==
                                                    //     true
                                                    ? SizedBox()
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Category',
                                                            style:
                                                                billingTextStyle,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                veg = !veg;
                                                              });
                                                            },
                                                            child: veg
                                                                ? SvgPicture
                                                                    .asset(
                                                                    ImageCons
                                                                        .vegPos,
                                                                    height: AppScreenUtil()
                                                                        .screenHeight(
                                                                            16),
                                                                  )
                                                                : SvgPicture
                                                                    .asset(
                                                                    ImageCons
                                                                        .nonVegPos,
                                                                    height: AppScreenUtil()
                                                                        .screenHeight(
                                                                            16),
                                                                  ),
                                                          ),
                                                        ],
                                                      ),
                                                tappedCategoryItem ==
                                                            'View Orders' ||
                                                        tappedCategoryItem ==
                                                            'Reservation' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Customer' ||
                                                        tappedCategoryItem ==
                                                            'Special Items' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders List'
                                                    ? SizedBox()
                                                    : SizedBox(
                                                        height: AppScreenUtil()
                                                            .screenHeight(8),
                                                      ),
                                                tappedCategoryItem ==
                                                            'View Orders' ||
                                                        tappedCategoryItem ==
                                                            'Reservation' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Customer' ||
                                                        // specialItemTapped ==
                                                        //     true ||
                                                        tappedCategoryItem ==
                                                            'Special Items' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders List'
                                                    ? SizedBox()
                                                    : Center(
                                                        child: Text(
                                                          'What'
                                                          's on your mind ...',
                                                          style: whatsTextStyle,
                                                        ),
                                                      ),
                                                tappedCategoryItem ==
                                                            'View Orders' ||
                                                        tappedCategoryItem ==
                                                            'Reservation' ||
                                                        tappedCategoryItem ==
                                                            'Ongoing Orders' ||
                                                        tappedCategoryItem ==
                                                            'Customer' ||
                                                        tappedCategoryItem ==
                                                            'Special Items'
                                                    ? SizedBox(
                                                        height: AppScreenUtil()
                                                            .screenHeight(2),
                                                      )
                                                    : SizedBox(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          // if (posCtrl
                                                          //     .isAddOrderFromChDraftTapped
                                                          //     .value) {
                                                          tappedCategoryItem =
                                                              'Home';
                                                          // specialItemTapped =
                                                          //     false;
                                                          tappedCategoryItem =
                                                              '';
                                                          // tappedOngoingOrderGrid =
                                                          //     false;

                                                          // }
                                                        });
                                                      },
                                                      child: Card(
                                                        elevation: tappedCategoryItem == 'View Orders' ||
                                                                tappedCategoryItem ==
                                                                    'Reservation' ||
                                                                tappedCategoryItem ==
                                                                    'Customer' ||
                                                                tappedCategoryItem ==
                                                                    'Special Items' ||
                                                                tappedCategoryItem ==
                                                                    'Ongoing Orders' ||
                                                                tappedCategoryItem ==
                                                                    'Ongoing Orders List'
                                                            // ||
                                                            // specialItemTapped ==
                                                            //     true
                                                            ? 0
                                                            : 0.3,
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    2, 0, 2, 0),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        16),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        39),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: tappedCategoryItem == 'View Orders' ||
                                                                          tappedCategoryItem ==
                                                                              'Reservation' ||
                                                                          tappedCategoryItem ==
                                                                              'Customer' ||
                                                                          tappedCategoryItem ==
                                                                              'Special Items' ||
                                                                          tappedCategoryItem ==
                                                                              'Ongoing Orders' ||
                                                                          tappedCategoryItem ==
                                                                              'Ongoing Orders List'
                                                                      //     ||
                                                                      // specialItemTapped ==
                                                                      //     true
                                                                      ? Colors
                                                                          .transparent
                                                                      : adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2),
                                                                  blurRadius: 6,
                                                                ),
                                                              ],
                                                              color: tappedCategoryItem == 'View Orders' ||
                                                                      tappedCategoryItem ==
                                                                          'Reservation' ||
                                                                      tappedCategoryItem ==
                                                                          'Customer' ||
                                                                      tappedCategoryItem ==
                                                                          'Special Items' ||
                                                                      tappedCategoryItem ==
                                                                          'Ongoing Orders' ||
                                                                      tappedCategoryItem ==
                                                                          'Ongoing Orders List'
                                                                  //     ||
                                                                  // specialItemTapped ==
                                                                  //     true
                                                                  ? Colors
                                                                      .transparent
                                                                  : whiteColor,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                  Icons.home,
                                                                  size: 10,
                                                                  color:
                                                                      confirmColor,
                                                                ),
                                                                SizedBox(
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          2),
                                                                ),
                                                                Text(
                                                                  'Home',
                                                                  style:
                                                                      homeLocationTextStyle,
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                    ),
                                                    tappedCategoryItem ==
                                                            'View Orders'
                                                        ? GestureDetector(
                                                            onTap: () {},
                                                            child: Card(
                                                              elevation: 0.3,
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          16),
                                                                  width:
                                                                      AppScreenUtil()
                                                                          .screenWidth(
                                                                              60),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color:
                                                                            adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                        offset: Offset(
                                                                            1,
                                                                            2),
                                                                        blurRadius:
                                                                            6,
                                                                      ),
                                                                    ],
                                                                    color:
                                                                        whiteColor,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .list,
                                                                        size:
                                                                            10,
                                                                        color:
                                                                            confirmColor,
                                                                      ),
                                                                      SizedBox(
                                                                        width: AppScreenUtil()
                                                                            .screenWidth(2),
                                                                      ),
                                                                      Flexible(
                                                                          child:
                                                                              Text(
                                                                        'View Orders',
                                                                        style:
                                                                            homeLocationTextStyle,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ))
                                                                    ],
                                                                  )),
                                                            ),
                                                          )
                                                        : tappedCategoryItem ==
                                                                'Reservation'
                                                            ? Card(
                                                                elevation: 0.3,
                                                                child:
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            4,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                        height: AppScreenUtil().screenHeight(
                                                                            16),
                                                                        width: AppScreenUtil().screenWidth(
                                                                            58),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                              offset: Offset(1, 2),
                                                                              blurRadius: 6,
                                                                            ),
                                                                          ],
                                                                          color:
                                                                              whiteColor,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            SvgPicture.asset(
                                                                              ImageCons.imgPosReservation,
                                                                              height: 9,
                                                                            ),
                                                                            SizedBox(
                                                                              width: AppScreenUtil().screenWidth(4),
                                                                            ),
                                                                            Flexible(
                                                                                child: Text(
                                                                              'Reservation',
                                                                              style: homeLocationTextStyle,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ))
                                                                          ],
                                                                        )),
                                                              )
                                                            : tappedCategoryItem ==
                                                                        'Ongoing Orders' ||
                                                                    tappedCategoryItem ==
                                                                        'Ongoing Orders List'
                                                                ? GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child: Card(
                                                                      elevation:
                                                                          0.3,
                                                                      child: Container(
                                                                          padding: EdgeInsets.fromLTRB(3, 0, 2, 0),
                                                                          height: AppScreenUtil().screenHeight(16),
                                                                          width: AppScreenUtil().screenWidth(75),
                                                                          decoration: BoxDecoration(
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                                offset: Offset(1, 1),
                                                                                blurRadius: 6,
                                                                              ),
                                                                            ],
                                                                            color:
                                                                                whiteColor,
                                                                          ),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              SvgPicture.asset(
                                                                                color: confirmColor,
                                                                                ImageCons.helpOrders,
                                                                                height: 8,
                                                                              ),
                                                                              SizedBox(
                                                                                width: AppScreenUtil().screenWidth(3),
                                                                              ),
                                                                              Flexible(
                                                                                  child: Text(
                                                                                'Ongoing Orders',
                                                                                style: homeLocationTextStyle,
                                                                                overflow: TextOverflow.clip,
                                                                              ))
                                                                            ],
                                                                          )),
                                                                    ),
                                                                  )
                                                                : tappedCategoryItem ==
                                                                        'Customer'
                                                                    ? GestureDetector(
                                                                        onTap:
                                                                            () {},
                                                                        child:
                                                                            Card(
                                                                          elevation:
                                                                              0.3,
                                                                          child: Container(
                                                                              padding: EdgeInsets.fromLTRB(3, 0, 2, 0),
                                                                              height: AppScreenUtil().screenHeight(16),
                                                                              width: AppScreenUtil().screenWidth(51),
                                                                              decoration: BoxDecoration(
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                                    offset: Offset(1, 2),
                                                                                    blurRadius: 6,
                                                                                  ),
                                                                                ],
                                                                                color: whiteColor,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  SvgPicture.asset(
                                                                                    color: confirmColor,
                                                                                    ImageCons.posCustomer,
                                                                                    height: 8,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: AppScreenUtil().screenWidth(3),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Text(
                                                                                      'Customer',
                                                                                      style: homeLocationTextStyle,
                                                                                      overflow: TextOverflow.clip,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )),
                                                                        ),
                                                                      )
                                                                    : tappedCategoryItem ==
                                                                            'Special Items'
                                                                        ? GestureDetector(
                                                                            onTap:
                                                                                () {},
                                                                            child:
                                                                                Card(
                                                                              elevation: 0.3,
                                                                              child: Container(
                                                                                  padding: EdgeInsets.fromLTRB(5, 0, 2, 1),
                                                                                  height: AppScreenUtil().screenHeight(16),
                                                                                  width: AppScreenUtil().screenWidth(63),
                                                                                  decoration: BoxDecoration(
                                                                                    boxShadow: const [
                                                                                      BoxShadow(
                                                                                        color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                                        offset: Offset(1, 2),
                                                                                        blurRadius: 6,
                                                                                      ),
                                                                                    ],
                                                                                    color: whiteColor,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SvgPicture.asset(
                                                                                        color: confirmColor,
                                                                                        ImageCons.imgPosSpecialItems,
                                                                                        height: 6.5,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: AppScreenUtil().screenWidth(3),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Text(
                                                                                          'Special Items',
                                                                                          style: homeLocationTextStyle,
                                                                                          overflow: TextOverflow.clip,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  )),
                                                                            ),
                                                                          )
                                                                        : SizedBox(),
                                                    tappedCategoryItem ==
                                                            'Reservation'
                                                        ? Expanded(
                                                            child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              CustomButton(
                                                                  buttonHeight:
                                                                      AppScreenUtil()
                                                                          .screenHeight(
                                                                              18),
                                                                  buttonWidth:
                                                                      AppScreenUtil()
                                                                          .screenWidth(
                                                                              103),
                                                                  buttonColor:
                                                                      confirmColor,
                                                                  borderRadius:
                                                                      4,
                                                                  buttonText:
                                                                      'Create Reservation',
                                                                  onTap: () {
                                                                    posCtrl
                                                                        .viewReservationList(
                                                                            0);
                                                                    selectedTableIds
                                                                        .clear();
                                                                    addReservation(
                                                                        context,
                                                                        '');
                                                                  },
                                                                  buttonLabelStyle:
                                                                      userAddReservationButtonTextStyle),
                                                            ],
                                                          ))
                                                        : tappedCategoryItem ==
                                                                    'Ongoing Orders' ||
                                                                tappedCategoryItem ==
                                                                    'Ongoing Orders List'
                                                            ? Expanded(
                                                                child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  FlutterSwitch(
                                                                    width: 35,
                                                                    height: 16,
                                                                    toggleSize:
                                                                        10.0,
                                                                    value:
                                                                        tappedOngoingOrderGrid,
                                                                    borderRadius:
                                                                        60.0,
                                                                    padding:
                                                                        2.0,
                                                                    toggleColor: tappedOngoingOrderGrid ==
                                                                            false
                                                                        ? confirmColor
                                                                        : greenColor,
                                                                    switchBorder:
                                                                        Border
                                                                            .all(
                                                                      color: tappedOngoingOrderGrid ==
                                                                              false
                                                                          ? confirmColor
                                                                          : greenColor,
                                                                      width: 1,
                                                                    ),
                                                                    toggleBorder:
                                                                        Border
                                                                            .all(
                                                                      color: tappedOngoingOrderGrid ==
                                                                              false
                                                                          ? confirmColor
                                                                          : greenColor,
                                                                      width: 1,
                                                                    ),
                                                                    activeColor:
                                                                        whiteColor,
                                                                    inactiveColor:
                                                                        whiteColor,
                                                                    onToggle:
                                                                        (val) {
                                                                      setState(
                                                                          () {
                                                                        tappedOngoingOrderGrid =
                                                                            val;

                                                                        // Set the value of tappedCategoryItem based on the switch state
                                                                        tappedCategoryItem = tappedOngoingOrderGrid ==
                                                                                true
                                                                            ? 'Ongoing Orders' // When switch is true, show 'Ongoing Orders'
                                                                            : 'Ongoing Orders List'; // When switch is false, show 'Ongoing Orders List'
                                                                      });
                                                                    },
                                                                  ),
                                                                  // SizedBox(
                                                                  //   width: AppScreenUtil()
                                                                  //       .screenWidth(
                                                                  //           10),
                                                                  // ),
                                                                  // Container(
                                                                  //   padding: EdgeInsets
                                                                  //       .fromLTRB(
                                                                  //           4,
                                                                  //           0,
                                                                  //           4,
                                                                  //           0),
                                                                  //   height: AppScreenUtil()
                                                                  //       .screenHeight(
                                                                  //           17),
                                                                  //   width: AppScreenUtil()
                                                                  //       .screenWidth(
                                                                  //           55),
                                                                  //   decoration: BoxDecoration(
                                                                  //       borderRadius:
                                                                  //           BorderRadius.circular(
                                                                  //               4),
                                                                  //       color: reductionBottomSheetButtonColor
                                                                  //           .withOpacity(0.1)),
                                                                  //   child: Row(
                                                                  //     mainAxisSize:
                                                                  //         MainAxisSize
                                                                  //             .min,
                                                                  //     mainAxisAlignment:
                                                                  //         MainAxisAlignment
                                                                  //             .center,
                                                                  //     crossAxisAlignment:
                                                                  //         CrossAxisAlignment
                                                                  //             .center,
                                                                  //     children: [
                                                                  //       SvgPicture
                                                                  //           .asset(
                                                                  //         ImageCons
                                                                  //             .imgTableFilterIcon,
                                                                  //         height:
                                                                  //             8.63,
                                                                  //         width:
                                                                  //             12.94,
                                                                  //       ),
                                                                  //       SizedBox(
                                                                  //         width:
                                                                  //             AppScreenUtil().screenWidth(5.7),
                                                                  //       ),
                                                                  //       Padding(
                                                                  //         padding: const EdgeInsets
                                                                  //             .only(
                                                                  //             bottom: 3),
                                                                  //         child:
                                                                  //             Text(
                                                                  //           textAlign:
                                                                  //               TextAlign.center,
                                                                  //           'Filter',
                                                                  //           style:
                                                                  //               userCancelReservationTextStyle,
                                                                  //         ),
                                                                  //       )
                                                                  //     ],
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ))
                                                            // : specialItemTapped ==
                                                            //         true
                                                            //     ? GestureDetector(
                                                            //         onTap:
                                                            //             () {},
                                                            //         child: Card(
                                                            //           elevation:
                                                            //               0.3,
                                                            //           child: Container(
                                                            //               padding: EdgeInsets.fromLTRB(3, 0, 2, 0),
                                                            //               height: AppScreenUtil().screenHeight(16),
                                                            //               width: AppScreenUtil().screenWidth(62),
                                                            //               decoration: BoxDecoration(
                                                            //                 boxShadow: const [
                                                            //                   BoxShadow(
                                                            //                     color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                            //                     offset: Offset(1, 2),
                                                            //                     blurRadius: 6,
                                                            //                   ),
                                                            //                 ],
                                                            //                 color:
                                                            //                     whiteColor,
                                                            //               ),
                                                            //               child: Center(
                                                            //                   child: Text(
                                                            //                 'Special Items',
                                                            //                 style:
                                                            //                     homeLocationTextStyle,
                                                            //                 overflow:
                                                            //                     TextOverflow.clip,
                                                            //               ))),
                                                            //         ),
                                                            //       )
                                                            : SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: AppScreenUtil()
                                                      .screenHeight(10),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: SingleChildScrollView(
                                                child: tappedCategoryItem ==
                                                        'View Orders'
                                                    ? UserViewOrder(
                                                        tappedCategoryItem =
                                                                        '',
                                                                    voidFunction:
                                                                        (orderId,
                                                                            ongoingOrdersById) async {
                                                                      cartBottomSheet(
                                                                          context,
                                                                          ongoingOrdersById,
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .status,
                                                                          posCtrl
                                                                              .productOrderId
                                                                              .value);

                                                                      posCtrl.viewPosOrderByIdRes(
                                                                          orderId);
                                                                      cart.clear();

                                                                      setState(
                                                                          () {
                                                                        orderIdFromOngoingOrders =
                                                                            orderId;
                                                                      });
                                                                      print(
                                                                          'OrderId Form Ongoing orders: $orderIdFromOngoingOrders');
                                                                      orderInfo = posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .orderInfo!;
                                                                      addProductsToCart(
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .orderInfo!,
                                                                          posCtrl
                                                                              .productListViewMainList,
                                                                          'ProductsFromOngoing');
                                                                      calculateAndSetCalculatedValues();
                                                                      aggregatorId = posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .aggregatorId;
                                                                      AggregatorsListResModel?
                                                                          aggregator =
                                                                          posCtrl.allAggregatorsViewMainList.firstWhereOrNull((item) =>
                                                                              item.id ==
                                                                              aggregatorId);

                                                                      if (aggregator !=
                                                                          null) {
                                                                        selectedValue =
                                                                            aggregator.name!;
                                                                        print(
                                                                            'Aggregator Name: $selectedValue, Aggregator Id: $selectedValue');
                                                                      }

                                                                      aggregatorRefController
                                                                              .text =
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .aggregatorRef;
                                                        },
                                                      )
                                                    : tappedCategoryItem ==
                                                            'Reservation'
                                                        ? UserReservation(
                                                            tappedCategoryItem =
                                                                '',
                                                            editReservation: (index,
                                                                orderId) async {
                                                            posCtrl.productOrderId
                                                                    .value =
                                                                '${posCtrl.viewAddOrderFromReservationResData.orderId}';
                                                            print(
                                                                'Index of the Reservation list: $index');
                                                            print(
                                                                'Order Id from reservation: $orderId');
                                                            posCtrl
                                                                .viewReservationList(
                                                                    0);
                                                            selectedTableIds
                                                                .clear();
                                                            orderId = orderId;
                                                            addReservation(
                                                                context, index);
                                                          })
                                                        : tappedCategoryItem ==
                                                                'Ongoing Orders List'
                                                            ? OngoingOrdersList(
                                                                tappedCategoryItem =
                                                                    '',
                                                                voidFunction:
                                                                    (orderId,
                                                                        ongoingOrdersById) async {
                                                                  print(
                                                                      '====OrderID: ${posCtrl.productOrderId.value}');
                                                                  orderId = posCtrl
                                                                      .productOrderId
                                                                      .value;
                                                                  cartBottomSheet(
                                                                      context,
                                                                      ongoingOrdersById,
                                                                      posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .status,
                                                                      posCtrl
                                                                          .productOrderId
                                                                          .value);
                                                                  posCtrl.viewPosOrderByIdRes(
                                                                      orderId);
                                                                  print(
                                                                      '====OrderID: $orderId');
                                                                  print(
                                                                      'Order status from Ongoing Orders: ${posCtrl.viewPosOrderByIdResData.status}');
                                                                  cart.clear();

                                                                  orderInfo = posCtrl
                                                                      .viewPosOrderByIdResData
                                                                      .orderInfo!;
                                                                  addProductsToCart(
                                                                      posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .orderInfo!,
                                                                      posCtrl
                                                                          .productListViewMainList,
                                                                      'ProductsFromOngoing');
                                                                  calculateAndSetCalculatedValues();
                                                                  aggregatorId = posCtrl
                                                                      .viewPosOrderByIdResData
                                                                      .aggregatorId;
                                                                  AggregatorsListResModel?
                                                                      aggregator =
                                                                      posCtrl
                                                                          .allAggregatorsViewMainList
                                                                          .firstWhereOrNull((item) =>
                                                                              item.id ==
                                                                              aggregatorId);

                                                                  if (aggregator !=
                                                                      null) {
                                                                    selectedValue =
                                                                        aggregator
                                                                            .name!;
                                                                    print(
                                                                        'Aggregator Name: $selectedValue, Aggregator Id: $selectedValue');
                                                                  }

                                                                  aggregatorRefController
                                                                          .text =
                                                                      posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .aggregatorRef;
                                                                },
                                                                payment: (orderId,
                                                                    isPayment) {
                                                                  print(
                                                                      '====OrderID: ${posCtrl.productOrderId.value}');
                                                                  orderId = posCtrl
                                                                      .productOrderId
                                                                      .value;
                                                                  cartConfirmPayment(
                                                                      context,
                                                                      posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .amtTotal,
                                                                      '${posCtrl.viewPosOrderByIdResData.ordType}',
                                                                      addedCustomerId,
                                                                      orderId,
                                                                      posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .orderDate,
                                                                      'Home',
                                                                      isPayment);
                                                                  posCtrl.viewPosOrderByIdRes(
                                                                      orderId);
                                                                },
                                                              )
                                                            : tappedCategoryItem ==
                                                                    'Ongoing Orders'
                                                                ? OngoingOrdersGrid(
                                                                    tappedCategoryItem =
                                                                        '',
                                                                    voidFunction:
                                                                        (orderId,
                                                                            ongoingOrdersById) async {
                                                                      cartBottomSheet(
                                                                          context,
                                                                          ongoingOrdersById,
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .status,
                                                                          posCtrl
                                                                              .productOrderId
                                                                              .value);

                                                                      posCtrl.viewPosOrderByIdRes(
                                                                          orderId);
                                                                      cart.clear();

                                                                      setState(
                                                                          () {
                                                                        orderIdFromOngoingOrders =
                                                                            orderId;
                                                                      });
                                                                      print(
                                                                          'OrderId Form Ongoing orders: $orderIdFromOngoingOrders');
                                                                      orderInfo = posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .orderInfo!;
                                                                      addProductsToCart(
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .orderInfo!,
                                                                          posCtrl
                                                                              .productListViewMainList,
                                                                          'ProductsFromOngoing');
                                                                      calculateAndSetCalculatedValues();
                                                                      aggregatorId = posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .aggregatorId;
                                                                      AggregatorsListResModel?
                                                                          aggregator =
                                                                          posCtrl.allAggregatorsViewMainList.firstWhereOrNull((item) =>
                                                                              item.id ==
                                                                              aggregatorId);

                                                                      if (aggregator !=
                                                                          null) {
                                                                        selectedValue =
                                                                            aggregator.name!;
                                                                        print(
                                                                            'Aggregator Name: $selectedValue, Aggregator Id: $selectedValue');
                                                                      }

                                                                      aggregatorRefController
                                                                              .text =
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .aggregatorRef;
                                                                    },
                                                                    payment:
                                                                        (orderId,
                                                                            isPayment) {
                                                                      print(
                                                                          '====OrderID: ${posCtrl.productOrderId.value}');
                                                                      orderId = posCtrl
                                                                          .productOrderId
                                                                          .value;
                                                                      cartConfirmPayment(
                                                                          context,
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .amtTotal,
                                                                          '${posCtrl.viewPosOrderByIdResData.ordType}',
                                                                          addedCustomerId,
                                                                          orderId,
                                                                          posCtrl
                                                                              .viewPosOrderByIdResData
                                                                              .orderDate,
                                                                          'Home',
                                                                          isPayment);
                                                                      posCtrl.viewPosOrderByIdRes(
                                                                          orderId);
                                                                    },
                                                                  )
                                                                : tappedCategoryItem ==
                                                                        'Customer'
                                                                    ? PosCustomer()
                                                                    : tappedCategoryItem ==
                                                                            'Special Items'
                                                                        ?
                                                                        // PosTables()
                                                                        // : specialItemTapped ==
                                                                        //         true
                                                                        //     ?
                                                                        SingleChildScrollView(
                                                                            scrollDirection: Axis
                                                                                .vertical,
                                                                            padding: EdgeInsets
                                                                                .only(
                                                                              left: 15,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                SingleChildScrollView(
                                                                                  physics: ClampingScrollPhysics(),
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Container(
                                                                                    color: Colors.transparent,
                                                                                    padding: EdgeInsets.only(right: 60, top: 35),
                                                                                    child: SizedBox(
                                                                                      width: AppScreenUtil().screenWidth(450),
                                                                                      child: GridView.builder(
                                                                                        padding: EdgeInsets.only(top: 10, bottom: 10),
                                                                                        shrinkWrap: true,
                                                                                        physics: NeverScrollableScrollPhysics(),
                                                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 50, childAspectRatio: 3 / 4),
                                                                                        itemCount: 3,
                                                                                        itemBuilder: (BuildContext context, int index) {
                                                                                          return GestureDetector(
                                                                                            onTap: () {
                                                                                              setState(() {
                                                                                                tappedOffer = 'Friday Special';
                                                                                              });
                                                                                              comboDetail(context);
                                                                                            },
                                                                                            child: Container(
                                                                                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: userSpecialItemGridBackgroundColor.withOpacity(0.4), border: Border.all(color: userSpecialItemGridBorderColor)),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Column(
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Transform.translate(
                                                                                                            offset: Offset(35, -43),
                                                                                                            child: Align(
                                                                                                              alignment: Alignment.topRight,
                                                                                                              child: Container(
                                                                                                                padding: EdgeInsets.all(6.5),
                                                                                                                // Border width
                                                                                                                decoration: BoxDecoration(color: userSpecialItemGridImageColor.withOpacity(0.75), shape: BoxShape.circle),
                                                                                                                child: ClipOval(
                                                                                                                  child: SizedBox(
                                                                                                                    height: AppScreenUtil().screenHeight(60),
                                                                                                                    width: AppScreenUtil().screenHeight(60),
                                                                                                                    child: Image.network('https://c4.wallpaperflare.com/wallpaper/984/944/941/burger-french-fries-hamburger-wallpaper-preview.jpg', fit: BoxFit.cover),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Transform.translate(
                                                                                                            offset: Offset(0, -37),
                                                                                                            child: Text(
                                                                                                              'Friday Special',
                                                                                                              style: gridUserSpecialItemLabelStyle,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            flex: 20,
                                                                                                            child: Transform.translate(
                                                                                                              offset: Offset(0, -31),
                                                                                                              child: Column(
                                                                                                                  children: List.generate(2, (index) {
                                                                                                                return Row(
                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    SvgPicture.asset(
                                                                                                                      ImageCons.imgUserSpecialItemsDot,
                                                                                                                      color: userSpecialItemGridImageColor.withOpacity(0.75),
                                                                                                                      height: 6.8,
                                                                                                                    ),
                                                                                                                    SizedBox(
                                                                                                                      width: AppScreenUtil().screenWidth(5),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      'Beef Burger',
                                                                                                                      style: gridUserSpecialItemSubTextStyle,
                                                                                                                    )
                                                                                                                  ],
                                                                                                                );
                                                                                                              })),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                              flex: 15,
                                                                                                              child: Transform.translate(
                                                                                                                offset: Offset(-10, -10),
                                                                                                                child: Align(alignment: Alignment.topRight, child: CustomButton(buttonHeight: AppScreenUtil().screenHeight(20), buttonWidth: AppScreenUtil().screenWidth(55), buttonColor: userSpecialItemGridImageColor.withOpacity(0.75), borderRadius: 10.0, buttonText: 'Add', buttonLabelStyle: userAddButtonTextStyle)),
                                                                                                              ))
                                                                                                        ],
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                )),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SingleChildScrollView(
                                                                                  physics: ClampingScrollPhysics(),
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Container(
                                                                                      color: Colors.transparent,
                                                                                      padding: EdgeInsets.only(right: 60),
                                                                                      child: SizedBox(
                                                                                        width: AppScreenUtil().screenWidth(450),
                                                                                        child: GridView.builder(
                                                                                          padding: EdgeInsets.only(top: 44, bottom: 45),
                                                                                          shrinkWrap: true,
                                                                                          physics: NeverScrollableScrollPhysics(),
                                                                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 50, childAspectRatio: 3 / 4),
                                                                                          itemCount: 3,
                                                                                          itemBuilder: (BuildContext context, int index) {
                                                                                            return GestureDetector(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  tappedOffer = 'Pizza Combo';
                                                                                                });
                                                                                                comboDetail(context);
                                                                                              },
                                                                                              child: Container(
                                                                                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                                                                                decoration: BoxDecoration(
                                                                                                  border: Border.all(color: userComboItemGridBorderColor),
                                                                                                  borderRadius: BorderRadius.circular(13),
                                                                                                  color: userComboItemGridBackgroundColor.withOpacity(0.65),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Transform.translate(
                                                                                                      offset: Offset(35, -43),
                                                                                                      child: Align(
                                                                                                        alignment: Alignment.topRight,
                                                                                                        child: Container(
                                                                                                          padding: EdgeInsets.all(6.5),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: userComboItemGridImageColor.withOpacity(0.75),
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: ClipOval(
                                                                                                            child: SizedBox(
                                                                                                              height: AppScreenUtil().screenHeight(60),
                                                                                                              width: AppScreenUtil().screenWidth(60),
                                                                                                              child: Image.network(
                                                                                                                'https://c4.wallpaperflare.com/wallpaper/984/944/941/burger-french-fries-hamburger-wallpaper-preview.jpg',
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        Transform.translate(
                                                                                                          offset: Offset(0, -55),
                                                                                                          child: SvgPicture.asset(
                                                                                                            ImageCons.imgUserSpecialItemsTag,
                                                                                                            height: 20,
                                                                                                            width: 65,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Transform.translate(
                                                                                                          offset: Offset(9, -44),
                                                                                                          child: Text(
                                                                                                            'AED 5.00',
                                                                                                            style: userComboTagPriceTextStyle,
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                    ),
                                                                                                    Transform.translate(
                                                                                                      offset: Offset(0, -49),
                                                                                                      child: Text(
                                                                                                        'Pizza Combo',
                                                                                                        style: gridUserSpecialItemLabelStyle,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Stack(
                                                                                                      alignment: Alignment.center,
                                                                                                      children: [
                                                                                                        Transform.translate(
                                                                                                          offset: Offset(0, -45),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: List.generate(2, (index) {
                                                                                                              return Row(
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  SvgPicture.asset(
                                                                                                                    ImageCons.imgUserSpecialItemsDot,
                                                                                                                    color: userComboItemGridImageColor.withOpacity(0.75),
                                                                                                                    height: 6.8,
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    width: AppScreenUtil().screenWidth(5),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    'Beef Burger',
                                                                                                                    style: gridUserSpecialItemSubTextStyle,
                                                                                                                  )
                                                                                                                ],
                                                                                                              );
                                                                                                            }),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Transform.translate(
                                                                                                          offset: Offset(-10, -10),
                                                                                                          child: Align(
                                                                                                            alignment: Alignment.topRight,
                                                                                                            child: CustomButton(
                                                                                                              buttonHeight: AppScreenUtil().screenHeight(18),
                                                                                                              buttonWidth: AppScreenUtil().screenWidth(55),
                                                                                                              buttonColor: userComboItemGridImageColor.withOpacity(0.75),
                                                                                                              borderRadius: 10.0,
                                                                                                              buttonText: 'AED 7.00',
                                                                                                              buttonLabelStyle: userAddButtonTextStyle,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      )),
                                                                                )
                                                                              ],
                                                                            ))
                                                                        : Obx(
                                                                            () {
                                                                            return (posCtrl.tappedCategoryItem.value == 'Home' || categoriesTapped == false)
                                                                                ? (posCtrl.allCategoriesViewDetailsLoading.value == true)
                                                                                    ? SizedBox(
                                                                                        height: MediaQuery.of(context).size.height / 3,
                                                                                        child: const Center(
                                                                                          child: CircularProgressIndicator(
                                                                                            color: confirmColor,
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : (posCtrl.isAllCategoriesListError.value == true)
                                                                                        ? SizedBox(
                                                                                            height: MediaQuery.of(context).size.height / 3,
                                                                                            child: const Center(child: EmptyLayout()),
                                                                                          )
                                                                                        : (posCtrl.allCategoriesViewMainList.isEmpty)
                                                                                            ? SizedBox(
                                                                                                height: MediaQuery.of(context).size.height / 3,
                                                                                                child: Center(
                                                                                                  child: Text(
                                                                                                    'Something Went Wrong',
                                                                                                    style: bookedTextStyle,
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            : Padding(
                                                                                                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                                                                                                child: RefreshIndicator(
                                                                                                  color: confirmColor,
                                                                                                  onRefresh: () async {
                                                                                                    await posCtrl.getAllCategoriesList(veg);
                                                                                                  },
                                                                                                  child: GridView.builder(
                                                                                                    shrinkWrap: true,
                                                                                                    physics: NeverScrollableScrollPhysics(),
                                                                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                      crossAxisCount: 4,
                                                                                                      mainAxisSpacing: 15,
                                                                                                      crossAxisSpacing: 25,
                                                                                                    ),
                                                                                                    itemCount: posCtrl.allCategoriesViewMainList.length,
                                                                                                    itemBuilder: (BuildContext context, int index) {
                                                                                                      return GestureDetector(
                                                                                                        child: Column(
                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Image.network(
                                                                                                              posCtrl.allCategoriesViewMainList[index].imageUrl ?? 'N/A',
                                                                                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                                                                                return Image.network(
                                                                                                                  'https://tse1.mm.bing.net/th?id=OIP.UYefmuqvYGCqQqZN9xaW8QHaGp&pid=Api&P=0&h=180',
                                                                                                                  height: AppScreenUtil().screenHeight(45),
                                                                                                                  width: AppScreenUtil().screenWidth(54),
                                                                                                                );
                                                                                                              },
                                                                                                              height: AppScreenUtil().screenHeight(45),
                                                                                                              width: AppScreenUtil().screenWidth(54),
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              height: AppScreenUtil().screenHeight(2),
                                                                                                            ),
                                                                                                            Flexible(
                                                                                                              fit: FlexFit.loose,
                                                                                                              child: Text(
                                                                                                                posCtrl.allCategoriesViewMainList[index].categoryName ?? 'N/A',
                                                                                                                style: whatsTextStyle,
                                                                                                                overflow: TextOverflow.clip,
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                        ),
                                                                                                        onTap: () {
                                                                                                          setState(() {
                                                                                                            categoriesTapped = true;
                                                                                                            tappedCategoryItem = posCtrl.allCategoriesViewMainList[index].categoryName;
                                                                                                            mainCatId = '${posCtrl.allCategoriesViewMainList[index].id}';
                                                                                                            posCtrl.getCategoriesList(mainCatId);
                                                                                                            posCtrl.getProductListForPOS(mainCatId, catId);
                                                                                                            print('Main CatId *************: $mainCatId');
                                                                                                          });
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                : SizedBox();
                                                                          })))
                                      ]))
                      ],
                    )))));
  }

  void comboDetail(BuildContext context) {
    showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              width: double.infinity,
              height: AppScreenUtil().screenHeight(227),
              decoration: BoxDecoration(
                color: constantWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: AppScreenUtil().screenWidth(50),
                      child: Center(
                        child: Divider(
                          thickness: 2.3,
                          color: dividerColor.withOpacity(0.98),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tappedOffer,
                        style: userCartPriceTextStyle,
                      ),
                      tappedOffer == 'Pizza Combo'
                          ? Stack(
                              children: [
                                SvgPicture.asset(
                                    ImageCons.imgUserSpecialItemsTag),
                                Transform.translate(
                                  offset: Offset(9, 11),
                                  child: Text(
                                    'AED 5.00',
                                    style: userComboTagPriceTextStyle,
                                  ),
                                )
                              ],
                            )
                          : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Container(
                      height: AppScreenUtil().screenHeight(20),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgUserSpecialItemsDot,
                                color: userComboItemGridImageColor
                                    .withOpacity(0.75),
                                height: 8,
                              ),
                              SizedBox(
                                width: AppScreenUtil().screenWidth(7),
                              ),
                              Text(
                                'Beef Burger',
                                style: userSubTextStyle,
                              )
                            ],
                          ),
                          Transform.translate(
                            offset: Offset(11, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'AED 2.00',
                                  style: cartItemTitleStyle,
                                ),
                                Transform.scale(
                                  scale: 0.95,
                                  child: Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return const BorderSide(
                                              width: 1, color: blackColor);
                                        }
                                        return const BorderSide(
                                            width: 1, color: blackColor);
                                      },
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    checkColor: whiteColor,
                                    activeColor: blackColor,
                                    hoverColor: blackColor,
                                    value: _isChecked,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        _isChecked = newValue ?? false;
                                      });

                                      print('Checkbox value: $_isChecked');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 3);
                    },
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 7, right: 7),
                        height: AppScreenUtil().screenHeight(32),
                        width: AppScreenUtil().screenWidth(77),
                        decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.remove,
                              color: whiteColor,
                              size: 17,
                            ),
                            Text(
                              '$_count',
                              style: userCartCountTextStyle,
                            ),
                            Icon(
                              Icons.add,
                              color: whiteColor,
                              size: 16.5,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 3),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 13),
                          height: AppScreenUtil().screenHeight(32),
                          width: AppScreenUtil().screenWidth(128),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: confirmColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                ImageCons.imgUserAdd,
                                width: 16,
                                color: whiteColor,
                              ),
                              Text(
                                'Add to cart',
                                style: userAddToCartBottomStyle,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          });
        });
  }

  void addReservation(BuildContext context, index) {
    print('Current Date And Time: $currentDate and $currentTime');
    if (index != '') {
      selectedDropdownValue =
          '${posCtrl.viewReservationListResData.list![index].customerNameL}';

// Find the selected customer from the dropdown list
      final selectedItem = posCtrl.customerDropdownViewMainList
          .firstWhereOrNull((item) => item.name == selectedDropdownValue);
      if (selectedItem != null) {
        addedCustomerId = '${selectedItem.id}';
        print('Selected Customer: $addedCustomerId');
      } else {
        print('No customer found with the name: $selectedDropdownValue');
        selectedFloorValue = null;
      }

      mobileController.text =
          '${posCtrl.viewReservationListResData.list![index].mobileNo}';
      dateController.text =
          posCtrl.viewReservationListResData.list![index].date;
      timeController.text =
          '${posCtrl.viewReservationListResData.list![index].time}';
      totalPersonController.text =
          '${posCtrl.viewReservationListResData.list![index].totalPerson}';
      noteController.text =
          '${posCtrl.viewReservationListResData.list![index].note}';
      selectedFloorId =
          '${posCtrl.viewReservationListResData.list![index].floorId}';
      final selectedTableItem = tableCtrl.viewFloorMainList
          .firstWhereOrNull((item) => item.id == selectedFloorId);
      selectedFloorValue = '${selectedTableItem?.nameOfFloor}';
      print('Selected Floor: ${selectedTableItem?.nameOfFloor}');
      // Explicit casting
      List<String>? tableIds =
          posCtrl.viewReservationListResData.list![index].tableId;

      if (tableIds != null) {
        selectedTableIds.addAll(tableIds);
      } else {
        // Handle the case where tableId is null
        print('tableId is null');
      }

      print('Selected Tables: $selectedTableIds');
    }
    dateController.text = currentDate;
    timeController.text = currentTime;
    print('Floor Id From Initialisation :${tappedFloorIndex}');
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25), // Set border radius here
              ),
              child: Container(
                  padding: EdgeInsets.fromLTRB(18, 5, 18, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: constantWhite,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(-72, 17),
                          child: SizedBox(
                            width: AppScreenUtil().screenWidth(31),
                            child: Divider(
                                color: subDividerColor.withOpacity(0.2),
                                thickness: 1.1),
                          ),
                        ),
                        Text(
                          'Add Reservation',
                          style: addReservationTextStyle,
                        ),
                        Transform.translate(
                          offset: Offset(72, -16),
                          child: SizedBox(
                            width: AppScreenUtil().screenWidth(31),
                            child: Divider(
                                color: subDividerColor.withOpacity(0.2),
                                thickness: 1.1),
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(5),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(37),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                  width: AppScreenUtil().screenWidth(8),
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 12),
                                  child: GestureDetector(
                                      onTap: () {
                                        addCustomer(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            color: confirmColor,
                                            height: double.infinity,
                                            width: AppScreenUtil()
                                                .screenWidth(1.2),
                                          ),
                                          SizedBox(
                                            width:
                                                AppScreenUtil().screenWidth(8),
                                          ),
                                          Icon(
                                            Icons.add,
                                            color: confirmColor,
                                            size: 19,
                                          )
                                        ],
                                      ))),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Customer',
                              labelStyle: addReservationLabelTextStyle,
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                    color: labelTextFieldBorderColor),
                              ),
                            ),
                            child: Obx(
                              () => (posCtrl.customerDropdownViewDetailsLoading
                                          .value ==
                                      true)
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: confirmColor,
                                        ),
                                      ),
                                    )
                                  : (posCtrl.isCustomerDropdownListError
                                              .value ==
                                          true)
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              bottom: AppScreenUtil()
                                                  .screenHeight(30)),
                                          child: AppErrorScreen(
                                            buttonOnTap: () {
                                              posCtrl.getCustomerDropdownList();
                                            },
                                          ),
                                        )
                                      : (posCtrl.customerDropdownViewMainList
                                              .isEmpty)
                                          ? SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              child: const Center(
                                                  child: EmptyLayout()))
                                          : DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.transparent,
                                                ),
                                                value: selectedDropdownValue,
                                                items: posCtrl
                                                    .customerDropdownViewMainList
                                                    .map(
                                                        (ViewCustomerForDropdownResModel
                                                            item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.name,
                                                    child: Text(
                                                      '${item.name}',
                                                      style: subTitleTextStyle,
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedDropdownValue =
                                                        newValue?.isEmpty ??
                                                                true
                                                            ? null
                                                            : newValue;

                                                    // Assuming _selectedItem is the selected value from the dropdown
                                                    ViewCustomerForDropdownResModel?
                                                        selectedItem = posCtrl
                                                            .customerDropdownViewMainList
                                                            .firstWhereOrNull(
                                                                (item) =>
                                                                    item.name ==
                                                                    selectedDropdownValue);

                                                    if (selectedItem != null) {
                                                      addedCustomerId =
                                                          selectedItem.id!;
                                                      mobileController.text =
                                                          selectedItem
                                                              .mobileNo!;
                                                      print(
                                                          'Selected Customer Mobile: ${mobileController.text}');
                                                    } else {
                                                      // Fallback if no item is selected, you might want to handle this case properly
                                                      addedCustomerId = posCtrl
                                                          .viewCashCustomerResData
                                                          .id!;

                                                      print(
                                                          'Fallback Customer Mobile: ${mobileController.text}');
                                                    }
                                                  });
                                                },
                                                isExpanded: true,
                                              ),
                                            ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        LabelTextField(
                          maxLines: 1,
                          labelText: 'Mobile',
                          controller: mobileController,
                          isNumberField: true,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        LabelTextField(
                          maxLines: 1,
                          onTap: () async {
                            dateSelection(controller: dateController);
                          },
                          labelText: 'Date',
                          controller: dateController,
                          isDate: true,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        LabelTextField(
                            maxLines: 1,
                            labelText: 'Time',
                            onTap: () async {
                              _selectTime(controller: timeController);
                            },
                            isTime: true,
                            controller: timeController),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        LabelTextField(
                            maxLines: 1,
                            labelText: 'Total Person',
                            controller: totalPersonController),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        LabelTextField(
                            maxLines: 5,
                            textFieldSize: 65,
                            labelText: 'Note',
                            controller: noteController),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Obx(
                          () => (tableCtrl.viewFloorDetailsLoading.value ==
                                  true)
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: confirmColor,
                                    ),
                                  ),
                                )
                              : (tableCtrl.isViewFloorListError.value == true)
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              AppScreenUtil().screenHeight(30)),
                                      child: AppErrorScreen(
                                        buttonOnTap: () {
                                          tableCtrl.getViewFloorList();
                                        },
                                      ),
                                    )
                                  : (tableCtrl.viewFloorMainList.isEmpty)
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          child: const Center(
                                              child: EmptyLayout()))
                                      : SizedBox(
                                          height: 37.5,
                                          child: FormField<String>(
                                            builder:
                                                (FormFieldState<String> state) {
                                              return InputDecorator(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 9),
                                                  labelText: 'Floor',
                                                  labelStyle:
                                                      labelTextInputTextStyle,
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      borderSide: BorderSide(
                                                          color:
                                                              labelTextFieldBorderColor)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      borderSide: BorderSide(
                                                          color:
                                                              labelTextFieldBorderColor)),
                                                  errorBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      borderSide: BorderSide(
                                                          color:
                                                              labelTextFieldBorderColor)),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  labelTextFieldBorderColor)),
                                                ),
                                                isEmpty:
                                                    selectedFloorValue == '',
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: confirmColor,
                                                    ),
                                                    value: selectedFloorValue,
                                                    isDense: true,
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        selectedFloorValue =
                                                            newValue;
                                                        tappedFloorIndex =
                                                            tableCtrl
                                                                .viewFloorMainList
                                                                .indexWhere(
                                                          (item) =>
                                                              item.nameOfFloor ==
                                                              newValue,
                                                        );
                                                        selectedFloorId =
                                                            '${tableCtrl.viewFloorMainList[tappedFloorIndex].id}';

                                                        tableCtrl
                                                            .getAllFloorDesignsList(
                                                                '${tableCtrl.viewFloorMainList[tappedFloorIndex].id}');

                                                        state.didChange(
                                                            newValue);
                                                      });
                                                    },
                                                    items: tableCtrl
                                                        .viewFloorMainList
                                                        .map((ViewFloorResModel
                                                            item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: item.nameOfFloor,
                                                        child: Text(
                                                          '${item.nameOfFloor}',
                                                          style:
                                                              labelTextInputTextStyle,
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        selectedFloorValue == null
                            ? SizedBox()
                            : Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Add Table',
                                      style: addTotalPersonTextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(10),
                                  ),
                                  Obx(
                                    () => (tableCtrl.isViewFloorDesignLoading
                                                .value ==
                                            true)
                                        ? SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3,
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                color: confirmColor,
                                              ),
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Wrap(
                                              direction: Axis.horizontal,
                                              runSpacing: 13,
                                              children: List<Widget>.generate(
                                                  tableCtrl
                                                      .viewFloorDesignResData
                                                      .floorCanvas!
                                                      .where((item) =>
                                                          item.type == 'TABLE')
                                                      .length, (int index) {
                                                var tableItem = tableCtrl
                                                    .viewFloorDesignResData
                                                    .floorCanvas!
                                                    .where((item) =>
                                                        item.type == 'TABLE')
                                                    .toList()[index];
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (selectedTableIds
                                                          .contains(
                                                              tableItem.id)) {
                                                        // Table is already selected, so remove it
                                                        selectedTableIds.remove(
                                                            tableItem.id);
                                                      } else {
                                                        // Table is not selected, so add it
                                                        selectedTableIds
                                                            .add(tableItem.id!);
                                                      }
                                                    });
                                                    print(
                                                        'Selected TableIds: $selectedTableIds');
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Container(
                                                      height: AppScreenUtil()
                                                          .screenHeight(34),
                                                      width: AppScreenUtil()
                                                          .screenWidth(38),
                                                      decoration: BoxDecoration(
                                                          color: selectedTableIds
                                                                  .contains(
                                                                      tableItem
                                                                          .id)
                                                              ? confirmColor
                                                              : whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(11),
                                                          border: Border.all(
                                                              color:
                                                                  confirmColor,
                                                              width: 1.3)),
                                                      child: Center(
                                                        child: Text(
                                                          '${tableItem.name}',
                                                          style: selectedTableIds
                                                                  .contains(
                                                                      tableItem
                                                                          .id)
                                                              ? paymentMethodTextStyle
                                                              : addTotalPersonTextStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(15),
                                  ),
                                ],
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => (posCtrl.isAddReservationLoading.value ==
                                      true)
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ))
                                  : InkWell(
                                      child: Container(
                                          width:
                                              AppScreenUtil().screenWidth(70),
                                          height:
                                              AppScreenUtil().screenHeight(20),
                                          decoration: BoxDecoration(
                                              color: confirmColor,
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              border: Border.all(
                                                  color: confirmColor)),
                                          child: Center(
                                            child: Text('Submit',
                                                style: submitTextStyle,
                                                textAlign: TextAlign.center),
                                          )),
                                      onTap: () {
                                        if (isValidCustomerName &&
                                            customerMobileController.text !=
                                                null &&
                                            selectedTableIds.isNotEmpty &&
                                            selectedFloorId != null) {
                                          String dateTimeString =
                                              '${dateController.text} '
                                              '${timeController.text}';
                                          String modifiedString =
                                              dateTimeString.substring(
                                                  0, dateTimeString.length - 3);
                                          print(
                                              'Customer ID: $addedCustomerId, MobileNo: ${mobileController.text}, date: $modifiedString, Time: ${timeController.text}, Total person: ${totalPersonController.text}, Note: ${noteController.text}, FloorId: ${selectedFloorId}, TableId: ${selectedTableIds}');
                                          index != ''
                                              ? posCtrl
                                                  .editReservation(
                                                      selectedTableIds,
                                                      dateTimeString,
                                                      mobileController.text,
                                                      addedCustomerId,
                                                      selectedFloorId,
                                                      noteController.text,
                                                      timeController.text,
                                                      totalPersonController
                                                          .text,
                                                      '${posCtrl.viewReservationListResData.list![index].id}')
                                                  .then((value) {
                                                  print(
                                                      'Add Customer : $value');
                                                  if (value == true) {
                                                    posCtrl
                                                        .viewReservationList(0);
                                                    _selectedItem =
                                                        posCtrl.addedCustomer;
                                                    print(
                                                        'Added Customer ${posCtrl.addedCustomer}');
                                                    selectedTableIds.clear();
                                                    mobileController.clear();
                                                    noteController.clear();
                                                    timeController.clear();
                                                    totalPersonController
                                                        .clear();
                                                    addedCustomerId = '';
                                                    selectedFloorId = '';
                                                    selectedDropdownValue =
                                                        null;
                                                    selectedFloorValue = null;
                                                    Navigator.pop(context);
                                                  }
                                                })
                                              : posCtrl
                                                  .addReservation(
                                                  selectedTableIds,
                                                  dateTimeString,
                                                  mobileController.text,
                                                  addedCustomerId,
                                                  selectedFloorId,
                                                  noteController.text,
                                                  timeController.text,
                                                  totalPersonController.text,
                                                )
                                                  .then((value) {
                                                  print(
                                                      'Add Customer : $value');
                                                  if (value == true) {
                                                    posCtrl
                                                        .viewReservationList(0);
                                                    _selectedItem =
                                                        posCtrl.addedCustomer;
                                                    print(
                                                        'Added Customer ${posCtrl.addedCustomer}');
                                                    selectedTableIds.clear();
                                                    mobileController.clear();
                                                    noteController.clear();
                                                    timeController.clear();
                                                    totalPersonController
                                                        .clear();
                                                    addedCustomerId = '';
                                                    selectedFloorId = '';
                                                    selectedDropdownValue =
                                                        null;
                                                    selectedFloorValue = null;
                                                    Navigator.pop(context);
                                                  }
                                                });
                                        } else {
                                          addReservationError(context);
                                        }
                                        // selectedTableIds.clear();
                                      },
                                    ),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(8),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: AppScreenUtil().screenWidth(70),
                                  height: AppScreenUtil().screenHeight(20),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(color: confirmColor)),
                                  child: Center(
                                    child: Text('Back',
                                        style: backTextStyle,
                                        textAlign: TextAlign.center),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(30),
                        ),
                      ],
                    ),
                  )),
            );
          },
        );
      },
    );
  }

  void addCustomer(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25), // Set border radius here
              ),
              child: Container(
                  padding: EdgeInsets.fromLTRB(18, 15, 18, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: constantWhite,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageCons.imgAddCustomerDialogue,
                              height: AppScreenUtil().screenHeight(22),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(15),
                            ),
                            Text(
                              'Create New Customer',
                              style: kotDarkModeUnselectedTabLabelStyle,
                              textAlign:
                                  TextAlign.center, // Center align the text
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(15),
                        ),
                        UserOutlinedTextField(
                          controller: customerNameController,
                          text: 'Name',
                          errorMessage: 'Enter a valid Name',
                          textInputFormatter: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9_.]')),
                          ],
                          isValidData: isValidCustomerName,
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(10),
                        ),
                        UserOutlinedTextField(
                          controller: customerMobileController,
                          text: 'Mobile',
                          isNumberField: true,
                          // errorMessage: 'Enter a valid Mobile',
                          // textInputFormatter: [
                          //   FilteringTextInputFormatter.allow(
                          //       RegExp(r'[0-9._]')),
                          // ],
                          // isValidData: isValidCustomerMobile,
                        ),
                        tappedMoreDetails == false
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedMoreDetails = true;
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Add More Details',
                                        style: userAddMoreDetailTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(10),
                                  ),
                                  UserOutlinedTextField(
                                    controller: customerCityController,
                                    text: 'City',
                                  ),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(10),
                                  ),
                                  UserOutlinedTextField(
                                      controller: customerStreetController,
                                      text: 'Street'),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(10),
                                  ),
                                  UserOutlinedTextField(
                                      controller:
                                          customerBuildingNameController,
                                      text: 'Building Name'),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(10),
                                  ),
                                  UserOutlinedTextField(
                                      controller: customerBuildingNoController,
                                      text: 'Building No'),
                                  SizedBox(
                                    height: AppScreenUtil().screenHeight(10),
                                  ),
                                  UserOutlinedTextField(
                                      controller: customerRoomNoController,
                                      text: 'Room No'),
                                ],
                              ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  tappedMoreDetails = false;
                                });
                              },
                              child: Container(
                                height: AppScreenUtil().screenHeight(22),
                                width: AppScreenUtil().screenWidth(45),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        color: blackColor, width: 0.5)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: kotDarkModeUnselectedTabLabelStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(5),
                            ),
                            Obx(() => (posCtrl.isAddCustomerLoading.value ==
                                    true)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ))
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        tappedMoreDetails = false;
                                      });
                                      validateFields();
                                      if (isValidCustomerName &&
                                          customerMobileController.text !=
                                              null) {
                                        posCtrl
                                            .addCustomer(
                                                name:
                                                    customerNameController.text,
                                                mobileNo:
                                                    customerMobileController
                                                        .text,
                                                city:
                                                    customerCityController.text,
                                                streetName:
                                                    customerStreetController
                                                        .text,
                                                buildingNo:
                                                    customerBuildingNoController
                                                        .text,
                                                buildingName:
                                                    customerBuildingNameController
                                                        .text,
                                                roomNo: customerRoomNoController
                                                    .text,
                                                status: 'true',
                                                isCustomer: 'true',
                                                isVendor: 'false')
                                            .then((value) {
                                          print('Add Customer : $value');
                                          if (value == true) {
                                            posCtrl.getCustomerDropdownList();
                                            _selectedItem =
                                                posCtrl.addedCustomer;
                                            print(
                                                'Added Customer ${posCtrl.addedCustomer}');
                                            Navigator.pop(context);
                                          }
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: AppScreenUtil().screenHeight(22),
                                      width: AppScreenUtil().screenWidth(91),
                                      decoration: BoxDecoration(
                                        color:
                                            userOutlinedTextFieldBorderTextColor,
                                        borderRadius: BorderRadius.circular(3),
                                        // border: Border.all(color: blackColor,width: 1)
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: kotSelectedTabLabelStyle,
                                        ),
                                      ),
                                    ),
                                  ))
                          ],
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(13),
                        ),
                      ],
                    ),
                  )),
            );
          },
        );
      },
    );
  }

  void cartBottomSheet(
      BuildContext context, ongoingOrdersById, String? status, String orderId) {
    print('**********Order Id from Cart: $orderId**************');
    orderId = posCtrl.productOrderId.value;
    showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            void updateQuantity(int index, int newQuantity, String objType) {
              setState(() {
                cart[index].quantity = newQuantity;
                cart[index].objType = objType;
                calculateAndSetCalculatedValues();
              });
              print('Item Name :${cart[index].product.productName}, ' +
                  'Item Quantity : ${cart[index].quantity}');
            }

            double getTotalPrice(double price, dynamic quantity) {
              return price *
                  quantity
                      .toDouble(); // Convert quantity to double before multiplication
            }

            double calculateCartTotal(List<dynamic> cart) {
              double total = 0.0;
              for (int index = 0; index < cart.length; index++) {
                double itemPrice = cart[index].updatedPrice != null
                    ? double.tryParse(cart[index].updatedPrice)
                    : cart[index].product.salesPrice.toDouble();
                int itemQuantity = cart[index].quantity;
                total += getTotalPrice(itemPrice, itemQuantity);
              }
              return total;
            }

            String calculateCartTotalAsString(List<dynamic> cart) {
              double total = calculateCartTotal(cart);
              return total.toStringAsFixed(2);
            }

            int calculateCartTotalAsInt(List<dynamic> cart) {
              double total = calculateCartTotal(cart);
              return total.toInt(); // Convert double total to integer
            }

            List<Map<String, dynamic>> orderInfo = [];

// Iterate through each item in the cart
            for (int i = 0; i < cart.length; i++) {
              var cartItem = cart[i];

              // Prepare taxes for the current item
              List<Map<String, dynamic>> taxesForItem = [];
              if (cartItem.product.taxes != null) {
                for (var tax in cartItem.product.taxes!) {
                  taxesForItem.add({
                    "_id": '${tax.id}',
                    "includedPrice": tax.includedPrice!,
                    "amount": tax.amount,
                    "accountId": '${tax.accountId}',
                    "taxName": '${tax.taxName}',
                    "taxType": "None"
                  });
                }
              }

              // Construct the order information for the current item
              orderInfo.add({
                "customerNote": cartItem.customerNote,
                "desccription": cartItem.product.productName,
                "includedPrice": cartItem.product.includedPrice,
                "itemType": 1,
                "kotOrderId": cartItem.kotId,
                "kotStatus": cartItem.kotStatus,
                "lineTotal": cartItem.linTotal.toInt(),
                "objType": cartItem.objType,
                "productId": cartItem.product.id,
                "qty": cartItem.quantity,
                "subTotalWoTax": getTotalPrice(
                  cartItem.updatedPrice != null
                      ? double.parse(cartItem.updatedPrice)
                      : cartItem.product.salesPrice.toDouble(),
                  cartItem.quantity,
                ).toInt(),
                "taxes":
                    cartItem.product.includedPrice == null ? [] : taxesForItem,
                "unitPrice": cartItem.updatedPrice != null
                    ? cartItem.updatedPrice
                    : cartItem.product.salesPrice,
                "uom": cartItem.product.uom
              });
            }
            DateTime now = DateTime.now();
            String formattedDate =
                DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
            bool containsBatchId =
                cart.any((item) => item.batchId == 'ProductsFromOngoing');
            int tappedTabIndex = 0;
            return FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: constantWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: cart.isNotEmpty
                    ? Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppScreenUtil().screenHeight(16)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Wrap(children: [
                                        SizedBox(
                                          width: double.infinity,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppScreenUtil()
                                                  .screenWidth(16)),
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(children: [
                                              Container(
                                                width: double.infinity,
                                                height: AppScreenUtil()
                                                    .screenHeight(25),
                                                color: Colors.transparent,
                                                child: tableCtrl
                                                            .floorPlanOrderId ==
                                                        'Test'
                                                    ? Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Text(
                                                              'Cart',
                                                              style:
                                                                  cartScreenTitleTextStyle,
                                                            ),
                                                          ),

                                                          ///Cross mark
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: AppScreenUtil()
                                                                      .screenWidth(
                                                                          10)),
                                                              child: SvgPicture
                                                                  .asset(
                                                                ImageCons
                                                                    .imgCartCloseIcon,
                                                                height: 18,
                                                                width: 18,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ///Cart screen order number
                                                          Expanded(
                                                            flex: 1,
                                                            child: SizedBox(
                                                              height: 12,
                                                              child: ListView
                                                                  .separated(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount: posCtrl
                                                                        .viewPosOrderByIdResData
                                                                        .tableNames!
                                                                        .length +
                                                                    1,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  if (index <
                                                                      posCtrl
                                                                          .viewPosOrderByIdResData
                                                                          .tableNames!
                                                                          .length) {
                                                                    String tableName = posCtrl
                                                                        .viewPosOrderByIdResData
                                                                        .tableNames![
                                                                            index]
                                                                        .toString()
                                                                        .trim();
                                                                    tableName +=
                                                                        (index <
                                                                                posCtrl.viewPosOrderByIdResData.tableNames!.length - 1)
                                                                            ? ','
                                                                            : '';

                                                                    return Text(
                                                                      tableName,
                                                                      style:
                                                                          categoryRedTextStyle,
                                                                    );
                                                                  } else {
                                                                    return Text(
                                                                      ' / CH${posCtrl.viewPosOrderByIdResData.chairId!.length}',
                                                                      style:
                                                                          categoryRedTextStyle,
                                                                    );
                                                                  }
                                                                },
                                                                separatorBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return SizedBox(
                                                                      width: 1);
                                                                },
                                                              ),
                                                            ),
                                                          ),

                                                          ///Cart title
                                                          Expanded(
                                                            flex: 1,
                                                            child: Text(
                                                              'Cart',
                                                              style:
                                                                  cartScreenTitleTextStyle,
                                                            ),
                                                          ),

                                                          ///Cross mark
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: AppScreenUtil()
                                                                      .screenWidth(
                                                                          10)),
                                                              child: SvgPicture
                                                                  .asset(
                                                                ImageCons
                                                                    .imgCartCloseIcon,
                                                                height: 18,
                                                                width: 18,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(19),
                                              ),

                                              ///Tabs
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          tappedHeadItem =
                                                              headTitle[0];
                                                          selectedOrdType =
                                                              headTitle[0];
                                                          buttonColor =
                                                              whiteColor;
                                                        });
                                                      },
                                                      child: Card(
                                                        elevation: 1,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(28),
                                                        ),
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    11, 2, 11, 2),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        17),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        61),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color:
                                                                      adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2),
                                                                  blurRadius: 6,
                                                                ),
                                                              ],
                                                              color: tappedHeadItem ==
                                                                          'Dine In' ||
                                                                      selectedOrdType ==
                                                                          'Dine In'
                                                                  ? confirmColor
                                                                  : whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          28),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                headTitle[0],
                                                                style: tappedHeadItem ==
                                                                            'Dine In' ||
                                                                        selectedOrdType ==
                                                                            'Dine In'
                                                                    ? dineInTextStyle
                                                                    : takeAwayTextStyle,
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          tappedHeadItem =
                                                              headTitle[1];
                                                          selectedOrdType =
                                                              headTitle[1];
                                                          buttonColor =
                                                              whiteColor;
                                                        });
                                                      },
                                                      child: Card(
                                                        elevation: 1,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(28),
                                                        ),
                                                        child: Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    5, 2, 5, 2),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        17),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        61),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color:
                                                                      adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2),
                                                                  blurRadius: 6,
                                                                ),
                                                              ],
                                                              color: tappedHeadItem ==
                                                                          'Take Away' ||
                                                                      selectedOrdType ==
                                                                          'Take Away'
                                                                  ? confirmColor
                                                                  : whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          28),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                headTitle[1],
                                                                style: tappedHeadItem ==
                                                                            'Take Away' ||
                                                                        selectedOrdType ==
                                                                            'Take Away'
                                                                    ? dineInTextStyle
                                                                    : takeAwayTextStyle,
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                    Obx(() => (posCtrl
                                                                .allAggregatorsViewDetailsLoading
                                                                .value ==
                                                            true)
                                                        ? SizedBox()
                                                        : (posCtrl.isAllAggregatorsListError
                                                                    .value ==
                                                                true)
                                                            ? Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: AppScreenUtil()
                                                                        .screenHeight(
                                                                            30)),
                                                                child:
                                                                    AppErrorScreen(
                                                                  buttonOnTap:
                                                                      () {
                                                                    posCtrl
                                                                        .allAggregatorsList();
                                                                  },
                                                                ),
                                                              )
                                                            : (posCtrl
                                                                    .allAggregatorsViewMainList
                                                                    .isEmpty)
                                                                ? Text('😢')
                                                                : GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        buttonColor =
                                                                            confirmColor;
                                                                        tappedHeadItem =
                                                                            headTitle[2];
                                                                        selectedOrdType =
                                                                            headTitle[2];
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(28),
                                                                        color:
                                                                            buttonColor,
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            DropdownButtonHideUnderline(
                                                                          child:
                                                                              DropdownButton2<String>(
                                                                            isExpanded:
                                                                                true,
                                                                            hint:
                                                                                Text(
                                                                              headTitle[2],
                                                                              style: buttonColor == confirmColor ? dineInTextStyle : takeAwayTextStyle,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                            items:
                                                                                posCtrl.allAggregatorsViewMainList.map((AggregatorsListResModel item) {
                                                                              return DropdownMenuItem<String>(
                                                                                value: item.name,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    '${item.name}',
                                                                                    style: buttonColor == confirmColor ? dineInTextStyle : takeAwayTextStyle,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }).toList(),
                                                                            value:
                                                                                selectedValue,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                selectedValue = value;
                                                                                tappedHeadItem = headTitle[2];
                                                                                selectedOrdType = headTitle[2];
                                                                                buttonColor = whiteColor;
                                                                                aggregatorRefController.text = '';
                                                                                AggregatorsListResModel? aggregator = posCtrl.allAggregatorsViewMainList.firstWhereOrNull((item) => item.name == selectedValue);

                                                                                if (aggregator != null) {
                                                                                  aggregatorId = aggregator.id!;
                                                                                  aggregatorIsSelf = aggregator.isSelf;
                                                                                  print('Aggregator Name: $selectedValue, Aggregator Id: $aggregatorId');
                                                                                }
                                                                                categoriesTapped = false;
                                                                                tappedCategoryItem = '';
                                                                                tappedSubCategoryItem = '';
                                                                              });

                                                                              // Show dialog
                                                                              aggregatorIsSelf == true
                                                                                  ? SizedBox()
                                                                                  : showDialog(
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return StatefulBuilder(builder: (context, setState) {
                                                                                          return Dialog(
                                                                                            alignment: Alignment.center,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(4),
                                                                                            ),
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Container(
                                                                                                  padding: EdgeInsets.fromLTRB(18, 18, 18, 15),
                                                                                                  decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(4)),
                                                                                                  child: Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          ClipOval(
                                                                                                            child: Container(
                                                                                                              width: 28,
                                                                                                              height: 28,
                                                                                                              color: posSpecialItems1Color,
                                                                                                              child: Center(
                                                                                                                  child: SvgPicture.asset(
                                                                                                                ImageCons.imgCartAggregators,
                                                                                                                height: AppScreenUtil().screenHeight(10),
                                                                                                              )),
                                                                                                            ),
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            width: AppScreenUtil().screenHeight(21),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'Add Reference ID',
                                                                                                            style: pangramMedium(size: 10.0, color: blackColor),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: AppScreenUtil().screenHeight(16),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        padding: EdgeInsets.only(right: 10),
                                                                                                        height: AppScreenUtil().screenHeight(32),
                                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: confirmColor.withOpacity(0.5), width: 0.8)),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              height: AppScreenUtil().screenHeight(32),
                                                                                                              width: AppScreenUtil().screenWidth(72),
                                                                                                              color: posSpecialItems1Color,
                                                                                                              child: Center(
                                                                                                                  child: Text(
                                                                                                                'Aggregator',
                                                                                                                style: pangramRegular(size: 10.0, color: blackColor),
                                                                                                              )),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                                child: Align(
                                                                                                                    alignment: Alignment.centerRight,
                                                                                                                    child: Text(
                                                                                                                      '${selectedValue}',
                                                                                                                      style: pangramRegular(size: 11.0, color: blackColor),
                                                                                                                    ))),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: AppScreenUtil().screenHeight(10),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        padding: EdgeInsets.only(right: 8, bottom: 2),
                                                                                                        height: AppScreenUtil().screenHeight(32),
                                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: confirmColor.withOpacity(0.5), width: 0.8)),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              height: AppScreenUtil().screenHeight(32),
                                                                                                              width: AppScreenUtil().screenWidth(72),
                                                                                                              color: posSpecialItems1Color,
                                                                                                              child: Center(
                                                                                                                  child: Text(
                                                                                                                'Ref ID',
                                                                                                                style: pangramRegular(size: 10.0, color: blackColor),
                                                                                                              )),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: TextField(
                                                                                                                textAlign: TextAlign.right,
                                                                                                                maxLines: 1,
                                                                                                                style: pangramRegular(size: 11.0, color: blackColor),
                                                                                                                controller: aggregatorRefController,
                                                                                                                // inputFormatters: widget.textInputFormatter,
                                                                                                                decoration: InputDecoration(
                                                                                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                                                                  contentPadding: const EdgeInsets.only(bottom: 7),
                                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                                    borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                  ),
                                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                                    borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                  ),
                                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                                    borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                  ),
                                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                                    borderSide: const BorderSide(color: Colors.transparent),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                onChanged: (aggregatorRefController) {
                                                                                                                  print('Aggregator Ref: ${aggregatorRefController}');
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.only(right: 10, left: 10, top: 35),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                          children: [
                                                                                                            GestureDetector(
                                                                                                              onTap: () {
                                                                                                                Navigator.pop(context);
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                height: AppScreenUtil().screenHeight(22),
                                                                                                                width: AppScreenUtil().screenWidth(45),
                                                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: blackColor, width: 0.7)),
                                                                                                                child: Center(
                                                                                                                  child: Text(
                                                                                                                    'Cancel',
                                                                                                                    style: kotDarkModeUnselectedTabLabelStyle,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(
                                                                                                              width: AppScreenUtil().screenWidth(5),
                                                                                                            ),
                                                                                                            GestureDetector(
                                                                                                              onTap: () {
                                                                                                                Navigator.of(context).pop();
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                height: AppScreenUtil().screenHeight(22),
                                                                                                                width: AppScreenUtil().screenWidth(91),
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: confirmColor,
                                                                                                                  borderRadius: BorderRadius.circular(3),
                                                                                                                ),
                                                                                                                child: Center(
                                                                                                                  child: Text(
                                                                                                                    'Submit',
                                                                                                                    style: kotSelectedTabLabelStyle,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: AppScreenUtil().screenHeight(8),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                            ),
                                                                                          );
                                                                                        });
                                                                                      });
                                                                            },
                                                                            buttonStyleData:
                                                                                ButtonStyleData(
                                                                              height: AppScreenUtil().screenHeight(16),
                                                                              width: AppScreenUtil().screenWidth(57),
                                                                              padding: EdgeInsets.fromLTRB(11, 2, 11, 2),
                                                                              decoration: BoxDecoration(
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                                    offset: Offset(1, 2),
                                                                                    blurRadius: 0.5,
                                                                                    blurStyle: BlurStyle.normal,
                                                                                  ),
                                                                                ],
                                                                                color: buttonColor,
                                                                                borderRadius: BorderRadius.circular(28),
                                                                              ),
                                                                              elevation: 1,
                                                                            ),
                                                                            iconStyleData:
                                                                                const IconStyleData(
                                                                              iconSize: 1,
                                                                              iconEnabledColor: Colors.transparent,
                                                                              iconDisabledColor: Colors.transparent,
                                                                            ),
                                                                            dropdownStyleData:
                                                                                DropdownStyleData(
                                                                              maxHeight: AppScreenUtil().screenHeight(166),
                                                                              width: AppScreenUtil().screenWidth(145),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(14),
                                                                                color: buttonColor,
                                                                              ),
                                                                              offset: const Offset(-20, 0),
                                                                              scrollbarTheme: ScrollbarThemeData(
                                                                                radius: const Radius.circular(40),
                                                                                thickness: MaterialStateProperty.all(6),
                                                                                thumbVisibility: MaterialStateProperty.all(true),
                                                                              ),
                                                                            ),
                                                                            menuItemStyleData:
                                                                                const MenuItemStyleData(
                                                                              height: 40,
                                                                              padding: EdgeInsets.only(left: 14, right: 14),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(20),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ///Dropdown
                                                    Obx(() => (posCtrl
                                                                .customerDropdownViewDetailsLoading
                                                                .value ==
                                                            true)
                                                        ? SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                3,
                                                            child: const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color:
                                                                    confirmColor,
                                                              ),
                                                            ),
                                                          )
                                                        : (posCtrl.isCustomerDropdownListError
                                                                    .value ==
                                                                true)
                                                            ? Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: AppScreenUtil()
                                                                        .screenHeight(
                                                                            30)),
                                                                child:
                                                                    AppErrorScreen(
                                                                  buttonOnTap:
                                                                      () {
                                                                    posCtrl
                                                                        .getCustomerDropdownList();
                                                                  },
                                                                ),
                                                              )
                                                            : (posCtrl
                                                                    .customerDropdownViewMainList
                                                                    .isEmpty)
                                                                ? SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        3,
                                                                    child: const Center(
                                                                        child:
                                                                            EmptyLayout()))
                                                                : Expanded(
                                                                    flex: 4,
                                                                    child:
                                                                        Container(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              38),
                                                                      // width: AppScreenUtil().screenWidth(271),
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              textFieldColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(6)),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(18)),
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Row(
                                                                                children: [
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      addCustomer(context);
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 15,
                                                                                          color: blackColor,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: AppScreenUtil().screenWidth(3),
                                                                                        ),
                                                                                        SvgPicture.asset(
                                                                                          ImageCons.cartCustomer,
                                                                                          height: 17,
                                                                                          width: 17,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: AppScreenUtil().screenWidth(20),
                                                                                  ),
                                                                                  Obx(() {
                                                                                    // This will rebuild the widget when posCtrl.customerId changes
                                                                                    String? selectedValue;

                                                                                    // Check if customerId.value is not empty
                                                                                    if (posCtrl.customerId.value.isNotEmpty) {
                                                                                      // If customerId is set, get the corresponding dropdown name
                                                                                      ViewCustomerForDropdownResModel? selectedItem = posCtrl.customerDropdownViewMainList.firstWhereOrNull(
                                                                                        (item) => item.id == posCtrl.customerId.value,
                                                                                      );
                                                                                      addedCustomerId = posCtrl.customerId.value; // Assign customer ID
                                                                                      selectedValue = selectedItem?.name; // Set dropdown value to the corresponding name
                                                                                    } else {
                                                                                      // If customerId is empty, fallback to cash customer ID
                                                                                      addedCustomerId = posCtrl.viewCashCustomerResData.id!;
                                                                                      selectedValue = null; // or some default value
                                                                                    }

                                                                                    return Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          color: textFieldColor,
                                                                                        ),
                                                                                        child: DropdownButton<String>(
                                                                                          style: searchInputTextStyle,
                                                                                          padding: const EdgeInsets.only(right: 10),
                                                                                          value: selectedValue ?? _selectedItem, // Use selectedValue if available
                                                                                          items: [
                                                                                            DropdownMenuItem<String>(
                                                                                              value: '',
                                                                                              child: Text(
                                                                                                'Choose any or clear',
                                                                                                style: pangramMedium(color: confirmColor, size: 10.0),
                                                                                              ),
                                                                                            ),
                                                                                            ...posCtrl.customerDropdownViewMainList.map((ViewCustomerForDropdownResModel item) {
                                                                                              return DropdownMenuItem<String>(
                                                                                                value: item.name, // Ensure name is unique
                                                                                                child: Text(
                                                                                                  '${item.name}',
                                                                                                  style: subTitleTextStyle,
                                                                                                ),
                                                                                              );
                                                                                            }).toList(),
                                                                                          ],
                                                                                          onChanged: (String? newValue) {
                                                                                            setState(() {
                                                                                              _selectedItem = newValue?.isEmpty ?? true ? null : newValue;

                                                                                              // If a customer is selected, get the corresponding customer ID
                                                                                              ViewCustomerForDropdownResModel? selectedItem = posCtrl.customerDropdownViewMainList.firstWhereOrNull(
                                                                                                (item) => item.name == _selectedItem,
                                                                                              );
                                                                                              addedCustomerId = selectedItem?.id ?? posCtrl.viewCashCustomerResData.id!; // Get ID or fallback to cash customer ID

                                                                                              print('Selected Customer Id: $addedCustomerId');
                                                                                            });
                                                                                          },
                                                                                          icon: const Icon(
                                                                                            Icons.arrow_drop_down,
                                                                                            color: blackColor,
                                                                                          ),
                                                                                          iconSize: 20,
                                                                                          isExpanded: true,
                                                                                          underline: const SizedBox(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  })
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                    SizedBox(
                                                      width: AppScreenUtil()
                                                          .screenWidth(10),
                                                    ),

                                                    ///Add customer
                                                    Expanded(
                                                        flex: 1,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // addCustomer(
                                                            //     context);
                                                          },
                                                          child: Container(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        36),
                                                            //  width: AppScreenUtil().screenWidth(62),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color:
                                                                    constantWhite,
                                                                border: Border.all(
                                                                    color:
                                                                        cartScreenCustomerAddingContainerBorderColor,
                                                                    width: 1)),
                                                            child: Center(
                                                                child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  ImageCons
                                                                      .imgCartTransferTable,
                                                                  height: 20.5,
                                                                  width: 20.5,
                                                                ),
                                                                SizedBox(
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          3.5),
                                                                ),
                                                                Icon(
                                                                  Icons.add,
                                                                  size: 15,
                                                                  color:
                                                                      blackColor,
                                                                )
                                                              ],
                                                            )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),

                                              ///cart List
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: AppScreenUtil()
                                                        .screenHeight(15)),
                                                child: Column(
                                                  children: List.generate(
                                                      cart.length, (index) {
                                                    final item = cart[index];
                                                    TextEditingController
                                                        salesPriceController =
                                                        TextEditingController(
                                                            text: cart[index]
                                                                        .updatedPrice !=
                                                                    null
                                                                ? cart[index]
                                                                    .updatedPrice
                                                                : cart[index]
                                                                    .product
                                                                    .salesPrice
                                                                    .toString());
                                                    return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 18),
                                                        child: Dismissible(
                                                          onDismissed:
                                                              (direction) {
                                                            // Call removeProduct when dismissed
                                                            setState(() {
                                                              cart.removeAt(
                                                                  index);
                                                              calculateAndSetCalculatedValues();
                                                            });
                                                          },
                                                          key:
                                                              UniqueKey(), // Unique key for each item
                                                          direction: item
                                                                      .batchId ==
                                                                  'ProductsFromCategories'
                                                              ? DismissDirection
                                                                  .endToStart
                                                              : DismissDirection
                                                                  .none, // Disable swipe if batchId matches
                                                          background: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color:
                                                                      adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                  offset:
                                                                      Offset(
                                                                          0, 0),
                                                                  blurRadius: 6,
                                                                ),
                                                              ],
                                                              color:
                                                                  confirmColor,
                                                            ),
                                                            alignment: Alignment
                                                                .centerRight,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: SvgPicture
                                                                .asset(
                                                              ImageCons
                                                                  .imgCartDeleteIcon,
                                                              color: whiteColor,
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      14),
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      14),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          10, 8, 10, 8),
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          90),
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color:
                                                                            adminDashBoardDateDropDownContainerBoxShadowColor,
                                                                        offset: Offset(
                                                                            0,
                                                                            0),
                                                                        blurRadius:
                                                                            6,
                                                                      ),
                                                                    ],
                                                                    color:
                                                                        whiteColor,
                                                                  ),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Column(
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                    height: AppScreenUtil().screenHeight(78),
                                                                                    width: AppScreenUtil().screenWidth(79),
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(color: cart[index].batchId == 'ProductsFromCategories' ? blackColor : Colors.transparent, width: 0.7),
                                                                                      color: whiteColor,
                                                                                      borderRadius: BorderRadius.circular(17),
                                                                                    ),
                                                                                    padding: cart[index].batchId == 'ProductsFromCategories' ? EdgeInsets.all(1.5) : EdgeInsets.all(15),
                                                                                    child: cart[index].batchId == 'ProductsFromCategories'
                                                                                        ? ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(16),
                                                                                            child: Image.network(
                                                                                              (cart.isNotEmpty && cart[index].product.imageUrl != null && cart[index].product.imageUrl!.isNotEmpty) ? cart[index].product.imageUrl![0].toString() : 'https://tse3.mm.bing.net/th?id=OIP.2ALRW5urj4F4cRPcktY-tQAAAA&pid=Api&P=0&h=180',
                                                                                              fit: BoxFit.cover,
                                                                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                                                                return Image.network(
                                                                                                  'https://tse3.mm.bing.net/th?id=OIP.2ALRW5urj4F4cRPcktY-tQAAAA&pid=Api&P=0&h=180',
                                                                                                  fit: BoxFit.cover,
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          )
                                                                                        : SvgPicture.asset(ImageCons.imgUnReserved)),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                AppScreenUtil().screenWidth(10),
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: AppScreenUtil().screenWidth(110),
                                                                                child: Text(
                                                                                  '${cart[index].product.productName}',
                                                                                  style: userCartTitleTextStyle,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                ),
                                                                              ),
                                                                              cart[index].customerNote == null
                                                                                  ? SizedBox(
                                                                                      height: AppScreenUtil().screenHeight(2),
                                                                                    )
                                                                                  : Container(
                                                                                      width: AppScreenUtil().screenWidth(110),
                                                                                      child: Text(
                                                                                        cart[index].customerNote,
                                                                                        style: userCartAddOnTextStyle,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                      ),
                                                                                    ),
                                                                              SizedBox(
                                                                                height: AppScreenUtil().screenHeight(11),
                                                                              ),
                                                                              SizedBox(
                                                                                  width: AppScreenUtil().screenWidth(100),
                                                                                  height: AppScreenUtil().screenHeight(10),
                                                                                  child: TextFormField(
                                                                                    onChanged: (newValue) {
                                                                                      // cart[index].product.salesPrice = newValue;
                                                                                      setState(() {
                                                                                        cart[index].updatedPrice = newValue.toString();
                                                                                        calculateAndSetCalculatedValues();
                                                                                        // salesPriceController.text = cart[index].updatedPrice;
                                                                                      });
                                                                                      print('Changed product price :$newValue');
                                                                                    },
                                                                                    textAlign: TextAlign.start,
                                                                                    controller: salesPriceController,
                                                                                    maxLines: 1,
                                                                                    style: salePriceTextStyle,
                                                                                    cursorColor: blackColor,
                                                                                    cursorHeight: 10,
                                                                                    decoration: InputDecoration(
                                                                                      contentPadding: EdgeInsets.all(2),
                                                                                      isDense: true,
                                                                                      hintStyle: placeholderTextStyle,
                                                                                      fillColor: whiteColor,
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
                                                                              SizedBox(
                                                                                height: AppScreenUtil().screenHeight(1),
                                                                              ),
                                                                              Text(
                                                                                getTotalPrice(
                                                                                  // Convert updatedPrice to double if it is not null, otherwise convert salesPrice
                                                                                  (cart[index].updatedPrice != null ? double.tryParse(cart[index].updatedPrice.toString()) ?? 0.0 : double.tryParse(cart[index].product.salesPrice.toString()) ?? 0.0),
                                                                                  cart[index].quantity,
                                                                                ).toStringAsFixed(2),
                                                                                style: pangramMedium(size: 12.0, color: blackColor),
                                                                              )
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              final customerNoteController = TextEditingController(
                                                                                text: cart[index].customerNote ?? '',
                                                                              );
                                                                              addNote(
                                                                                context,
                                                                                title: 'Add Note',
                                                                                customerNoteController: customerNoteController,
                                                                                index: index,
                                                                                onNoteUpdated: (updatedNote) {
                                                                                  setState(() {
                                                                                    cart[index].customerNote = updatedNote;
                                                                                  });
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(top: 10),
                                                                              child: SvgPicture.asset(ImageCons.imgCartEditIcon),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                4,
                                                                                1,
                                                                                4,
                                                                                1),
                                                                            height:
                                                                                AppScreenUtil().screenHeight(26),
                                                                            width:
                                                                                AppScreenUtil().screenWidth(71),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(17), color: blackColor),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    if (cart[index].quantity > 1) {
                                                                                      updateQuantity(index, cart[index].quantity - 1, 'min');
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                      height: AppScreenUtil().screenHeight(20),
                                                                                      width: AppScreenUtil().screenWidth(20),
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                        color: whiteColor,
                                                                                      ),
                                                                                      child: Center(
                                                                                        child: Icon(
                                                                                          Icons.remove,
                                                                                          color: blackColor,
                                                                                          size: 16,
                                                                                        ),
                                                                                      )),
                                                                                ),
                                                                                Text(
                                                                                  '${cart[index].quantity}',
                                                                                  style: userCartCountTextStyle,
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    updateQuantity(index, cart[index].quantity + 1, 'add');
                                                                                  },
                                                                                  child: Container(
                                                                                      height: AppScreenUtil().screenHeight(20),
                                                                                      width: AppScreenUtil().screenWidth(20),
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                        color: whiteColor,
                                                                                      ),
                                                                                      child: Center(
                                                                                        child: Icon(
                                                                                          Icons.add,
                                                                                          color: blackColor,
                                                                                          size: 16,
                                                                                        ),
                                                                                      )),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ));
                                                  }),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppScreenUtil()
                                                    .screenHeight(12),
                                              ),
                                            ]),
                                          ),
                                        )
                                      ]),
                                    ],
                                  ),
                                )),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(14),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppScreenUtil().screenWidth(16),
                                  ),
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      width: double.infinity,
                                      height: AppScreenUtil().screenHeight(43),
                                      decoration: BoxDecoration(
                                          color: cartDetailsContainerColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Grand Total',
                                            style: cartDetailsLabelStyle,
                                          ),
                                          Text(
                                            calculateCartTotalAsString(
                                                cart), // Assuming totalPrice is in AED
                                            style: cartDetailsLabelStyle,
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: AppScreenUtil().screenHeight(14),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(16)),
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: AppScreenUtil()
                                                      .screenHeight(14)),
                                              child: Row(
                                                children: [
                                                  Obx(
                                                    () =>
                                                        (posCtrl.isAddPosOrderHoldLoading
                                                                    .value ==
                                                                true)
                                                            ? Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: AppScreenUtil()
                                                                        .screenHeight(
                                                                            3)),
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color:
                                                                      confirmColor,
                                                                  strokeWidth:
                                                                      3,
                                                                ),
                                                              )
                                                            : Expanded(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          shape:
                                                                              const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.zero,
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              constantWhite,
                                                                          content:
                                                                              Container(
                                                                            color:
                                                                                constantWhite,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(29), right: AppScreenUtil().screenWidth(29), top: AppScreenUtil().screenHeight(25), bottom: AppScreenUtil().screenHeight(25)),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Text(
                                                                                    'Hold Order',
                                                                                    style: holdOrderStyle,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: AppScreenUtil().screenHeight(18),
                                                                                  ),
                                                                                  SvgPicture.asset(ImageCons.imgCartHold,
                                                                                      height: AppScreenUtil().screenHeight(57),
                                                                                      width: AppScreenUtil().screenHeight(
                                                                                        57,
                                                                                      )),
                                                                                  SizedBox(
                                                                                    height: AppScreenUtil().screenHeight(26),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(right: 10, left: 10),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.of(context).pop();
                                                                                          },
                                                                                          child: Container(
                                                                                            height: AppScreenUtil().screenHeight(22),
                                                                                            width: AppScreenUtil().screenWidth(91),
                                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: blackColor, width: 0.7)),
                                                                                            child: Center(
                                                                                              child: Text(
                                                                                                'Cancel',
                                                                                                style: kotDarkModeUnselectedTabLabelStyle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: AppScreenUtil().screenWidth(5),
                                                                                        ),
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            validateFields();
                                                                                            if (cart.isNotEmpty) {
                                                                                              dynamic defaultOrderIdForHold = null;
                                                                                              print('Cust Id if No Customer id choosen : $addedCustomerId');

                                                                                              posCtrl
                                                                                                  .addPosOrderHold(
                                                                                                orderInfo: orderInfo,
                                                                                                ordType: selectedOrdType == 'Dine In'
                                                                                                    ? 'DINEIN'
                                                                                                    : selectedOrdType == 'Take Away'
                                                                                                        ? 'TAKEAWAY'
                                                                                                        : 'DELIVERY',
                                                                                                orderId: posCtrl.productOrderId.value,
                                                                                                subTotal: calculateCartTotalAsInt(cart),
                                                                                                discountAmt: 0,
                                                                                                amtTotal: amountTotal,
                                                                                                totalInclusive: cart.fold<double>(0, (previousValue, item) => previousValue + (item.inclTax)),
                                                                                                totalExclusive: cart.fold<double>(0, (previousValue, item) => previousValue + (item.exclTax)),
                                                                                                custId: addedCustomerId == '' || addedCustomerId == null ? posCtrl.viewCashCustomerResData.id.toString() : addedCustomerId.toString(),
                                                                                                orderDate: formattedDate,
                                                                                                aggregatorId: null,
                                                                                                aggregatorRef: null,
                                                                                                waiterId: selectedWaiter == '' ? null : selectedWaiter,
                                                                                              )
                                                                                                  .then((value) {
                                                                                                if (value == true) {
                                                                                                  Navigator.of(context).pop(); // Close dialog
                                                                                                  Navigator.of(context).pop(); // Close bottom sheet
                                                                                                  clearCart();
                                                                                                  addedCustomerId = '${posCtrl.viewCashCustomerResData.id}';
                                                                                                  cart.length = 0;
                                                                                                  tappedCategoryItem = 'Home';
                                                                                                }
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                          child: Container(
                                                                                            height: AppScreenUtil().screenHeight(22),
                                                                                            width: AppScreenUtil().screenWidth(91),
                                                                                            decoration: BoxDecoration(
                                                                                              color: confirmColor,
                                                                                              borderRadius: BorderRadius.circular(3),
                                                                                            ),
                                                                                            child: Center(
                                                                                              child: Text(
                                                                                                'Confirm',
                                                                                                style: kotSelectedTabLabelStyle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      CustomButton(
                                                                    buttonHeight:
                                                                        AppScreenUtil()
                                                                            .screenHeight(43),
                                                                    buttonColor:
                                                                        holdButtonColor,
                                                                    borderRadius:
                                                                        5,
                                                                    buttonText:
                                                                        'Hold',
                                                                    buttonLabelStyle:
                                                                        placeOrderingStyle,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color:
                                                                            holdButtonColor,
                                                                        offset: Offset(
                                                                            0,
                                                                            0),
                                                                        blurRadius:
                                                                            1,
                                                                        spreadRadius:
                                                                            0,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                  ),
                                                  SizedBox(
                                                    width: AppScreenUtil()
                                                        .screenWidth(10),
                                                  ),
                                                  Obx(
                                                    () => (posCtrl
                                                                .isAddOrderLoading
                                                                .value ==
                                                            true)
                                                        ? Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: AppScreenUtil()
                                                                    .screenHeight(
                                                                        3)),
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  confirmColor,
                                                              strokeWidth: 3,
                                                            ),
                                                          )
                                                        : Expanded(
                                                            child:
                                                                GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                tappedCategoryItem =
                                                                    'Home';
                                                              });
                                                              posCtrl
                                                                  .getAllEmployeeDropdownList();
                                                              addWaiter(
                                                                  context,
                                                                  containsBatchId,
                                                                  orderInfo,
                                                                  calculateCartTotalAsInt(
                                                                      cart),
                                                                  formattedDate,
                                                                  status,
                                                                  orderId,
                                                                  false);
                                                            },
                                                            child: CustomButton(
                                                              buttonHeight:
                                                                  AppScreenUtil()
                                                                      .screenHeight(
                                                                          43),
                                                              buttonWidth:
                                                                  double
                                                                      .infinity,
                                                              buttonColor:
                                                                  addOrderButtonColor,
                                                              borderRadius: 5,
                                                              buttonText:
                                                                  'Add Order',
                                                              buttonLabelStyle:
                                                                  placeOrderingAndConfirmPaymentButtonLabelStyle,
                                                            ),
                                                          )),
                                                  )
                                                ],
                                              )),

                                          ///
                                          ///QuickBill and confirm payment and clear button rows
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppScreenUtil()
                                                    .screenHeight(16)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ///Clear button
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                constantWhite,
                                                            content: Container(
                                                              color:
                                                                  constantWhite,
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: AppScreenUtil()
                                                                        .screenWidth(
                                                                            29),
                                                                    right: AppScreenUtil()
                                                                        .screenWidth(
                                                                            29),
                                                                    top: AppScreenUtil()
                                                                        .screenHeight(
                                                                            25),
                                                                    bottom: AppScreenUtil()
                                                                        .screenHeight(
                                                                            25)),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      'Clear Order',
                                                                      style:
                                                                          holdOrderStyle,
                                                                    ),
                                                                    SizedBox(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              8),
                                                                    ),
                                                                    Text(
                                                                      'Are you sure to clear this order',
                                                                      style: pangramRegular(
                                                                          size:
                                                                              13.0,
                                                                          color:
                                                                              blackColor),
                                                                    ),
                                                                    SizedBox(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              14),
                                                                    ),
                                                                    SvgPicture.asset(
                                                                        ImageCons
                                                                            .imgCartClear,
                                                                        height: AppScreenUtil().screenHeight(
                                                                            46.6),
                                                                        width: AppScreenUtil()
                                                                            .screenWidth(
                                                                          41.06,
                                                                        )),
                                                                    SizedBox(
                                                                      height: AppScreenUtil()
                                                                          .screenHeight(
                                                                              26),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              10,
                                                                          left:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: AppScreenUtil().screenHeight(22),
                                                                              width: AppScreenUtil().screenWidth(91),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: blackColor, width: 0.7)),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Cancel',
                                                                                  style: kotDarkModeUnselectedTabLabelStyle,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                AppScreenUtil().screenWidth(5),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              clearCart();
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: AppScreenUtil().screenHeight(22),
                                                                              width: AppScreenUtil().screenWidth(91),
                                                                              decoration: BoxDecoration(
                                                                                color: confirmColor,
                                                                                borderRadius: BorderRadius.circular(3),
                                                                              ),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Clear',
                                                                                  style: kotSelectedTabLabelStyle,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: CustomButton(
                                                      buttonHeight:
                                                          AppScreenUtil()
                                                              .screenHeight(43),
                                                      buttonColor:
                                                          constantWhite,
                                                      borderRadius: 4.5,
                                                      buttonText: 'Clear',
                                                      buttonLabelStyle:
                                                          holdAndClearStyle,
                                                      border: Border.all(
                                                          color:
                                                              cartScreenButtonRedColor,
                                                          width: 1),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: AppScreenUtil()
                                                      .screenWidth(8),
                                                ),

                                                ///quickBill
                                                Expanded(
                                                    child: GestureDetector(
                                                  onTap: () {
                                                    // Navigator.pop(context);
                                                  },
                                                  child: CustomButton(
                                                    buttonHeight:
                                                        AppScreenUtil()
                                                            .screenHeight(43),
                                                    buttonColor:
                                                        dashBoardTotalOrdersIconColor,
                                                    borderRadius: 4.5,
                                                    buttonText: 'Quick Bill',
                                                    buttonLabelStyle:
                                                        placeOrderingStyle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            confirmPaymentBoxShadowColor,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 6,
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                                SizedBox(
                                                  width: AppScreenUtil()
                                                      .screenWidth(8),
                                                ),

                                                ///Confirm payment button
                                                posCtrl.viewPosConfigurationSettingsResData
                                                            .posStatus ==
                                                        true
                                                    ? Expanded(
                                                        child: GestureDetector(
                                                        onTap: () async {
                                                          setState(() {
                                                            tappedCategoryItem =
                                                                'Home';
                                                          });
                                                          posCtrl
                                                              .getAllEmployeeDropdownList();
                                                          addWaiter(
                                                              context,
                                                              containsBatchId,
                                                              orderInfo,
                                                              calculateCartTotalAsInt(
                                                                  cart),
                                                              formattedDate,
                                                              status,
                                                              orderId,
                                                              true);

                                                          // Check if the payment is confirmed
                                                        },
                                                        child: CustomButton(
                                                          buttonHeight:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      43),
                                                          buttonColor:
                                                              cartScreenButtonGreenColor,
                                                          borderRadius: 4.5,
                                                          buttonText:
                                                              'Confirm Payment',
                                                          buttonLabelStyle:
                                                              placeOrderingStyle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  confirmPaymentBoxShadowColor,
                                                              offset:
                                                                  Offset(0, 3),
                                                              blurRadius: 6,
                                                              spreadRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                      ))
                                                    : Expanded(
                                                        child: GestureDetector(
                                                        onTap: () {
                                                          _onButtonPressed(
                                                              context);
                                                        },
                                                        child: CustomButton(
                                                          buttonHeight:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      43),
                                                          buttonColor:
                                                              cartScreenButtonGreenColor
                                                                  .withOpacity(
                                                                      0.3),
                                                          borderRadius: 4.5,
                                                          buttonText:
                                                              'Confirm Payment',
                                                          buttonLabelStyle:
                                                              placeOrderingStyle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  confirmPaymentBoxShadowColor,
                                                              offset:
                                                                  Offset(0, 3),
                                                              blurRadius: 6,
                                                              spreadRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          ///Divider
                          Positioned(
                            left: AppScreenUtil().screenWidth(148),
                            child: SizedBox(
                              width: AppScreenUtil().screenWidth(68),
                              child: Divider(
                                color: dividerColor,
                                thickness: 2.5,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: EmptyLayout(),
                      ),
              ),
            );
          });
        });
  }

  void _showOverlayError(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.737,
        left: 10.0,
        right: 10.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: confirmColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'POS configurations are disabled!',
                textAlign: TextAlign.center,
                style: pangramMedium(size: 12.0, color: whiteColor),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the overlay after a few seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  ///error for invalid passowrd
  void passwordError(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.737,
        left: 10.0,
        right: 10.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: confirmColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Oh noo! something went wrong',
                textAlign: TextAlign.center,
                style: pangramMedium(size: 12.0, color: whiteColor),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the overlay after a few seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  ///error for invalid passowrd
  void addReservationError(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.737,
        left: 10.0,
        right: 10.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: confirmColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Please make sure to fill the required fields',
                textAlign: TextAlign.center,
                style: pangramMedium(size: 12.0, color: whiteColor),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the overlay after a few seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  void _onButtonPressed(BuildContext context) {
    // Your validation logic
    bool isError = true; // example condition
    if (isError) {
      _showOverlayError(context);
    }
  }

  void cartConfirmPayment(
      BuildContext context,
      dynamic calculateCartTotalAsString,
      String orderType,
      String addedCustomerId,
      String orderId,
      dynamic ordDate,
      // void clearCart,
      String tappedCategoryItem,
      isPayment) {
    showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return FractionallySizedBox(
                heightFactor: 0.9,
                child: Container(
                    decoration: BoxDecoration(
                      color: constantWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: CartConfirmPayment(
                        calculateCartTotalAsString,
                        orderType,
                        addedCustomerId,
                        orderId,
                        ordDate,
                        // clearCart,
                        tappedCategoryItem,
                        isPayment)));
          });
        });
  }

  void addNote(
    BuildContext context, {
    required String title,
    required TextEditingController customerNoteController,
    required int index,
    required Function(String) onNoteUpdated,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // Set border radius here
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {});
                // Navigator.of(context).pop();
              },
              child: Container(
                  padding: EdgeInsets.fromLTRB(18, 18, 18, 15),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 28,
                              height: 28,
                              color: posSpecialItems1Color,
                              child: Center(
                                  child: SvgPicture.asset(
                                ImageCons.imgCartAddNote,
                                height: AppScreenUtil().screenHeight(10),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenHeight(21),
                          ),
                          Text(
                            'Add Note',
                            style: pangramMedium(size: 10.0, color: blackColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Note',
                          style: pangramRegular(size: 10.0, color: blackColor),
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(3),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 4, 6, 23),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: confirmColor, width: 0.5),
                            color: whiteColor,
                          ),
                          child: SizedBox(
                              height: 101,
                              child: TextField(
                                controller: customerNoteController,
                                showCursor: true,
                                maxLines: 10,
                                style: pangramRegular(
                                    size: 11.0, color: blackColor),
                                cursorColor: blackColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  isDense: true,
                                  hintStyle: placeholderTextStyle,
                                  fillColor: blackColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(color: whiteColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(color: whiteColor),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(color: whiteColor),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    borderSide: BorderSide(color: whiteColor),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    // cart[index].customerNote =
                                    //     customerNoteController.text;
                                    // print(
                                    //     'Customer Note: ${cart[index].customerNote}');
                                  });
                                },
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6, left: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: AppScreenUtil().screenHeight(22),
                                width: AppScreenUtil().screenWidth(45),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        color: blackColor, width: 0.7)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: kotDarkModeUnselectedTabLabelStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(5),
                            ),
                            GestureDetector(
                              onTap: () {
                                final updatedNote = customerNoteController.text;
                                onNoteUpdated(
                                    updatedNote); // Pass the updated note back
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: AppScreenUtil().screenHeight(22),
                                width: AppScreenUtil().screenWidth(91),
                                decoration: BoxDecoration(
                                  color: confirmColor,
                                  borderRadius: BorderRadius.circular(3),
                                  // border: Border.all(color: blackColor,width: 1)
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: kotSelectedTabLabelStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                    ],
                  )),
            ),
          );
        });
      },
    );
  }

  void payment(
    BuildContext context,
    int calculateCartTotalAsInt,
    dynamic orderId,
    String addedCustomerId,
  ) {
    print('::::::::::::::OrderID: ${orderId.runtimeType}');
    posCtrl.viewPosOrderByIdRes(orderId);
    print('::::::::::::::Added Customer Id: ${addedCustomerId}');
    Future.delayed(Duration.zero, () {
      // Delay to ensure dialog is shown after the current build cycle
      cartConfirmPayment(
          context,
          calculateCartTotalAsInt,
          selectedOrdType == 'Dine In'
              ? 'DINEIN'
              : selectedOrdType == 'Take Away'
                  ? 'TAKEAWAY'
                  : 'DELIVERY',
          addedCustomerId,
          orderId,
          posCtrl.productOrderDate.value,
          // clearCart(),
          tappedCategoryItem = 'Home',
          false);
      // Reset the payment confirmation status after showing the dialog
      // posCtrl.productPaymentConfirmed.value = false;
      // clearCart();

      // print(
      //     '####Order from Default Add Orders Id: ${posCtrl.productOrderId.value}####');
      // print('View Order By Id Date: ${posCtrl.productOrderDate.value}');

      // paymentConfirmed = true;
      // print('Payment status: $paymentConfirmed');
      // cart.length = 0;
      // tappedCategoryItem = 'Home';
      // aggregatorId = '';
      // selectedValue = null;
      // aggregatorRefController.text = '';
    });
  }

  // ignore: use_function_type_syntax_for_parameters
  addWaiter(
    BuildContext context,
    bool containsBatchId,
    List<Map<String, dynamic>> orderInfo,
    calculateCartTotalAsInt,
    dynamic formattedDate,
    String? status,
    String orderId,
    bool paymentActive,
  ) {
    posCtrl.viewPosOrderByIdResData.status = posCtrl.orderStatus.toString();
    print(
        '=========Status Of Order: ${posCtrl.viewPosOrderByIdResData.status}');
    orderId == '' ? '' : posCtrl.viewPosOrderByIdRes(orderId);
    print('****************ID: $orderId*****************');
    print(
        '<======Order Status: ${posCtrl.viewPosOrderByIdResData.status}======>');
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(4), // Set border radius here
              ),
              child: Container(
                  padding: EdgeInsets.fromLTRB(18, 18, 18, 15),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 28,
                              height: 28,
                              color: posSpecialItems1Color,
                              child: Center(
                                  child: SvgPicture.asset(
                                ImageCons.imgCartConfirmOrder,
                                height: AppScreenUtil().screenHeight(10),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: AppScreenUtil().screenHeight(21),
                          ),
                          Text(
                            'Confirm Order',
                            style: pangramMedium(size: 10.0, color: blackColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(13),
                      ),
                      Center(
                          child: Text(
                        'Are you sure to confirm order?',
                        style: pangramRegular(size: 13.0, color: blackColor),
                      )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Waitor',
                              style:
                                  pangramRegular(size: 10.0, color: blackColor),
                            ),
                            SizedBox(
                              height: AppScreenUtil().screenHeight(4),
                            ),
                            Obx(
                              () => (posCtrl.employeesDropdownLoading.value ==
                                      true)
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: confirmColor,
                                        ),
                                      ),
                                    )
                                  : (posCtrl.isEmployeeDropdownListError
                                              .value ==
                                          true)
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              bottom: AppScreenUtil()
                                                  .screenHeight(30)),
                                          child: AppErrorScreen(
                                            buttonOnTap: () {
                                              posCtrl
                                                  .getAllEmployeeDropdownList();
                                            },
                                          ),
                                        )
                                      : (posCtrl.employeeDropdownViewMainList
                                              .isEmpty)
                                          ? SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              child: const Center(
                                                  child: EmptyLayout()))
                                          : Container(
                                              height: AppScreenUtil()
                                                  .screenHeight(32),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: confirmColor
                                                          .withOpacity(0.5),
                                                      width: 0.8)),
                                              child: Row(
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: AppScreenUtil()
                                                        .screenHeight(32),
                                                    width: AppScreenUtil()
                                                        .screenWidth(60),
                                                    color:
                                                        posSpecialItems1Color,
                                                    child: Center(
                                                        child: SvgPicture.asset(
                                                      ImageCons
                                                          .imgCartConfirmOrder,
                                                      height: AppScreenUtil()
                                                          .screenHeight(10),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      // height: 38,
                                                      child: DropdownButton<
                                                          String>(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 10),
                                                        value: selectedWaiter,
                                                        items: posCtrl
                                                            .employeeDropdownViewMainList
                                                            .where((item) =>
                                                                item.designationName ==
                                                                'waiter')
                                                            .map((item) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: item.id,
                                                            child: Text(
                                                              item.staffName,
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style:
                                                                  subTitleTextStyle,
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (dynamic newValue) {
                                                          setState(() {
                                                            selectedWaiter =
                                                                newValue;
                                                            print(
                                                                'selected Waiter : $selectedWaiter');
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        iconSize: 20,
                                                        isExpanded: true,
                                                        underline:
                                                            const SizedBox(), // Removes the default underline
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  tappedMoreDetails = false;
                                });
                              },
                              child: Container(
                                height: AppScreenUtil().screenHeight(22),
                                width: AppScreenUtil().screenWidth(45),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        color: blackColor, width: 0.7)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: kotDarkModeUnselectedTabLabelStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppScreenUtil().screenWidth(5),
                            ),
                            GestureDetector(
                              onTap: () {
                                validateFields();
                                if (cart.isNotEmpty) {
                                  print('BatchId: $containsBatchId');
                                  if (orderId == '') {
                                    posCtrl
                                        .addPosOrder(
                                      orderInfo: orderInfo,
                                      ordType: selectedOrdType == 'Dine In'
                                          ? 'DINEIN'
                                          : selectedOrdType == 'Take Away'
                                              ? 'TAKEAWAY'
                                              : 'DELIVERY',
                                      subTotal: calculateCartTotalAsInt,
                                      discountAmt: 0,
                                      amtTotal: amountTotal,
                                      totalInclusive: cart.fold<double>(
                                          0,
                                          (previousValue, item) =>
                                              previousValue + (item.inclTax)),
                                      totalExclusive: cart.fold<double>(
                                          0,
                                          (previousValue, item) =>
                                              previousValue + (item.exclTax)),
                                      custId: (addedCustomerId == '' ||
                                              addedCustomerId == null)
                                          ? (posCtrl.customerId.value == '' ||
                                                  posCtrl.customerId.value ==
                                                      null)
                                              ? posCtrl
                                                  .viewCashCustomerResData.id
                                                  .toString()
                                              : posCtrl.customerId.value
                                                  .toString()
                                          : addedCustomerId.toString(),
                                      orderDate: formattedDate,
                                      aggregatorId: aggregatorId == ''
                                          ? null
                                          : aggregatorId,
                                      aggregatorRef:
                                          aggregatorRefController.text == ''
                                              ? null
                                              : aggregatorRefController.text,
                                      waiterId: selectedWaiter == ''
                                          ? null
                                          : selectedWaiter,
                                    )
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.of(context)
                                            .pop(); // Close dialog
                                        posCtrl.productPaymentConfirmed.value =
                                            paymentActive;
                                        print(
                                            '==============OrderID: ${posCtrl.productOrderId.value}++++++++++');

                                        print(
                                            '***Order Date***: ${posCtrl.productOrderDate.value}');
                                        print(
                                            '-----Order From: ${posCtrl.orderStatus}');

                                        if (posCtrl.productPaymentConfirmed
                                                .value ==
                                            true) {
                                          // Call payment function if payment is confirmed

                                          payment(
                                              context,
                                              calculateCartTotalAsInt, // Ensure this is an integer
                                              posCtrl.productOrderId.value,
                                              addedCustomerId);
                                          posCtrl.viewPosOrderByIdRes(orderId);
                                        } else {
                                          // If payment is not confirmed, handle it accordingly
                                          clearCart();
                                          ongoingCtrl
                                              .getAllOngoingOrdersList(1);
                                          posCtrl.productOrderId.value = '';
                                          posCtrl.customerId.value = '';
                                          addedCustomerId =
                                              '${posCtrl.viewCashCustomerResData.id}';
                                          Navigator.of(context).pop();
                                          tappedCategoryItem = 'Home';
                                          aggregatorId = '';
                                          selectedValue = null;
                                          aggregatorRefController.text = '';
                                          print(
                                              'Payment not confirmed, resetting order ID.');
                                        }

                                        print(
                                            '!!!!!!!!!!!!!!!!Payment Confirmed: ${posCtrl.productPaymentConfirmed.value}!!!!!!!!!!!!!!');

                                        print(
                                            'Order from Default Add Orders Id: ${posCtrl.productOrderId.value}');
                                        print(
                                            'View Order By Id Date: ${posCtrl.productOrderDate.value}');

                                        // cart.length = 0;

                                        print('Order From Default Add Order');
                                      }
                                    });
                                  } else if (orderId != '' &&
                                      posCtrl.viewPosOrderByIdResData.status ==
                                          'CHDRAFT') {
                                    posCtrl
                                        .postOrderFromFloorPlan(
                                      orderInfo: orderInfo,
                                      orderId: posCtrl.productOrderId.value,
                                      // posCtrl.orderStatus ==
                                      //         'OrderFromTables'
                                      //     ? '${tableCtrl.addPosOrderFromFloorPlanResData.id}'
                                      //     : posCtrl.orderStatus ==
                                      //             'OrderFromReservation'
                                      //         ? posCtrl.reservationOrderId.value
                                      //         : '${tableCtrl.addPosOrderFromFloorPlanResData.id}',
                                      // status == 'CHDRAFT' ? (posCtrl.viewPosOrderByIdResData?.id?.isEmpty ?? true ? '${tableCtrl.addPosOrderFromFloorPlanResData.id}' : '${posCtrl.viewPosOrderByIdResData.id}') : '${tableCtrl.addPosOrderFromFloorPlanResData.id}',
                                      subTotal: calculateCartTotalAsInt,
                                      discountAmt: 0,
                                      amtTotal: amountTotal,
                                      totalInclusive: cart.fold<double>(
                                          0,
                                          (previousValue, item) =>
                                              previousValue + (item.inclTax)),
                                      totalExclusive: cart.fold<double>(
                                          0,
                                          (previousValue, item) =>
                                              previousValue + (item.exclTax)),
                                      custId: addedCustomerId == '' ||
                                              addedCustomerId == null
                                          ? posCtrl.viewCashCustomerResData.id
                                              .toString()
                                          : addedCustomerId.toString(),
                                      orderDate: formattedDate,
                                      aggregatorId: aggregatorId == ''
                                          ? null
                                          : aggregatorId,
                                      aggregatorRef:
                                          aggregatorRefController.text == ''
                                              ? null
                                              : aggregatorRefController.text,
                                      waiterId: selectedWaiter == ''
                                          ? null
                                          : selectedWaiter,
                                    )
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.of(context)
                                            .pop(); // Close dialog
                                        posCtrl.productPaymentConfirmed.value =
                                            paymentActive;
                                        print(
                                            '==============OrderID: ${posCtrl.productOrderId.value}++++++++++');

                                        print(
                                            '***Order Date***: ${posCtrl.productOrderDate.value}');
                                        print(
                                            '-----Order From: ${posCtrl.orderStatus}');

                                        if (posCtrl.productPaymentConfirmed
                                                .value ==
                                            true) {
                                          // Call payment function if payment is confirmed
                                          payment(
                                              context,
                                              calculateCartTotalAsInt, // Ensure this is an integer
                                              posCtrl.productOrderId.value,
                                              addedCustomerId);
                                        } else {
                                          // If payment is not confirmed, handle it accordingly
                                          posCtrl.productOrderId.value = '';
                                          ongoingCtrl
                                              .getAllOngoingOrdersList(1);
                                          posCtrl.customerId.value = '';
                                          addedCustomerId =
                                              '${posCtrl.viewCashCustomerResData.id}';
                                          Navigator.of(context).pop();
                                          print(
                                              'Payment not confirmed, resetting order ID.');
                                        }

                                        clearCart();
                                        print(
                                            '!!!!!!!!!!!!!!!!Payment Confirmed: ${posCtrl.productPaymentConfirmed.value}!!!!!!!!!!!');
                                        print(
                                            'Order from reservation/floorplan/tables Orders Id: ${posCtrl.productOrderId.value}');
                                        print(
                                            'View Order By Id Date: ${posCtrl.productOrderDate.value}');

                                        cart.length = 0;
                                        tappedCategoryItem = 'Home';
                                        aggregatorId = '';
                                        selectedValue = null;
                                        aggregatorRefController.text = '';
                                      }
                                    });
                                  } else if (orderId != '' &&
                                      posCtrl.viewPosOrderByIdResData.status ==
                                          'DRAFT' &&
                                      posCtrl.viewPosConfigurationSettingsResData
                                              .updateOrdAuth ==
                                          true) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return Dialog(
                                            alignment: Alignment.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  4), // Set border radius here
                                            ),
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    18, 18, 18, 15),
                                                decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipOval(
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            color:
                                                                posSpecialItems1Color,
                                                            child: Center(
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                              ImageCons
                                                                  .imgCartItemRemove,
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      10),
                                                            )),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: AppScreenUtil()
                                                              .screenHeight(21),
                                                        ),
                                                        Text(
                                                          'Update Order',
                                                          style: pangramMedium(
                                                              size: 10.0,
                                                              color:
                                                                  blackColor),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 12, 10, 23),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Enter Password',
                                                            style: pangramRegular(
                                                                size: 10.0,
                                                                color:
                                                                    blackColor),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        4),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 8),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        32),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                border: Border.all(
                                                                    color: confirmColor
                                                                        .withOpacity(
                                                                            0.5),
                                                                    width:
                                                                        0.8)),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height: AppScreenUtil()
                                                                      .screenHeight(
                                                                          32),
                                                                  width: AppScreenUtil()
                                                                      .screenWidth(
                                                                          60),
                                                                  color:
                                                                      posSpecialItems1Color,
                                                                  child: Center(
                                                                      child: SvgPicture
                                                                          .asset(
                                                                    ImageCons
                                                                        .imgCartItemRemove,
                                                                    height: AppScreenUtil()
                                                                        .screenHeight(
                                                                            10),
                                                                  )),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TextField(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                    maxLines: 1,
                                                                    obscureText:
                                                                        true,
                                                                    style:
                                                                        detailHeadTextStyle,
                                                                    controller:
                                                                        updatePasswordController,
                                                                    onChanged:
                                                                        (value) {
                                                                      // Remove error message when the user types something
                                                                      setState(
                                                                          () {
                                                                        passwordErrorMessage =
                                                                            '';
                                                                      });
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      floatingLabelBehavior:
                                                                          FloatingLabelBehavior
                                                                              .always,
                                                                      contentPadding: const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              8,
                                                                          right:
                                                                              3),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(color: Colors.transparent),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(color: Colors.transparent),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(color: Colors.transparent),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(color: Colors.transparent),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        2),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              passwordErrorMessage,
                                                              style: pangramRegular(
                                                                  size: 8.0,
                                                                  color:
                                                                      confirmColor),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10,
                                                              left: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              setState(() {
                                                                tappedMoreDetails =
                                                                    false;
                                                              });
                                                            },
                                                            child: Container(
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      22),
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      45),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3),
                                                                  border: Border.all(
                                                                      color:
                                                                          blackColor,
                                                                      width:
                                                                          0.7)),
                                                              child: Center(
                                                                child: Text(
                                                                  'Cancel',
                                                                  style:
                                                                      kotDarkModeUnselectedTabLabelStyle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        5),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              posCtrl
                                                                  .addPosOrderFromOngoing(
                                                                password:
                                                                    updatePasswordController
                                                                        .text,
                                                                orderInfo:
                                                                    orderInfo,
                                                                ordType: selectedOrdType ==
                                                                        'Dine In'
                                                                    ? 'DINEIN'
                                                                    : selectedOrdType ==
                                                                            'Take Away'
                                                                        ? 'TAKEAWAY'
                                                                        : 'DELIVERY',
                                                                subTotal:
                                                                    calculateCartTotalAsInt,
                                                                discountAmt: 0,
                                                                amtTotal:
                                                                    amountTotal,
                                                                totalInclusive: cart.fold<
                                                                        double>(
                                                                    0,
                                                                    (previousValue,
                                                                            item) =>
                                                                        previousValue +
                                                                        (item
                                                                            .inclTax)),
                                                                totalExclusive: cart.fold<
                                                                        double>(
                                                                    0,
                                                                    (previousValue,
                                                                            item) =>
                                                                        previousValue +
                                                                        (item
                                                                            .exclTax)),
                                                                custId: addedCustomerId ==
                                                                            '' ||
                                                                        addedCustomerId ==
                                                                            null
                                                                    ? posCtrl
                                                                        .viewCashCustomerResData
                                                                        .id
                                                                        .toString()
                                                                    : addedCustomerId
                                                                        .toString(),
                                                                ordId: posCtrl
                                                                        .productOrderId
                                                                        .value ??
                                                                    orderIdFromOngoingOrders,
                                                                aggregatorId:
                                                                    aggregatorId ==
                                                                            ''
                                                                        ? null
                                                                        : aggregatorId,
                                                                aggregatorRef:
                                                                    aggregatorRefController.text ==
                                                                            ''
                                                                        ? null
                                                                        : aggregatorRefController
                                                                            .text,
                                                                waiterId:
                                                                    selectedWaiter ==
                                                                            ''
                                                                        ? null
                                                                        : selectedWaiter,
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                print(
                                                                    'AddOrder From Ongoing API response:$value, Subtotal: ${calculateCartTotalAsInt.runtimeType}');
                                                                if (value ==
                                                                    true) {
                                                                  posCtrl.productPaymentConfirmed
                                                                          .value =
                                                                      paymentActive;
                                                                  print(
                                                                      '==============OrderID: ${posCtrl.productOrderId.value}++++++++++');

                                                                  print(
                                                                      '***Order Date***: ${posCtrl.productOrderDate.value}');
                                                                  print(
                                                                      '-----Order From: ${posCtrl.orderStatus}');

                                                                  if (posCtrl
                                                                          .productPaymentConfirmed
                                                                          .value ==
                                                                      true) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    // Call payment function if payment is confirmed
                                                                    payment(
                                                                        context,
                                                                        calculateCartTotalAsInt, // Ensure this is an integer
                                                                        posCtrl
                                                                            .productOrderId
                                                                            .value,
                                                                        addedCustomerId);
                                                                  } else {
                                                                    // If payment is not confirmed, handle it accordingly
                                                                    posCtrl
                                                                        .productOrderId
                                                                        .value = '';
                                                                    ongoingCtrl
                                                                        .getAllOngoingOrdersList(
                                                                            1);
                                                                    posCtrl
                                                                        .customerId
                                                                        .value = '';
                                                                    addedCustomerId =
                                                                        '${posCtrl.viewCashCustomerResData.id}';
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    print(
                                                                        'Payment not confirmed, resetting order ID.');
                                                                  }

                                                                  clearCart();
                                                                  print(
                                                                      '!!!!!!!!!!!!!!!!Payment Confirmed: ${posCtrl.productPaymentConfirmed.value}!!!!!!!!!!!');
                                                                  // posCtrl.viewPosOrderByIdRes(
                                                                  //     '${posCtrl.posAddOrderFromOngoingData.data!.id}');
                                                                  print(
                                                                      'Order from Ongoing Orders Id: ${posCtrl.posAddOrderFromOngoingData.data!.id}');
                                                                  print(
                                                                      'View Order By Id Date: ${posCtrl.productOrderDate.value}');
                                                                  // addedCustomerId =
                                                                  //     '${posCtrl.viewCashCustomerResData.id}';
                                                                  cart.length =
                                                                      0;
                                                                  tappedCategoryItem =
                                                                      'Home';
                                                                  aggregatorId =
                                                                      '';
                                                                  selectedValue =
                                                                      null;
                                                                  aggregatorRefController
                                                                      .text = '';
                                                                } else if (value ==
                                                                    false) {
                                                                  passwordError(
                                                                      context);
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              height: AppScreenUtil()
                                                                  .screenHeight(
                                                                      22),
                                                              width: AppScreenUtil()
                                                                  .screenWidth(
                                                                      91),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    confirmColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                // border: Border.all(color: blackColor,width: 1)
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'Submit',
                                                                  style: pangramMedium(
                                                                      size:
                                                                          10.0,
                                                                      color:
                                                                          whiteColor),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppScreenUtil()
                                                          .screenHeight(8),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        });
                                      },
                                    );
                                  }
                                  // else {
                                  //   posCtrl
                                  //       .addPosOrderFromOngoing(
                                  //     password: updatePasswordController.text,
                                  //     orderInfo: orderInfo,
                                  //     ordType: selectedOrdType == 'Dine In'
                                  //         ? 'DINEIN'
                                  //         : selectedOrdType == 'Take Away'
                                  //             ? 'TAKEAWAY'
                                  //             : 'DELIVERY',
                                  //     subTotal: calculateCartTotalAsInt,
                                  //     discountAmt: 0,
                                  //     amtTotal: amountTotal,
                                  //     totalInclusive: cart.fold<double>(
                                  //         0,
                                  //         (previousValue, item) =>
                                  //             previousValue + (item.inclTax)),
                                  //     totalExclusive: cart.fold<double>(
                                  //         0,
                                  //         (previousValue, item) =>
                                  //             previousValue + (item.exclTax)),
                                  //     custId: addedCustomerId ==''|| addedCustomerId ==null?posCtrl.viewCashCustomerResData.id.toString():addedCustomerId.toString(),
                                  //     ordId: posCtrl.productOrderId.value ??
                                  //         orderIdFromOngoingOrders,
                                  //     aggregatorId: aggregatorId == ''
                                  //         ? null
                                  //         : aggregatorId,
                                  //     aggregatorRef:
                                  //         aggregatorRefController.text == ''
                                  //             ? null
                                  //             : aggregatorRefController.text,
                                  //     waiterId: selectedWaiter == ''
                                  //         ? null
                                  //         : selectedWaiter,
                                  //   )
                                  //       .then((value) {
                                  //     print(
                                  //         'AddOrder From Ongoing API response:$value, Subtotal: ${calculateCartTotalAsInt.runtimeType}');
                                  //     if (value == true) {
                                  //       setState(() {
                                  //         orderPlaced = true;
                                  //       });
                                  //       Navigator.pop(
                                  //           context); // Closes the most recent dialog
                                  //       Navigator.of(context)
                                  //           .pop(); // Close dialog
                                  //       Navigator.of(context)
                                  //           .pop(); // Close bottom sheet
                                  //       clearCart();
                                  //       posCtrl.viewPosOrderByIdRes(
                                  //           '${posCtrl.posAddOrderFromOngoingData.data!.id}');
                                  //       print(
                                  //           'Order from Ongoing Orders Id: ${posCtrl.posAddOrderFromOngoingData.data!.id}');
                                  //       print(
                                  //           'View Order By Id Date: ${posCtrl.productOrderDate.value}');
                                  //       // addedCustomerId =
                                  //       //     '${posCtrl.viewCashCustomerResData.id}';
                                  //       cart.length = 0;
                                  //       tappedCategoryItem = 'Home';
                                  //       aggregatorId = '';
                                  //       selectedValue = null;
                                  //       aggregatorRefController.text = '';
                                  //     }
                                  //   });
                                  // }
                                }
                              },
                              child: Container(
                                height: AppScreenUtil().screenHeight(22),
                                width: AppScreenUtil().screenWidth(91),
                                decoration: BoxDecoration(
                                  color: confirmColor,
                                  borderRadius: BorderRadius.circular(3),
                                  // border: Border.all(color: blackColor,width: 1)
                                ),
                                child: Center(
                                  child: Text(
                                    'Confirm',
                                    style: kotSelectedTabLabelStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppScreenUtil().screenHeight(8),
                      ),
                    ],
                  )),
            );
          });
        });
  }

  ///Textform field validation
  validateFields() {
    isValidCustomerName =
        AppUtils.validationOfName(customerNameController.text);
    // isValidCustomerMobile =
    //     AppUtils.validationOfName(customerMobileController.text);
    setState(() {});
  }

  validatePassword() {
    isValidPassword =
        AppUtils.validationOfPassword(updatePasswordController.text);
  }
}

class CartItem {
  final ViewProductsForPosModel product;
  dynamic quantity;
  dynamic updatedPrice;
  dynamic tax;
  dynamic inclTax;
  dynamic exclTax;
  dynamic subTotalWoTax;
  dynamic linTotal;
  dynamic amtTotal;
  dynamic batchId;
  dynamic kotId;
  dynamic kotStatus;
  dynamic objType;
  dynamic customerNote;
  CartItem(
      {required this.product,
      this.quantity = 1,
      this.updatedPrice,
      this.tax,
      this.amtTotal,
      this.inclTax,
      this.exclTax,
      this.batchId,
      this.kotId,
      this.kotStatus,
      this.objType = 'eq',
      this.customerNote});
}

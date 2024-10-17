// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_awesome_calculator/flutter_awesome_calculator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/admin_app/widgets/empty_layout.dart';
import 'package:restaurant/presentation/common/features/error/app_error.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import 'package:restaurant/utiles/image_constant.dart';

import '../../../../../../styles/textstyles.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dotted_textfield.dart';

class CartConfirmPayment extends StatefulWidget {
  final dynamic calculateCartTotalAsString;
  final dynamic orderType;
  dynamic addedCustomerId;
  dynamic orderId;
  dynamic orderDate;
  // void clearCart;
  dynamic tappedCategoryItem;
  dynamic isPayment;
  CartConfirmPayment(
      this.calculateCartTotalAsString,
      this.orderType,
      this.addedCustomerId,
      this.orderId,
      this.orderDate,
      // this.clearCart,
      this.tappedCategoryItem,
      this.isPayment,
      {super.key});

  @override
  State<CartConfirmPayment> createState() => _CartConfirmPaymentState();
}

class _CartConfirmPaymentState extends State<CartConfirmPayment> {
  final deliveryChargeController = TextEditingController();
  final orderAmountController = TextEditingController();
  final discountController = TextEditingController();
  final changeController = TextEditingController();
  final walletController = TextEditingController();
  final cashOrCardController = TextEditingController();
  final approvalCodeController = TextEditingController();
  final packingChargeController = TextEditingController();
  final updatePasswordController = TextEditingController();
  final Map<int, TextEditingController> approvalCodeControllers = {};
  final Map<int, TextEditingController> amountControllers = {};

  String? selectedDebitOrCredit;
  final List<String> _dropdownItems = ['Debit', 'Credit'];
  String selectedValue = '';
  String passwordErrorMessage = '';

  ///API
  final posCtrl = Get.find<POSController>();
  final ongoingCtrl = Get.find<OngoingOrdersController>();
  // Track the selected payment types (cash, card)
  bool isCashSelected = false;
  bool isCardSelected = false;
  double orderAmount = 0.0;
  double deliveryCharge = 0.0;
  double packagingCharge = 0.0;
  double discount = 0.0;
  double totalAmount = 0.0;
  double amount = 0.0;
  List<double> paidAmounts = [];
  double change = 0.0;
  double remainingBalance = 0.0;
  double walletAmount = 0.0;
  dynamic selectedJournalId;
  dynamic walletBalance;

  // Initialize controllers correctly
  void initializeControllers() {
    selectedTypes.forEach((item) {
      if (item['controller'] == null) {
        String initialAmount =
            item['amount']?.toString() ?? '0.0'; // Ensure 'amount' is a string
        item['controller'] =
            TextEditingController(text: initialAmount) as String;
      }
    });
  }

  // Helper method to format the duration
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = duration.inHours.toString();
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  ///list of selected types
  List<Map<String, String>> selectedTypes = [];
  void calculateTotalAmount() {
    if (widget.orderType == 'DELIVERY') {
      // Both delivery charge and packaging charge are enabled, so just subtract discount

      totalAmount = orderAmount + deliveryCharge + packagingCharge - discount;
      setState(() {
        remainingBalance = totalAmount;
      });
    } else if (widget.orderType == 'TAKEAWAY') {
      totalAmount = orderAmount + packagingCharge - discount;
      setState(() {
        remainingBalance = totalAmount;
      });
    } else {
      // Either delivery charge or packaging charge (or both) are not enabled
      totalAmount = orderAmount - discount;
      setState(() {
        remainingBalance = totalAmount;
      });
    }
  }

  double getTotalPaidAmount() {
    return paidAmounts.fold(0.0, (sum, amount) => sum + amount);
  }

  void calculateAmount(double totalPaidAmount) {
    setState(() {
      double difference = totalPaidAmount - totalAmount;

      if (difference > 0) {
        setState(() {
          change = difference;
          remainingBalance = 0.0;
        });
      } else {
        // Ensure remainingBalance is never negative
        remainingBalance = difference < 0 ? -difference : 0.0;
        setState(() {
          change = 0.0;
        });
      }

      // Debug print for verification
      print('Change: $change, Balance: $remainingBalance');
    });
  }

  void updateCalculations() {
    double totalPaidAmount = getTotalPaidAmount();
    calculateAmount(totalPaidAmount);
  }

  @override
  void initState() {
    posCtrl.getAllPaymentsForPOSByBranchList();
    posCtrl.getAllCardsList();
    posCtrl.viewCustomerWalletRes(widget.addedCustomerId);
    posCtrl.viewPosConfigurationSettings();
    posCtrl.getViewCashCustomer();
    posCtrl.viewPosOrderByIdRes(posCtrl.productOrderId.value).then((_) {
      widget.orderDate = posCtrl.productOrderDate.value;
      widget.orderId = posCtrl.productOrderId.value;
      print('Hello Date: ${widget.orderDate}');
      print('***OrderId: ${posCtrl.productOrderId.value}');
      print('***OrderDate: ${posCtrl.productOrderDate.value}');
    });

    orderAmountController.text = widget.calculateCartTotalAsString.toString();
    deliveryChargeController.text =
        posCtrl.viewPosConfigurationSettingsResData.deliveryCharge == true
            ? posCtrl.viewPosConfigurationSettingsResData.deliveryAmt.toString()
            : '0';
    packingChargeController.text =
        posCtrl.viewPosConfigurationSettingsResData.packagingCharge == true
            ? posCtrl.viewPosConfigurationSettingsResData.pkgCharge.toString()
            : '0';
    print('OrderType: ${widget.orderType}');
    deliveryCharge = double.parse(deliveryChargeController.text);
    packagingCharge = double.parse(packingChargeController.text);
    print('Order Amount: ${orderAmountController.text}');
    orderAmount = double.parse(widget.calculateCartTotalAsString.toString());
    totalAmount = orderAmount;
    remainingBalance = totalAmount;
    print('RemainingBalance: $remainingBalance');
    calculateTotalAmount();
    print(
        'Active Wallet: ${posCtrl.viewPosConfigurationSettingsResData.activeWalletStatus}');
    for (int i = 0; i < selectedTypes.length; i++) {
      Object amount = selectedTypes[i]['amount'] ?? 0.0;
      amountControllers[i] = TextEditingController(
        text: amount.toString(), // Assign value to controller from the list
      );
    }

    print('Added Customer Id: ${widget.addedCustomerId}');
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of controllers
    approvalCodeControllers.values
        .forEach((controller) => controller.dispose());
    amountControllers.values.forEach((controller) => controller.dispose());
    approvalCodeControllers.values
        .forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        children: [
                          DottedTextFields(
                            readonly: true,
                            borderColor: rolesAndPermissionsDropDownBorderColor
                                .withOpacity(0.7),
                            buttonColor: blackColor,
                            controller: orderAmountController,
                            title: 'Order Amount',
                          ),
                          // widget.orderType == 'TAKEAWAY' ||
                          widget.orderType == 'DELIVERY'
                              ? SizedBox(
                                  height: AppScreenUtil().screenHeight(18),
                                )
                              : SizedBox(),
                          // widget.orderType == 'TAKEAWAY' ||
                          widget.orderType == 'DELIVERY'
                              ? DottedTextFields(
                                  readonly:
                                      posCtrl.viewPosConfigurationSettingsResData
                                                  .deliveryCharge ==
                                              true
                                          ? true
                                          : false,
                                  borderColor:
                                      rolesAndPermissionsDropDownBorderColor
                                          .withOpacity(0.7),
                                  buttonColor: blackColor,
                                  controller: deliveryChargeController,
                                  title: 'Delivery Charge',
                                  onChanged: (value) {
                                    setState(() {
                                      deliveryCharge =
                                          double.tryParse(value!) ?? 0.0;
                                      calculateTotalAmount();
                                    });
                                  },
                                )
                              : SizedBox(),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(18),
                          ),
                          widget.orderType == 'TAKEAWAY' ||
                                  widget.orderType == 'DELIVERY'
                              ? DottedTextFields(
                                  readonly:
                                      posCtrl.viewPosConfigurationSettingsResData
                                                  .packagingCharge ==
                                              true
                                          ? true
                                          : false,
                                  borderColor:
                                      rolesAndPermissionsDropDownBorderColor
                                          .withOpacity(0.7),
                                  buttonColor: blackColor,
                                  controller: packingChargeController,
                                  title: 'Packaging charge',
                                  onChanged: (value) {
                                    setState(() {
                                      packagingCharge =
                                          double.tryParse(value!) ?? 0.0;
                                      calculateTotalAmount();
                                    });
                                  },
                                )
                              : SizedBox(),
                          widget.orderType == 'TAKEAWAY' ||
                                  widget.orderType == 'DELIVERY'
                              ? SizedBox(
                                  height: AppScreenUtil().screenHeight(18),
                                )
                              : SizedBox(),
                          DottedTextFields(
                            readonly: false,
                            borderColor: rolesAndPermissionsDropDownBorderColor
                                .withOpacity(0.7),
                            buttonColor: blackColor,
                            controller: discountController,
                            onChanged: (value) {
                              setState(() {
                                discount = double.tryParse(value!) ?? 0.0;
                                calculateTotalAmount();
                              });
                            },
                            title: 'Discount',
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Your button and other widgets
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: searchTextColor.withOpacity(0.8),
                      offset: Offset(1, 1),
                      blurRadius: 5,
                    ),
                  ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: selectFloorTextStyle,
                        ),
                        Text(
                          totalAmount.toStringAsFixed(2),
                          style: selectFloorTextStyle,
                        ),
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: GestureDetector(
                onTap: () {
                  cartPaymentMethod(
                    context,
                  );
                },
                child: CustomButton(
                  buttonHeight: AppScreenUtil().screenHeight(43),
                  buttonWidth: double.infinity,
                  buttonColor: confirmColor,
                  borderRadius: 2,
                  buttonText: 'Payment Method',
                  buttonLabelStyle: tableTitleLabelStyleForSalesReport,
                ),
              ),
            ),
          ],
        ),
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
    );
  }

  void cartPaymentMethod(BuildContext context) {
    print(
        'Wallet: ${posCtrl.viewCustomerWalletResData.customerName}, balance: ${posCtrl.viewCustomerWalletResData.walletBalance}');
    walletBalance = '${posCtrl.viewCustomerWalletResData.walletBalance}';
    List<Map<String, dynamic>> paymentMethod = [];
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
                  child: Stack(children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 30, top: 10),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 40, 15, 20),
                                child: Column(
                                  children: [
                                    Container(
                                      height: AppScreenUtil().screenHeight(37),
                                      width: double.infinity,
                                      color: confirmColor,
                                      child: Center(
                                        child: Text(
                                          'Payment Method',
                                          style:
                                              tableTitleLabelStyleForSalesReport,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(10),
                                    ),
                                    Obx(() => (posCtrl
                                                .allPaymentForPosByBranchLoading
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
                                        : (posCtrl.isPaymentForPosByBranchListError
                                                    .value ==
                                                true)
                                            ? SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3,
                                                child: Center(
                                                    child: AppErrorScreen(
                                                  buttonOnTap: () {
                                                    posCtrl
                                                        .getAllPaymentsForPOSByBranchList();
                                                  },
                                                )))
                                            : (posCtrl
                                                    .allPaymentTypeViewMainList
                                                    .isEmpty)
                                                ? SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3,
                                                    child: const Center(
                                                        child: EmptyLayout()))
                                                : ListView.separated(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: posCtrl
                                                        .allPaymentTypeViewMainList
                                                        .length,
                                                    itemBuilder:
                                                        (context, int index) {
                                                      var paymentType = posCtrl
                                                              .allPaymentTypeViewMainList[
                                                          index];

                                                      // Check if the type is 'card'
                                                      if (paymentType.type ==
                                                          'card') {
                                                        var matchingCards = posCtrl
                                                            .allCardsViewMainList
                                                            .where((card) =>
                                                                card.journalId ==
                                                                paymentType
                                                                    .journalId)
                                                            .toList();

                                                        List<String?>
                                                            cardNames =
                                                            matchingCards
                                                                .map((card) =>
                                                                    card.cardName)
                                                                .toList();

                                                        String?
                                                            selectedCardName =
                                                            paymentType
                                                                .journalName;
                                                        String selectedCardId =
                                                            ''; // Add cardId here for selected card

                                                        // Get the journalId from paymentType
                                                        selectedJournalId =
                                                            paymentType
                                                                .journalId;
                                                        selectedCardId =
                                                            paymentType.id;
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              remainingBalance =
                                                                  paidAmounts
                                                                          .isEmpty
                                                                      ? remainingBalance
                                                                      : 0.0;
                                                              selectedTypes
                                                                  .add({
                                                                'type': 'card',
                                                                'journalId':
                                                                    selectedJournalId ??
                                                                        '',
                                                                'cardId':
                                                                    selectedCardId ??
                                                                        '', // Ensure cardId is handled
                                                                'journalName':
                                                                    selectedCardName ??
                                                                        '',
                                                                'amount':
                                                                    remainingBalance
                                                                        .toString()
                                                              });
                                                              print(
                                                                  'Paid Amount: ${paidAmounts.toString()}, Journal Id: ${selectedJournalId}, Card Id: ${selectedCardId}');
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15),
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        37),
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: searchTextColor
                                                                      .withOpacity(
                                                                          0.8),
                                                                  offset:
                                                                      Offset(
                                                                          1, 1),
                                                                  blurRadius: 5,
                                                                ),
                                                              ],
                                                              color: whiteColor,
                                                            ),
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              dropdownColor:
                                                                  whiteColor,
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 3,
                                                                      right:
                                                                          10),
                                                              value: cardNames
                                                                      .contains(
                                                                          selectedCardName)
                                                                  ? selectedCardName
                                                                  : null,
                                                              items: matchingCards.map<
                                                                  DropdownMenuItem<
                                                                      String>>((card) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: card
                                                                      .cardName,
                                                                  child: Text(
                                                                    card.cardName ??
                                                                        'Unknown',
                                                                    style:
                                                                        paymentCashTextStyle,
                                                                  ),
                                                                );
                                                              }).toList(),
                                                              onChanged: (String?
                                                                  newValue) {
                                                                setState(() {
                                                                  // Update selected card name
                                                                  selectedCardName =
                                                                      newValue;

                                                                  // Find the corresponding card object
                                                                  var selectedCard =
                                                                      matchingCards.firstWhere((card) =>
                                                                          card.cardName ==
                                                                          selectedCardName);

                                                                  // Get its journalId and cardId
                                                                  selectedJournalId =
                                                                      selectedCard
                                                                          .journalId;
                                                                  selectedCardId =
                                                                      selectedCard
                                                                          .id!; // Get cardId

                                                                  // Calculate remaining balance if paidAmounts is empty
                                                                  remainingBalance =
                                                                      paidAmounts
                                                                              .isEmpty
                                                                          ? remainingBalance
                                                                          : 0.0;

                                                                  // Add selected card details to paidAmounts and selectedTypes
                                                                  paidAmounts.add(
                                                                      remainingBalance);
                                                                  selectedTypes
                                                                      .add({
                                                                    'type':
                                                                        'card',
                                                                    'journalId':
                                                                        selectedJournalId ??
                                                                            '',
                                                                    'cardId':
                                                                        selectedCardId, // Add cardId here
                                                                    'journalName':
                                                                        selectedCardName ??
                                                                            '',
                                                                    'amount':
                                                                        remainingBalance
                                                                            .toString(),
                                                                  });
                                                                  print(
                                                                      'Paid Amount: ${paidAmounts.toString()}, Journal Id: ${selectedJournalId}, Card Id: ${selectedCardId}');
                                                                });
                                                              },
                                                              hint: Text(
                                                                paymentType
                                                                        .journalName ??
                                                                    "Select Card",
                                                                style:
                                                                    paymentCashTextStyle,
                                                              ),
                                                              isExpanded: true,
                                                              icon: Icon(
                                                                  Icons
                                                                      .arrow_downward,
                                                                  color: Colors
                                                                      .transparent),
                                                              iconSize: 1,
                                                              underline:
                                                                  SizedBox(),
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      // Handle non-card types (e.g. cash)
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            // Get the journalId from paymentType
                                                            selectedJournalId =
                                                                paymentType
                                                                    .journalId;

                                                            remainingBalance =
                                                                paidAmounts
                                                                        .isEmpty
                                                                    ? remainingBalance
                                                                    : 0.0;
                                                            selectedTypes.add({
                                                              'type': 'cash',
                                                              'journalId':
                                                                  selectedJournalId ??
                                                                      '',
                                                              'cardId':
                                                                  '', // No cardId for non-card types
                                                              'journalName':
                                                                  paymentType
                                                                          .journalName ??
                                                                      '',
                                                              'amount':
                                                                  remainingBalance
                                                                      .toString(),
                                                            });
                                                            paidAmounts.add(
                                                                remainingBalance);
                                                            print(
                                                                'Paid Amount: ${paidAmounts.toString()}, Journal Id: ${selectedJournalId}, Card Id: ');
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15),
                                                          height:
                                                              AppScreenUtil()
                                                                  .screenHeight(
                                                                      39),
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: searchTextColor
                                                                    .withOpacity(
                                                                        0.8),
                                                                offset: Offset(
                                                                    1, 1),
                                                                blurRadius: 5,
                                                              ),
                                                            ],
                                                            color: whiteColor,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              paymentType
                                                                  .journalName
                                                                  .toString(),
                                                              style:
                                                                  paymentCashTextStyle,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return SizedBox(
                                                        height: AppScreenUtil()
                                                            .screenHeight(10),
                                                      );
                                                    },
                                                  )),
                                    posCtrl.viewPosConfigurationSettingsResData
                                                    .activeWalletStatus ==
                                                true &&
                                            posCtrl.viewCustomerWalletResData
                                                    .customerName !=
                                                null
                                        ? SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(10),
                                          )
                                        : SizedBox(),
                                    posCtrl.viewPosConfigurationSettingsResData
                                                    .activeWalletStatus ==
                                                true &&
                                            posCtrl.viewCustomerWalletResData
                                                    .customerName !=
                                                null
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                // Convert walletBalance from String to double, defaulting to 0.0 if parsing fails
                                                double walletAmount =
                                                    double.tryParse(
                                                            walletBalance) ??
                                                        0.0;

                                                if (walletAmount <
                                                        orderAmount &&
                                                    paidAmounts.isEmpty) {
                                                  // Use the full walletAmount if it's less than orderAmount
                                                  remainingBalance =
                                                      orderAmount -
                                                          walletAmount;
                                                  walletAmount =
                                                      0; // Set walletAmount to 0 since the full amount was used
                                                } else {
                                                  // Subtract orderAmount from walletAmount
                                                  walletAmount = walletAmount -
                                                      orderAmount;
                                                  remainingBalance =
                                                      orderAmount -
                                                          walletAmount;
                                                  remainingBalance = 0.0;
                                                }

                                                // Convert walletAmount back to String to update walletBalance
                                                walletBalance = walletAmount
                                                    .toStringAsFixed(
                                                        2); // Format with 2 decimal places

                                                // Add the payment type and journal name to selectedTypes
                                                selectedJournalId = posCtrl
                                                    .viewPosConfigurationSettingsResData
                                                    .activeWallet!
                                                    .activeWalletJournel;

                                                paidAmounts
                                                    .add(remainingBalance);
                                                selectedTypes.add({
                                                  'type': 'wallet',
                                                  'journalId':
                                                      selectedJournalId ?? '',
                                                  'cardId': '',
                                                  'journalName':
                                                      'Customer Wallet',
                                                  'amount':
                                                      walletBalance, // Use walletBalance as a string directly
                                                });
                                                print(
                                                    'Paid Amount: ${paidAmounts.toString()}, Journal id: ${selectedJournalId}, CardId: ');
                                                // Display remaining balance elsewhere (if needed)
                                                print(
                                                    "Remaining Balance: $remainingBalance"); // Example usage of remaining balance
                                                double totalPaidAmount =
                                                    getTotalPaidAmount();
                                                calculateAmount(
                                                    totalPaidAmount);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 15),
                                              height: AppScreenUtil()
                                                  .screenHeight(39),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: searchTextColor
                                                        .withOpacity(0.8),
                                                    offset: Offset(1, 1),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                                color: whiteColor,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Customer wallet',
                                                    style: paymentCashTextStyle,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Text(
                                                    walletBalance,
                                                    style: pangramMedium(
                                                        size: 11.0,
                                                        color:
                                                            ongoingOrdersGridGreenColor),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(35),
                                    ),
                                    selectedTypes.isNotEmpty
                                        ? Container(
                                            height: AppScreenUtil()
                                                .screenHeight(37),
                                            width: double.infinity,
                                            color: confirmColor,
                                            child: Center(
                                              child: Text(
                                                'Payment Selected',
                                                style:
                                                    tableTitleLabelStyleForSalesReport,
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: AppScreenUtil().screenHeight(15),
                                    ),
                                    ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: selectedTypes.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> type =
                                            selectedTypes[index];

                                        return Dismissible(
                                          key: ValueKey(type['type'] ??
                                              index
                                                  .toString()), // Ensure key uniqueness
                                          background: Container(
                                            color: Colors.red,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Icon(Icons.delete,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          direction:
                                              DismissDirection.endToStart,
                                          onDismissed: (direction) {
                                            setState(() {
                                              // Remove the item from all related lists
                                              selectedTypes.removeAt(index);
                                              approvalCodeControllers
                                                  .remove(index);
                                              amountControllers.remove(index);
                                              paidAmounts.removeAt(index);

                                              // Recalculate the total amount after item removal
                                              double totalPaidAmount =
                                                  getTotalPaidAmount();
                                              calculateAmount(totalPaidAmount);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 13),
                                            height: AppScreenUtil()
                                                .screenHeight(37),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: searchTextColor
                                                      .withOpacity(0.8),
                                                  offset: Offset(1, 1),
                                                  blurRadius: 5,
                                                ),
                                              ],
                                              color: whiteColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Display 'Cash' or the journalName (e.g., 'Master Card')
                                                Text(
                                                  type['journalName'] ??
                                                      'Unknown',
                                                  style: paymentCashTextStyle,
                                                ),

                                                // Approval code input for 'card' type
                                                if (type['type'] != 'cash' &&
                                                    type['type'] != 'wallet')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, bottom: 5),
                                                    child: SizedBox(
                                                      width: AppScreenUtil()
                                                          .screenWidth(69),
                                                      height: double.infinity,
                                                      child: TextField(
                                                        onChanged: (text) {
                                                          selectedTypes[index][
                                                                  'approvalCode'] =
                                                              text;
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller:
                                                            approvalCodeControllers[
                                                                index],
                                                        style: pangramRegular(
                                                            size: 11.0,
                                                            color:
                                                                confirmColor),
                                                        cursorColor: blackColor,
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets.all(9),
                                                          isDense: true,
                                                          hintText:
                                                              'Approval Code',
                                                          hintStyle: pangramRegular(
                                                              size: 8.0,
                                                              color:
                                                                  cartAddOnTextColor),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    subDividerColor,
                                                                width: 1),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    subDividerColor,
                                                                width: 1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                // Amount input for both 'cash' and 'card'
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: SizedBox(
                                                    width: AppScreenUtil()
                                                        .screenWidth(58),
                                                    child: TextField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      controller:
                                                          amountControllers[
                                                              index],
                                                      style: pangramRegular(
                                                          size: 11.0,
                                                          color: confirmColor),
                                                      cursorColor: blackColor,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        isDense: true,
                                                        hintStyle:
                                                            placeholderTextStyle,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          borderSide: BorderSide(
                                                              color: blackColor,
                                                              width: 1.1),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          borderSide: BorderSide(
                                                              color: blackColor,
                                                              width: 1.1),
                                                        ),
                                                      ),
                                                      onChanged: (text) {
                                                        double amount =
                                                            double.tryParse(
                                                                    text) ??
                                                                0.0;

                                                        setState(() {
                                                          selectedTypes[index]
                                                              ['amount'] = text;

                                                          if (index <
                                                              paidAmounts
                                                                  .length) {
                                                            paidAmounts[index] =
                                                                amount;
                                                          } else {
                                                            paidAmounts
                                                                .add(amount);
                                                          }

                                                          double
                                                              totalPaidAmount =
                                                              getTotalPaidAmount();
                                                          calculateAmount(
                                                              totalPaidAmount);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                            height: AppScreenUtil()
                                                .screenHeight(7));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15, top: 20),
                          child: Container(
                              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                              decoration:
                                  BoxDecoration(color: whiteColor, boxShadow: [
                                BoxShadow(
                                  color: searchTextColor.withOpacity(0.8),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                ),
                              ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Amount',
                                          style: selectFloorTextStyle,
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(10),
                                        ),
                                        Text(
                                          'Change',
                                          style: backTextStyle,
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(10),
                                        ),
                                        Text(
                                          'Balance',
                                          style: takeAwayTextStyle,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          totalAmount.toString(),
                                          style: selectFloorTextStyle,
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(10),
                                        ),
                                        Text(
                                          change.toString(),
                                          style: backTextStyle,
                                        ),
                                        SizedBox(
                                          height:
                                              AppScreenUtil().screenHeight(10),
                                        ),
                                        Text(
                                          remainingBalance.toString(),
                                          style: takeAwayTextStyle,
                                        )
                                      ],
                                    )
                                  ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              DateTime orderDateTime =
                                  DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .parse(posCtrl.productOrderDate.value);
                              DateTime now = DateTime.now();

                              // Format the current date and time
                              String formattedCurrentDate =
                                  DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

                              // Calculate the duration between the current date and the order date
                              Duration difference =
                                  now.difference(orderDateTime);
                              String formattedDifference = formatDuration(
                                  difference); // Format as "hours:minutes:seconds"
                              print('Added Date: ${widget.orderDate}');
                              print('formatted Duration: $formattedDifference');
                              print(
                                  'formattedCurrentDate: $formattedCurrentDate');
                              for (int i = 0; i < selectedTypes.length; i++) {
                                var paymentTypes = selectedTypes[i];

                                // Convert amount from string to integer
                                // Convert amount to int, handling double values as well
                                var amountValue = paymentTypes['amount'] ??
                                    0; // Could be a double
                                var paidAmount = (amountValue is double)
                                    ? amountValue.toInt()
                                    : int.tryParse(amountValue.toString()) ?? 0;
                                print(
                                    '#######PaidAmt: ${paidAmount.runtimeType}');
                                var paymentData = {
                                  "type": paymentTypes['type'],
                                  "journalId": paymentTypes['journalId'],
                                  "paidAmt":
                                      paidAmount, // Now paidAmt is always an integer
                                  "cardId": paymentTypes['cardId'] ??
                                      '', // If there's no cardId, add an empty string
                                };

                                print(
                                    'Payment Data: $paymentData'); // Log to verify correctness

                                // Check if paymentTypes contains 'approvalCode' and it has a value
                                if (paymentTypes.containsKey('approvalCode') &&
                                    paymentTypes['approvalCode']!.isNotEmpty) {
                                  // Add the approvalCode field only if it exists and is not empty
                                  paymentData["approvalCode"] =
                                      paymentTypes['approvalCode'];
                                }

                                // Add the paymentData to the paymentMethod list
                                paymentMethod.add(paymentData);
                              }
                              print(
                                  'Discount---${discountController.text.runtimeType}---');
                              print(
                                  'Delivery---${deliveryChargeController.text.runtimeType}---');
                              print(
                                  'Packaging Charge---${packingChargeController.text.runtimeType}---');
                              print(
                                  'Packaging Charge---${packingChargeController.text.runtimeType}---');
                              print(
                                  'Default CustomerId: ${posCtrl.viewCashCustomerResData.id} and selected Customer id: ${widget.addedCustomerId}, Remaining Balance: $remainingBalance, Change: $change');
                              if (widget.orderId != null &&
                                  widget.orderId.isNotEmpty) {
                                // Check if remainingBalance is greater than 0 and customer IDs match
                                if (remainingBalance > 0) {
                                  // Check if addedCustomerId is null or empty or matches the default cash customer ID
                                  if (widget.addedCustomerId == null ||
                                      widget.addedCustomerId.isEmpty ||
                                      posCtrl.viewCashCustomerResData.id ==
                                          widget.addedCustomerId) {
                                    creditError(context);
                                    return; // Prevent further execution if balance exists
                                  }
                                }
                                if (paymentMethod.isEmpty &&
                                    (widget.addedCustomerId != '' ||
                                        widget.addedCustomerId != null)) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return Dialog(
                                            alignment: Alignment.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  18, 18, 18, 15),
                                              decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Center(
                                                    child: SvgPicture.asset(
                                                      ImageCons
                                                          .imgAlertIconMain,
                                                      height: AppScreenUtil()
                                                          .screenHeight(25),
                                                      width: AppScreenUtil()
                                                          .screenWidth(25),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: AppScreenUtil()
                                                          .screenHeight(10)),
                                                  Center(
                                                    child: Text(
                                                      'Balance amount will be added to',
                                                      style: pangramMedium(
                                                          size: 11.0,
                                                          color: blackColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: AppScreenUtil()
                                                          .screenHeight(2)),
                                                  Center(
                                                    child: Text(
                                                      'customer credit!!',
                                                      style: pangramMedium(
                                                          size: 11.0,
                                                          color: blackColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: AppScreenUtil()
                                                          .screenHeight(10)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10,
                                                            left: 10,
                                                            top: 17),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        25),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        80),
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
                                                                style: pangramMedium(
                                                                    size: 9.0,
                                                                    color:
                                                                        blackColor),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        5)),
                                                        GestureDetector(
                                                          onTap: () {
                                                            posCtrl
                                                                .addPOSPayment(
                                                                    paymentMethod:
                                                                        paymentMethod,
                                                                    ordId: widget
                                                                        .orderId,
                                                                    password: updatePasswordController
                                                                        .text,
                                                                    discountAmt:
                                                                        int.tryParse(discountController.text) ??
                                                                            0, // Convert to int
                                                                    deliveryCharge: widget.orderType ==
                                                                            'TAKEAWAY'
                                                                        ? 0
                                                                        : int.tryParse(deliveryChargeController.text) ??
                                                                            0, // Convert to int
                                                                    pkgCharge:
                                                                        int.tryParse(packingChargeController.text) ??
                                                                            0, // Convert to int
                                                                    // ignore: unnecessary_type_check
                                                                    amtTotal: (totalAmount
                                                                            is double)
                                                                        ? totalAmount
                                                                            .toInt()
                                                                        : int.tryParse(totalAmount.toString()) ??
                                                                            totalAmount,
                                                                    paymentDate:
                                                                        formattedCurrentDate,
                                                                    custId: widget.addedCustomerId == ''
                                                                        ? posCtrl
                                                                            .viewCashCustomerResData
                                                                            .id
                                                                        : widget
                                                                            .addedCustomerId,
                                                                    ordDuration:
                                                                        formattedDifference)
                                                                .then((value) {
                                                              if (value ==
                                                                  true) {
                                                                widget.isPayment ==
                                                                        true
                                                                    ? dispose
                                                                    : Navigator.of(
                                                                            context)
                                                                        .pop(); // Close dialog
                                                                ongoingCtrl
                                                                    .getAllOngoingOrdersList(
                                                                        1);
                                                                widget.isPayment ==
                                                                        true
                                                                    ? dispose
                                                                    : Navigator.of(
                                                                            context)
                                                                        .pop(); // Close dialog
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close bottom sheet
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close bottom sheet
                                                                print(
                                                                    'TappedCategoryItem: ${widget.tappedCategoryItem}');
                                                                setState(() {
                                                                  // widget.clearCart;
                                                                  widget.tappedCategoryItem =
                                                                      widget
                                                                          .tappedCategoryItem;
                                                                  posCtrl
                                                                      .productOrderId
                                                                      .value = '';
                                                                  widget.addedCustomerId =
                                                                      '${posCtrl.viewCashCustomerResData.id}';
                                                                });
                                                                // cart.length =
                                                                //     0;
                                                                wallet(context);
                                                              }
                                                            });
                                                          },
                                                          child: Container(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        25),
                                                            width:
                                                                AppScreenUtil()
                                                                    .screenWidth(
                                                                        65),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  confirmColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Pay',
                                                                style: pangramMedium(
                                                                    size: 10.0,
                                                                    color:
                                                                        whiteColor),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                      });
                                  return; // Prevent further execution if paymentMethod is empty and customer ID is not chosen
                                }

                                // Check if change is greater than 0
  if (change > 0) {
    // Check if addedCustomerId is empty or null or matches the default cash customer ID
    if (widget.addedCustomerId == '' ||
        widget.addedCustomerId == null ||
        posCtrl.viewCashCustomerResData.id == widget.addedCustomerId) {
      changeNotCleared(context);
      return; // Prevent further execution if change exists
    }
  }

//                                 if (change > 0 &&
//                                         widget.addedCustomerId != '' ||
//                                     widget.addedCustomerId != null ||
//                                     posCtrl.viewCashCustomerResData.id !=
//                                         widget.addedCustomerId) {
//                                   showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return StatefulBuilder(
//                                             builder: (context, setState) {
//                                           for (int i = 0;
//                                               i < selectedTypes.length;
//                                               i++) {
//                                             var paymentTypes = selectedTypes[i];

//                                             // Extract values from selectedTypes
//                                             String type = paymentTypes[
//                                                     'type'] ??
//                                                 ''; // Default to empty string if not found
//                                             String journalName = paymentTypes[
//                                                     'journalName'] ??
//                                                 ''; // Default to empty string if not found
//                                             String amountString = paymentTypes[
//                                                     'amount'] ??
//                                                 '0.0'; // Default to '0.0' if not found

//                                             double amount = double.tryParse(
//                                                     amountString) ??
//                                                 0.0; // Convert amountString to double

//                                             // Example values for cardId, journalId, and paidAmt
//                                             // You can adjust these based on your actual requirements
//                                             String cardId =
//                                                 ''; // Assign a value if necessary
//                                             String journalId =
//                                                 ''; // Assign a value if necessary
//                                             double paidAmt =
//                                                 amount; // Use the amount as the paid amount

//                                             // Construct new data and add to paymentMethod
//                                             paymentMethod.add({
//                                               "cardId":
//                                                   cardId, // Assign appropriate value for cardId
//                                               "journalId":
//                                                   journalId, // Assign appropriate value for journalId
//                                               "paidAmt":
//                                                   paidAmt, // Use the extracted amount
//                                               "type": type == 'card'
//                                                   ? 1
//                                                   : 0, // Example condition for type (1 for 'card', 0 otherwise)
//                                             });
//                                           }

// // Debug print to check the contents of paymentMethod
//                                           print(paymentMethod);
//                                           return Dialog(
//                                             alignment: Alignment.center,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                             ),
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 setState(() {});
//                                               },
//                                               child: Container(
//                                                   padding: EdgeInsets.fromLTRB(
//                                                       18, 18, 18, 15),
//                                                   decoration: BoxDecoration(
//                                                       color: whiteColor,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               4)),
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     mainAxisSize:
//                                                         MainAxisSize.min,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           ClipOval(
//                                                             child: Container(
//                                                               width: 28,
//                                                               height: 28,
//                                                               color:
//                                                                   posSpecialItems1Color,
//                                                               child: Center(
//                                                                   child:
//                                                                       SvgPicture
//                                                                           .asset(
//                                                                 ImageCons
//                                                                     .imgPaymentWallet,
//                                                                 height: AppScreenUtil()
//                                                                     .screenHeight(
//                                                                         10),
//                                                               )),
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: AppScreenUtil()
//                                                                 .screenHeight(
//                                                                     19),
//                                                           ),
//                                                           Text(
//                                                             'Amount add wallet',
//                                                             style: pangramMedium(
//                                                                 size: 10.0,
//                                                                 color:
//                                                                     blackColor),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       SizedBox(
//                                                         height: AppScreenUtil()
//                                                             .screenHeight(16),
//                                                       ),
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 right: 10),
//                                                         height: AppScreenUtil()
//                                                             .screenHeight(32),
//                                                         decoration: BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         3),
//                                                             border: Border.all(
//                                                                 color: confirmColor
//                                                                     .withOpacity(
//                                                                         0.5),
//                                                                 width: 0.8)),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             Container(
//                                                               height: AppScreenUtil()
//                                                                   .screenHeight(
//                                                                       32),
//                                                               width: AppScreenUtil()
//                                                                   .screenWidth(
//                                                                       72),
//                                                               color:
//                                                                   posSpecialItems1Color,
//                                                               child: Center(
//                                                                   child: Text(
//                                                                 'Change',
//                                                                 style: pangramRegular(
//                                                                     size: 10.0,
//                                                                     color:
//                                                                         blackColor),
//                                                               )),
//                                                             ),
//                                                             Expanded(
//                                                               child: TextField(
//                                                                 textAlign:
//                                                                     TextAlign
//                                                                         .right,
//                                                                 maxLines: 1,
//                                                                 style: pangramRegular(
//                                                                     size: 11.0,
//                                                                     color:
//                                                                         blackColor),
//                                                                 controller:
//                                                                     changeController,
//                                                                 // inputFormatters: widget.textInputFormatter,
//                                                                 decoration:
//                                                                     InputDecoration(
//                                                                   floatingLabelBehavior:
//                                                                       FloatingLabelBehavior
//                                                                           .always,
//                                                                   contentPadding:
//                                                                       const EdgeInsets
//                                                                           .only(
//                                                                           bottom:
//                                                                               7),
//                                                                   enabledBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                   focusedBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                   errorBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                   focusedErrorBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                 ),
//                                                                 // onChanged:
//                                                                 //     (changeController) {
//                                                                 //   print(
//                                                                 //       'Change: ${changeController}');
//                                                                 // },
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: AppScreenUtil()
//                                                             .screenHeight(10),
//                                                       ),
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 right: 8,
//                                                                 bottom: 2),
//                                                         height: AppScreenUtil()
//                                                             .screenHeight(32),
//                                                         decoration: BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         3),
//                                                             border: Border.all(
//                                                                 color: confirmColor
//                                                                     .withOpacity(
//                                                                         0.5),
//                                                                 width: 0.8)),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             Container(
//                                                               height: AppScreenUtil()
//                                                                   .screenHeight(
//                                                                       32),
//                                                               width: AppScreenUtil()
//                                                                   .screenWidth(
//                                                                       72),
//                                                               color:
//                                                                   posSpecialItems1Color,
//                                                               child: Center(
//                                                                   child: Text(
//                                                                 'Wallet',
//                                                                 style: pangramRegular(
//                                                                     size: 10.0,
//                                                                     color:
//                                                                         blackColor),
//                                                               )),
//                                                             ),
//                                                             Expanded(
//                                                               child: TextField(
//                                                                 textAlign:
//                                                                     TextAlign
//                                                                         .right,
//                                                                 maxLines: 1,
//                                                                 style: pangramRegular(
//                                                                     size: 11.0,
//                                                                     color:
//                                                                         blackColor),
//                                                                 controller:
//                                                                     walletController,
//                                                                 // inputFormatters: widget.textInputFormatter,
//                                                                 decoration:
//                                                                     InputDecoration(
//                                                                   floatingLabelBehavior:
//                                                                       FloatingLabelBehavior
//                                                                           .always,
//                                                                   contentPadding:
//                                                                       const EdgeInsets
//                                                                           .only(
//                                                                           bottom:
//                                                                               7),
//                                                                   enabledBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                   focusedBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                   errorBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                   focusedErrorBorder:
//                                                                       OutlineInputBorder(
//                                                                     borderSide:
//                                                                         const BorderSide(
//                                                                             color:
//                                                                                 Colors.transparent),
//                                                                   ),
//                                                                 ),
//                                                                 // onChanged:
//                                                                 //     (walletController) {
//                                                                 //   print(
//                                                                 //       'Wallet: ${walletController}');
//                                                                 // },
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                                 right: 10,
//                                                                 left: 10,
//                                                                 top: 17),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .end,
//                                                           children: [
//                                                             GestureDetector(
//                                                               onTap: () {
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               child: Container(
//                                                                 height: AppScreenUtil()
//                                                                     .screenHeight(
//                                                                         22),
//                                                                 width: AppScreenUtil()
//                                                                     .screenWidth(
//                                                                         45),
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius
//                                                                             .circular(
//                                                                                 3),
//                                                                     border: Border.all(
//                                                                         color:
//                                                                             blackColor,
//                                                                         width:
//                                                                             0.7)),
//                                                                 child: Center(
//                                                                   child: Text(
//                                                                     'Cancel',
//                                                                     style: pangramMedium(
//                                                                         size:
//                                                                             9.0,
//                                                                         color:
//                                                                             blackColor),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               width: AppScreenUtil()
//                                                                   .screenWidth(
//                                                                       5),
//                                                             ),
//                                                             Obx(() => (posCtrl
//                                                                         .isPostPosPaymentLoading
//                                                                         .value ==
//                                                                     true)
//                                                                 ? Padding(
//                                                                     padding: EdgeInsets.only(
//                                                                         bottom:
//                                                                             AppScreenUtil().screenHeight(3)),
//                                                                     child:
//                                                                         CircularProgressIndicator(
//                                                                       color:
//                                                                           confirmColor,
//                                                                       strokeWidth:
//                                                                           3,
//                                                                     ),
//                                                                   )
//                                                                 : GestureDetector(
//                                                                     onTap: () {
//                                                                       posCtrl
//                                                                           .addPOSPayment(
//                                                                               paymentMethod: paymentMethod,
//                                                                               ordId: widget.orderId,
//                                                                               password: updatePasswordController.text,
//                                                                               discountAmt: int.tryParse(discountController.text) ?? 0, // Convert to int
//                                                                               deliveryCharge: widget.orderType == 'TAKEAWAY' ? 0 : int.tryParse(deliveryChargeController.text) ?? 0, // Convert to int
//                                                                               pkgCharge: int.tryParse(packingChargeController.text) ?? 0, // Convert to int
//                                                                               // ignore: unnecessary_type_check
//                                                                               amtTotal: (totalAmount is double) ? totalAmount.toInt() : int.tryParse(totalAmount.toString()) ?? totalAmount,
//                                                                               paymentDate: formattedCurrentDate,
//                                                                               custId: widget.addedCustomerId == '' ? posCtrl.viewCashCustomerResData.id : widget.addedCustomerId,
//                                                                               ordDuration: formattedDifference)
//                                                                           .then((value) {
//                                                                         if (value ==
//                                                                             true) {
//                                                                           Navigator.of(context)
//                                                                               .pop(); // Close dialog
//                                                                           Navigator.of(context)
//                                                                               .pop(); // Close dialog
//                                                                           Navigator.of(context)
//                                                                               .pop(); // Close bottom sheet
//                                                                           print(
//                                                                               'TappedCategoryItem: ${widget.tappedCategoryItem}');
//                                                                           setState(
//                                                                               () {
//                                                                             // widget.clearCart;
//                                                                             widget.tappedCategoryItem =
//                                                                                 widget.tappedCategoryItem;
//                                                                             posCtrl.productOrderId.value =
//                                                                                 '';
//                                                                             widget.addedCustomerId =
//                                                                                 '${posCtrl.viewCashCustomerResData.id}';
//                                                                           });
//                                                                           // cart.length =
//                                                                           //     0;
//                                                                           wallet(
//                                                                               context);
//                                                                         }
//                                                                       });
//                                                                       Navigator.of(
//                                                                               context)
//                                                                           .pop();
//                                                                     },
//                                                                     child:
//                                                                         Container(
//                                                                       height: AppScreenUtil()
//                                                                           .screenHeight(
//                                                                               22),
//                                                                       width: AppScreenUtil()
//                                                                           .screenWidth(
//                                                                               91),
//                                                                       decoration:
//                                                                           BoxDecoration(
//                                                                         color:
//                                                                             confirmColor,
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(3),
//                                                                       ),
//                                                                       child:
//                                                                           Center(
//                                                                         child:
//                                                                             Text(
//                                                                           'Pay',
//                                                                           style: pangramMedium(
//                                                                               size: 10.0,
//                                                                               color: whiteColor),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   )),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: AppScreenUtil()
//                                                             .screenHeight(8),
//                                                       ),
//                                                     ],
//                                                   )),
//                                             ),
//                                           );
//                                         });
//                                       });
//                                   print('Customer chosen and added to wallet');
//                                   return; // Prevent further execution if change exists
//                                 }
                                if (double.tryParse(discountController.text) !=
                                        null &&
                                    double.parse(discountController.text) > 0 &&
                                    posCtrl.viewPosConfigurationSettingsResData
                                            .addDiscountAuth ==
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
                                                      BorderRadius.circular(4)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipOval(
                                                        child: Container(
                                                          width: 28,
                                                          height: 28,
                                                          color:
                                                              posSpecialItems1Color,
                                                          child: Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                            ImageCons
                                                                .imgCartItemRemove,
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        11),
                                                          )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: AppScreenUtil()
                                                            .screenHeight(8),
                                                      ),
                                                      Text(
                                                        'Discount Authentication',
                                                        style: pangramMedium(
                                                            size: 10.0,
                                                            color: blackColor),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        10, 20, 10, 23),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
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
                                                                  BorderRadius.circular(
                                                                      3),
                                                              border: Border.all(
                                                                  color: confirmColor
                                                                      .withOpacity(
                                                                          0.5),
                                                                  width: 0.8)),
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
                                                                          const BorderSide(
                                                                              color: Colors.transparent),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.transparent),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.transparent),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.transparent),
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
                                                          },
                                                          child: Container(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        22),
                                                            width:
                                                                AppScreenUtil()
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
                                                          width: AppScreenUtil()
                                                              .screenWidth(5),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (updatePasswordController
                                                                .text
                                                                .isNotEmpty) {
                                                              posCtrl
                                                                  .addPOSPayment(
                                                                      paymentMethod:
                                                                          paymentMethod,
                                                                      ordId: widget
                                                                          .orderId,
                                                                      password:
                                                                          updatePasswordController
                                                                              .text,
                                                                      discountAmt:
                                                                          int.tryParse(discountController.text) ??
                                                                              0, // Convert to int
                                                                      deliveryCharge: widget.orderType ==
                                                                              'TAKEAWAY'
                                                                          ? 0
                                                                          : int.tryParse(deliveryChargeController.text) ??
                                                                              0, // Convert to int
                                                                      pkgCharge:
                                                                          int.tryParse(packingChargeController.text) ??
                                                                              0, // Convert to int
                                                                      // ignore: unnecessary_type_check
                                                                      amtTotal: (totalAmount is double)
                                                                          ? totalAmount
                                                                              .toInt()
                                                                          : int.tryParse(totalAmount.toString()) ??
                                                                              totalAmount,
                                                                      paymentDate:
                                                                          formattedCurrentDate,
                                                                      custId: widget.addedCustomerId ==
                                                                              ''
                                                                          ? posCtrl
                                                                              .viewCashCustomerResData
                                                                              .id
                                                                          : widget
                                                                              .addedCustomerId,
                                                                      ordDuration:
                                                                          formattedDifference)
                                                                  .then((value) {
                                                                if (value ==
                                                                    true) {
                                                                  widget.isPayment ==
                                                                          true
                                                                      ? dispose
                                                                      : Navigator.of(
                                                                              context)
                                                                          .pop(); // Close dialog
                                                                  ongoingCtrl
                                                                      .getAllOngoingOrdersList(
                                                                          1);
                                                                  widget.isPayment ==
                                                                          true
                                                                      ? dispose
                                                                      : Navigator.of(
                                                                              context)
                                                                          .pop(); // Close dialog
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close bottom sheet
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close bottom sheet
                                                                  print(
                                                                      'TappedCategoryItem: ${widget.tappedCategoryItem}');
                                                                  setState(() {
                                                                    // widget
                                                                    //     .clearCart;
                                                                    widget.tappedCategoryItem =
                                                                        widget
                                                                            .tappedCategoryItem;
                                                                    posCtrl
                                                                        .productOrderId
                                                                        .value = '';
                                                                  });
                                                                  // cart.length =
                                                                  //     0;
                                                                  wallet(
                                                                      context);
                                                                } else if (value ==
                                                                    false) {
                                                                  passwordError(
                                                                      context);
                                                                }
                                                              });
                                                            } else {
                                                              passwordErrorMessage =
                                                                  'Enter a valid password';
                                                            }
                                                          },
                                                          child: Container(
                                                            height:
                                                                AppScreenUtil()
                                                                    .screenHeight(
                                                                        22),
                                                            width:
                                                                AppScreenUtil()
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
                                                                    size: 10.0,
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
                                } else {
                                  posCtrl
                                      .addPOSPayment(
                                          paymentMethod: paymentMethod,
                                          ordId: widget.orderId,
                                          password:
                                              updatePasswordController.text,
                                          discountAmt:
                                              int.tryParse(discountController.text) ??
                                                  0, // Convert to int
                                          deliveryCharge: widget.orderType ==
                                                  'TAKEAWAY'
                                              ? 0
                                              : int.tryParse(
                                                      deliveryChargeController
                                                          .text) ??
                                                  0, // Convert to int
                                          pkgCharge:
                                              int.tryParse(packingChargeController.text) ??
                                                  0, // Convert to int
                                          // ignore: unnecessary_type_check
                                          amtTotal: (totalAmount is double)
                                              ? totalAmount.toInt()
                                              : int.tryParse(
                                                      totalAmount.toString()) ??
                                                  totalAmount,
                                          paymentDate: formattedCurrentDate,
                                          custId: widget.addedCustomerId == ''
                                              ? posCtrl.viewCashCustomerResData.id
                                              : widget.addedCustomerId,
                                          ordDuration: formattedDifference)
                                      .then((value) {
                                    if (value == true) {
                                      widget.isPayment == true
                                          ? dispose
                                          : Navigator.of(context)
                                              .pop(); // Close dialog
                                      ongoingCtrl.getAllOngoingOrdersList(1);
                                      Navigator.of(context)
                                          .pop(); // Close dialog
                                      Navigator.of(context)
                                          .pop(); // Close bottom sheet
                                      print(
                                          'TappedCategoryItem: ${widget.tappedCategoryItem}');
                                      setState(() {
                                        // widget.clearCart;
                                        widget.tappedCategoryItem =
                                            widget.tappedCategoryItem;
                                        posCtrl.productOrderId.value = '';
                                        widget.addedCustomerId =
                                            '${posCtrl.viewCashCustomerResData.id}';
                                      });
                                      // cart.length =
                                      //     0;
                                      wallet(context);
                                    }
                                  });
                                }
                                print('Order ID exists: ${widget.orderId}');
                                // Add your logic here
                              } else {
                                // Order ID does not exist or is empty
                                print('Order ID does not exist or is empty.');
                              }
                            },
                            child: CustomButton(
                              buttonHeight: AppScreenUtil().screenHeight(43),
                              buttonWidth: double.infinity,
                              buttonColor: blackColor,
                              borderRadius: 2,
                              buttonText: 'Pay',
                              buttonLabelStyle:
                                  tableTitleLabelStyleForSalesReport,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  ])),
            );
          });
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
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                'AUTHENTICATION FAILED - INVALID PASSWORD',
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

  ///error for no credit available
  void creditError(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.806,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: confirmColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                'Credit Not Available',
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

  ///error for no balanceAmount available
  void changeNotCleared(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.805,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: confirmColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                'Change not cleared !!',
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

  void wallet(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // Dismiss dialog after 2 seconds
        Future.delayed(Duration(seconds: 3), () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // Close the dialog after 2 seconds
          }
        });

        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 18, 18, 30),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset('assets/payment_confirmed.json',
                        height: AppScreenUtil().screenHeight(76),
                        width: AppScreenUtil().screenWidth(80)),
                    Text(
                      'Payment Completed',
                      style: pangramMedium(size: 12.0, color: blackColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_field, unnecessary_null_comparison, prefer_conditional_assignment, unrelated_type_equality_checks

import 'dart:async';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/models/subcategories_model.dart';
import 'package:restaurant/presentation/common/features/login/controller/login_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/controller/ongoing_orders_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/product/view/products.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/controller/table_controller.dart';
import 'package:restaurant/presentation/user_app/features/home/controller/home_controller.dart';
import 'package:restaurant/routes/index.dart';
import 'package:restaurant/utiles/app_screen_util.dart';
import '../../../../../models/categories_model.dart';
import '../../../../../styles/colors.dart';
import '../../../../../styles/textstyles.dart';
import '../../../../../utiles/image_constant.dart';
import '../../../widgets/top_categories_card.dart';
import '../../categories/dashboard/view/dash_board.dart';
import '../../categories/order_list/order_list.dart';
import '../../categories/pos/pos/controller/pos_controller.dart';
import '../../categories/pos/pos/view/pos.dart';
import '../../categories/tables/view/select_table.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchKeywordController = TextEditingController();
  final passwordController = TextEditingController();
  final options = <Subcategories>[];
  final items = <CategoriesModel>[];
  String passwordErrorMessage = 'Enter a valid password';
  bool tapped = false;
  String? item;
  Stopwatch watch = Stopwatch();
  Timer? timer;
  bool startStop = true;
  bool isValidPassword = true;

  // String elapsedTime = '00 : 00 : 00';
  DateTime _currentTime = DateTime.now();
  Duration _difference = Duration.zero;
  Timer? _timer;
  String _formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  ///API
  final loginCtrl = Get.find<LogInController>();
  final posCtrl = Get.find<POSController>();
  final homeCtrl = Get.find<HomeController>();
  final tableCtrl = Get.find<TableController>();
  final ongoingCtrl = Get.find<OngoingOrdersController>();
  DateTime now = DateTime.now();

  void _startTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _currentTime = DateTime.now();

          // Check if startDate is a DateTime and not null
          if (homeCtrl.activeShiftResData.startDate != null) {
            DateTime shiftStartDate;

            // If it's already a DateTime, no need to parse it
            if (homeCtrl.activeShiftResData.startDate is DateTime) {
              shiftStartDate = homeCtrl.activeShiftResData.startDate;
            } else {
              // Otherwise, parse it from a string format
              shiftStartDate = DateFormat('yyyy-MM-dd HH:mm:ss')
                  .parse(homeCtrl.activeShiftResData.startDate.toString());
            }

            // Calculate the difference
            _difference = _currentTime.difference(shiftStartDate);
            // print('Time difference: $_difference');
          } else {
            print('Start date is null');
          }
        });
      });
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

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
    super.initState();
    homeCtrl.postActiveShift(DateFormat('yyyy-MM-dd HH:mm:ss').format(now));
    posCtrl.getViewCashCustomer();
    posCtrl.viewPosConfigurationSettings();
    tableCtrl.getViewFloorList();
    homeCtrl.getAllCurrencyList();
    items.add(CategoriesModel('Dashboard', ImageCons.dashBoard));
    items.add(CategoriesModel('POS', ImageCons.pos));
    items.add(CategoriesModel('Product', ImageCons.imgTabProductIcon));
    // items.add(CategoriesModel('Food Menu', ImageCons.foodMenu));
    items.add(CategoriesModel('Tables', ImageCons.tables));
    items.add(CategoriesModel('Logout', ImageCons.imgLogout));
    options.add(Subcategories(('  All  ')));
    options.add(Subcategories(('Processing')));
    options.add(Subcategories(('Preparing')));
    options.add(Subcategories((' Ready ')));
    options.add(Subcategories(('Completed')));
    options.add(Subcategories((' Paid ')));
    _startTimer();
    _getUserName();
  }

  @override
  Widget build(BuildContext context) {
    int days = _difference.inDays;
    int hours = _difference.inHours % 3600;
    int minutes = _difference.inMinutes % 60;
    int seconds = _difference.inSeconds % 60;

    return SafeArea(
        child: Scaffold(
            backgroundColor: backGroundColor,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: titleTextStyle,
                          ),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(3),
                          ),
                          Builder(builder: (context) {
                            return InkWell(
                              onTap: () {
                                showGlobalDrawer(
                                    context: context,
                                    builder: _verticalDrawerBuilder,
                                    direction: AxisDirection.up);
                              },
                              child: Container(
                                height: 23,
                                width: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: _difference.inSeconds <= 0
                                      ? clearDataAlertTitleLabelStyleColor
                                          .withOpacity(0.8)
                                      : shiftColor.withOpacity(0.7),
                                ),
                                child: Center(
                                    child: days == 0
                                        ? Text(
                                            '${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
                                            style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          )
                                        : Text(
                                            '${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
                                            style:
                                                placeOrderingAndConfirmPaymentButtonLabelStyle,
                                          )),
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(width: AppScreenUtil().screenWidth(15)),
                      Expanded(
                        child: SizedBox(
                          height: AppScreenUtil().screenHeight(35),
                          child: TextField(
                            style: searchInputTextStyle,
                            cursorColor: searchTextColor,
                            controller: searchKeywordController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 2),
                              hintText: 'Search foods,order id etc',
                              hintStyle: searchTextStyle,
                              filled: true,
                              fillColor: whiteColor,
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: AppScreenUtil().screenWidth(33)),
                              prefixIcon: IconButton(
                                icon: Icon(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    );
                                    Dialog(
                                      child: Container(
                                        height: 305,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                borderSide: BorderSide(color: whiteColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                                              item = items[index].text;
                                              tableCtrl
                                                      .isOrderFromFloorPlanIsSuccess =
                                                  false.obs;
                                              posCtrl.isAddOrderFromChDraftTapped =
                                                  false.obs;
                                              if (item == 'Logout') {
                                                loginCtrl
                                                    .clearAuthToken()
                                                    .then((value) {
                                                  Get.offAllNamed(
                                                      routeName.loginPage);
                                                });
                                              }
                                            });
                                            print('Tapped category $item');
                                          },
                                          child: Container(
                                            width:
                                                AppScreenUtil().screenWidth(80),
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
                                                    overflow: TextOverflow.fade,
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
                              width: AppScreenUtil().screenWidth(10),
                            ),
                          ],
                        ))),
                Flexible(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                        // height: 600,
                        width: double.infinity,
                        // padding: EdgeInsets.fromLTRB(5, 3, 15, 13),
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        child: Stack(
                          children: [
                            _buildSelectedPage(),
                            // Align(
                            //   alignment: Alignment.topCenter,
                            //   child: Transform.translate(
                            //     offset: Offset(0, -2),
                            //     child: GestureDetector(
                            //       onTap: () {},
                            //       child: SizedBox(
                            //         width: AppScreenUtil().screenWidth(60),
                            //         child: Divider(
                            //           thickness: 2.3,
                            //           color: dividerColor.withOpacity(0.98),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                  ),
                )
              ],
            )));
  }

  Widget _buildSelectedPage() {
    if (item == 'POS' || tableCtrl.isOrderFromFloorPlanIsSuccess == true) {
      return const POSPage();
    }

    switch (item) {
      case 'Dashboard':
        return const DashBoardPage();
      case 'Order List':
        return const OrderList();
      case 'Product':
        return const PosProducts();
      case 'Tables':
        return const SelectTables();
      default:
        return const DashBoardPage();
    }
  }

  WidgetBuilder get _verticalDrawerBuilder {
    int days = _difference.inDays;
    int hours = _difference.inHours % 24;
    int minutes = _difference.inMinutes % 60;
    int seconds = _difference.inSeconds % 60;

    return (BuildContext context) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      homeCtrl.postActiveShift(formattedDate);

      return Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 13, 15, 15),
                width: AppScreenUtil().screenWidth(226),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shift',
                            style: rolesAndPermissionUnSelectedTabLabelStyle),
                        days == 0
                            ? Text(
                                '${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
                                style:
                                    rolesAndPermissionUnSelectedTabLabelStyle)
                            : Text(
                                '${_formatTime(days)} days,${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
                                style:
                                    rolesAndPermissionUnSelectedTabLabelStyle),
                        _difference.inSeconds <= 0
                            ? Text('Inactive', style: shiftActiveTextStyle)
                            : Text('Active', style: shiftInactiveTextStyle)
                      ],
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(10)),
                    _difference.inSeconds <= 0
                        ? Obx(() => (homeCtrl.isStartManualShiftLoading.value ==
                                true)
                            ? const Center(
                                child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: confirmColor,
                              ))
                            : GestureDetector(
                                onTap: () {
                                  homeCtrl
                                      .postStartManualShift(formattedDate)
                                      .then((value) {
                                    if (value == true) {
                                      _stopTimer();
                                      homeCtrl.postActiveShift(
                                          DateFormat('yyyy-MM-dd HH:mm:ss')
                                              .format(now));

                                      if (_timer == null) {
                                        _timer = Timer.periodic(
                                            Duration(seconds: 1), (timer) {
                                          setState(() {
                                            _currentTime = DateTime.now();
                                            _difference =
                                                _currentTime.difference(homeCtrl
                                                    .activeShiftResData
                                                    .startDate);
                                          });
                                        });
                                      }

                                      print('Shift started at $formattedDate');
                                      AppUtils.oneTimeSnackBar(
                                          'New Shift Added 😁',
                                          bgColor: payButtonColor);
                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  });
                                },
                                child: Container(
                                  height: AppScreenUtil().screenHeight(23),
                                  width: AppScreenUtil().screenWidth(72),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: shiftColor.withOpacity(0.7)),
                                  child: Center(
                                      child: Text(
                                    'Start',
                                    style: shiftTextStyle,
                                  )),
                                ),
                              ))
                        : GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              shiftEndingDialogue(context);
                              print('Shift ended');
                            },
                            child: Container(
                              height: AppScreenUtil().screenHeight(23),
                              width: AppScreenUtil().screenWidth(72),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: clearDataAlertTitleLabelStyleColor
                                      .withOpacity(0.8)),
                              child: Center(
                                  child: Text(
                                'End',
                                style: shiftTextStyle,
                              )),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    };
  }

  void shiftEndingDialogue(
    BuildContext context,
  ) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.topCenter,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            width: AppScreenUtil().screenWidth(226),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Password',
                  style: dialoguePasswordTextStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(15),
                ),
                Text(
                  'Password',
                  style: cartItemTitleStyle,
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: textFieldColor,
                    border: Border.all(color: textFieldColor, width: 3),
                  ),
                  child: SizedBox(
                    height: 28,
                    child: TextField(
                      onChanged: (value) {
                        // Remove error message when the user types something
                        setState(() {
                          passwordErrorMessage = '';
                        });
                      },
                      controller: passwordController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9!@#$%^&*]')),
                      ],
                      obscureText: true,
                      style: searchInputTextStyle,
                      cursorColor: blackColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        isDense: true,
                        hintStyle: loremTextStyle,
                        fillColor: blackColor,
                        focusColor: textFieldColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textFieldColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textFieldColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textFieldColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: textFieldColor),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(2),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    passwordErrorMessage,
                    style: pangramRegular(size: 8.0, color: confirmColor),
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil().screenHeight(8),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => (homeCtrl.isVerifyPasswordLoading.value == true)
                        ? const Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: confirmColor,
                          ))
                        : GestureDetector(
                            child: Container(
                                width: AppScreenUtil().screenWidth(71),
                                height: AppScreenUtil().screenHeight(20),
                                decoration: BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(11)),
                                padding: EdgeInsets.only(bottom: 2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Submit',
                                      style: totalRevenueTextStyle,
                                      textAlign: TextAlign.center),
                                )),
                            onTap: () {
                            
                                homeCtrl
                                    .adminVerifyPassword(
                                        passwordController.text)
                                    .then((value) {
                                  print(
                                      'Shift Ending Password : ${passwordController.text}');

                                  if (value == true) {
                                    // Shift ending logic
                                    homeCtrl
                                        .postEndManualShift(formattedDate)
                                        .then((value) {
                                      if (value == true) {
                                        _stopTimer();
                                        setState(() {
                                          _difference = Duration.zero;
                                        });

                                        homeCtrl.postActiveShift(
                                            DateFormat('yyyy-MM-dd HH:mm:ss')
                                                .format(now));

                                        Navigator.pop(context);
                                        AppUtils.oneTimeSnackBar('Shift Ended',
                                            bgColor: confirmColor);
                                      }else if (value ==
                                                                    false) {
                                                                  passwordError(
                                                                      context);
                                                                }
                                    });
                                  } else {
                                    // Show error if password verification fails
                                    setState(() {
                                      isValidPassword =
                                          false; // Display error message
                                    });
                                    AppUtils.oneTimeSnackBar(
                                        'Invalid password, please try again',
                                        bgColor: confirmColor);
                                  }
                                });
                             
                            },
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  WidgetBuilder get changePassword {
    return (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 13, 15, 15),
                // height: AppScreenUtil().screenHeight(101),
                width: AppScreenUtil().screenWidth(226),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Enter Password',
                      style: tableDetailHeadTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(15),
                    ),
                    Text(
                      'Enter Password',
                      style: bookedTextStyle,
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(8),
                    ),
                    Container(
                      // width: widget.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: textFieldColor,
                          border: Border.all(color: textFieldColor, width: 3)),
                      child: SizedBox(
                          height: 35.5,
                          child: TextField(
                            maxLines: 10,
                            // controller: passwordController,
                            style: searchInputTextStyle,
                            // readOnly:widget.readOnly ,
                            cursorColor: whiteColor,
                            decoration: InputDecoration(
                              // suffixIcon: widget.sufixIcon,
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              // hintText: widget.hint,
                              hintStyle: loremTextStyle,
                              fillColor: blackColor,
                              focusColor: textFieldColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: textFieldColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: AppScreenUtil().screenHeight(12),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Container(
                            width: 83,
                            height: 24,
                            decoration: BoxDecoration(
                                color: blackColor,
                                borderRadius: BorderRadius.circular(11)),
                            padding: EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Submit',
                                  style: confirmTextStyle,
                                  textAlign: TextAlign.center),
                            )),
                        onTap: () {
                          setState(() {
                            // startOrStop();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    };
  }

  validateFields() {
    isValidPassword = AppUtils.validationOfPassword(passwordController.text);
    setState(() {});
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
                'COMPLETE ALL PENDING ORDERS BEFORE CLOSING SHIFT',
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
}

// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks, unused_import, unnecessary_string_interpolations

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_designs_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/table_service.dart';
import 'package:restaurant/presentation/user_app/features/home/service/home_service.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/add_pos_order_from_floor_plan_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/end_manual_shift_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/get_all_currency_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/start_manual_shift_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/verify_password_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/view_active_shift_model.dart';

class HomeController extends GetxController {
  ///StartManualShift -Shift Start
  var isStartManualShiftLoading = false.obs;
  var isStartManualShiftError = false.obs;
  StartManualShiftResModel startManualShiftResData = StartManualShiftResModel();
  Future<bool> postStartManualShift(String startDateTime) async {
    isStartManualShiftLoading.value = true;
    update();
    try {
      final parsedResData = await HomeService().startManualShift(startDateTime);
      if (parsedResData.error != true) {
        startManualShiftResData = parsedResData.data;

        isStartManualShiftError.value = true;

        isStartManualShiftLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "Start Manual Shift data");
        return true;
      } else {
        AppUtils.oneTimeSnackBar("Oops! Something went wrong");
        isStartManualShiftError.value = false;

        isStartManualShiftLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isStartManualShiftError.value = false;

      isStartManualShiftLoading.value = false;
      update();
      print('Start Manual Shift res data : $e');
      return false;
    }
  }

  ///ViewActiveShift -ShiftUpdation
  var isShiftUpdationLoading = false.obs;
  var isShiftUpdationError = false.obs;
  var activeShiftTime = ''.obs;
  ViewActiveShiftResModel activeShiftResData = ViewActiveShiftResModel();
  Future<bool> postActiveShift(String startDateTime) async {
    isShiftUpdationLoading.value = true;
    update();
    try {
      final parsedResData = await HomeService().viewActiveShift(startDateTime);
      if (parsedResData.error != true) {
        activeShiftResData = parsedResData.data;

        isShiftUpdationError.value = true;
        activeShiftTime.value = activeShiftResData.startDate;
        // Check if the startDate is a string and convert it to DateTime
if (activeShiftResData.startDate is String) {
  activeShiftResData.startDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(activeShiftResData.startDate);
}
        print(
            '>>>>>>>>>>>>>>>>>Active Shift Date from controller: ${activeShiftResData.startDate}');
        isShiftUpdationLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "Active Shift data");
        return true;
      } else {
        // AppUtils.oneTimeSnackBar("Oops! Something went wrong");
        isShiftUpdationError.value = false;

        isShiftUpdationLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isShiftUpdationError.value = false;

      isShiftUpdationLoading.value = false;
      update();
      print('Active Shift res data : $e');
      return false;
    }
  }

  ///VerifyPassword - End Shift
  var isVerifyPasswordLoading = false.obs;
  var isVerifyPasswordError = false.obs;
  VerifyPasswordResModel verifyPasswordResData = VerifyPasswordResModel();
  Future<bool> adminVerifyPassword(String password) async {
    isVerifyPasswordLoading.value = true;
    try {
      final parsedResData = await HomeService().verifyPassword(password);
      if (parsedResData.error != true) {
        verifyPasswordResData = parsedResData.data;

        isVerifyPasswordError.value = true;

        isVerifyPasswordLoading.value = false;

        AppUtils().printData(parsedResData.data, info: "Verify Password data");
        return true;
      } else {
        // AppUtils.oneTimeSnackBar("Oops! Something went wrong");
        isVerifyPasswordError.value = false;

        isVerifyPasswordLoading.value = false;
        return false;
      }
    } catch (e) {
      isVerifyPasswordError.value = false;

      isVerifyPasswordLoading.value = false;
      update();
      print('Verify Password res data : $e');
      return false;
    }
  }

  ///EndManualShift -End Start
  var isEndManualShiftLoading = false.obs;
  var isEndManualShiftError = false.obs;
  var endShiftError = false.obs;
  EndManualShiftResModel endManualShiftResData = EndManualShiftResModel();
  Future<bool> postEndManualShift(String endDateTime) async {
    isEndManualShiftLoading.value = true;
    // update();
    try {
      final parsedResData = await HomeService().endManualShift(endDateTime);
      if (parsedResData.error != true) {
        endManualShiftResData = parsedResData.data;

        isEndManualShiftError.value = true;
        endShiftError.value = true;
        isEndManualShiftLoading.value = false;
        // update();

        AppUtils().printData(parsedResData.data, info: "End Manual Shift data");
        return true;
      } else {
        endShiftError.value = false;
        // AppUtils.oneTimeSnackBar(
        //     '${endManualShiftResData.status == 'Ended' ? 'Something Went Wrong  😞' : 'COMPLETE ALL PENDING ORDERS BEFORE CLOSING SHIFT'}');
        isEndManualShiftError.value = false;

        isEndManualShiftLoading.value = false;
        // update();
        return false;
      }
    } catch (e) {
      isEndManualShiftError.value = false;

      isEndManualShiftLoading.value = false;
      // update();
      print('End Manual Shift res data : $e');
      return false;
    }
  }

  ///Get All Categories List
  var allCurrencyViewDetailsLoading = false.obs;
  var isAllCurrencyListError = false.obs;
  List<ViewCurrencyListResModel> allCurrencyViewMainList = [];
  List<ViewCurrencyListResModel> allCurrencyViewList = [];

  Future<void> getAllCurrencyList() async {
    allCurrencyViewDetailsLoading.value = true;
    isAllCurrencyListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      allCurrencyViewMainList.clear();
      allCurrencyViewList.clear();
      final parsedResData = await HomeService().getAllCurrencyListData();
      if (parsedResData.error != true) {
        if (parsedResData.data.allCurrencyView != null &&
            parsedResData.data.allCurrencyView.isNotEmpty) {
          for (var element in parsedResData.data.allCurrencyView) {
            allCurrencyViewMainList.add(ViewCurrencyListResModel(
                id: element.id,
                currencyCode: element.currencyCode,
                name: element.name,
                symbol: element.symbol,
                currencyUnit: element.currencyUnit,
                currencySubUnit: element.currencySubUnit,
                usdperunit: element.usdperunit,
                lastUpdatedDate: element.lastUpdatedDate,
                currencyRate: element.currencyRate,
                symbolPosition: element.symbolPosition,
                status: element.status,
                country: element.country,
                v: element.v));
          }
        }
        isAllCurrencyListError.value = false;

        allCurrencyViewDetailsLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "All Currency details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isAllCurrencyListError.value = true;

        allCurrencyViewDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isAllCurrencyListError.value = true;

      allCurrencyViewDetailsLoading.value = false;

      update();
      print('All Currency detail res data : $e');
    }
  }
}

// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/ongoing_orders_service.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/res_model/ongoing_orders_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/res_model/order_booking_cancel_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/res_model/order_cancel_model.dart';
import 'package:restaurant/repository/api/api_response.dart';

class OngoingOrdersController extends GetxController {
  ///Get All Ongoing Orders List
  var allOngoingOrdersLoading = false.obs;
  var isAllOngoingOrdersListError = false.obs;
  var ongoingOrderCount = 0.obs;
 
  List<OngoingOrdersListResModel> allOngoingOrderViewMainList = [];
  List<OngoingOrdersListResModel> allOngoingOrdersViewList = [];

  Future<void> getAllOngoingOrdersList(int type) async {
    allOngoingOrdersLoading.value = true;
    isAllOngoingOrdersListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      allOngoingOrderViewMainList.clear();
      allOngoingOrdersViewList.clear();
      final parsedResData =
          await OngoingOrdersService().getAllOngoingOrdersList(type);
      if (parsedResData.error != true) {
        if (parsedResData.data.allOngoingOrdersView != null &&
            parsedResData.data.allOngoingOrdersView.isNotEmpty) {
        
          for (var element in parsedResData.data.allOngoingOrdersView) {
            allOngoingOrderViewMainList.add(OngoingOrdersListResModel(
              id: element.id,
              orderDate: element.orderDate,
              ordType: element.ordType,
              name: element.name,
              discountAmt: element.discountAmt,
              amtTotal: element.amtTotal,
              amountDue: element.amountDue,
              status: element.status,
              customerName: element.customerName,
              customerMobile: element.customerMobile,
              paidAmt: element.paidAmt,
              tableNames: element.tableNames,
              aggregatorRef: element.aggregatorRef,
              aggregatorName: element.aggregatorName,
              waiterName: element.waiterName,
              chairId: element.chairId,
              custAddress: element.custAddress,
              transNo: element.transNo,
              orderTime: element.orderTime,
            ));
          }
            ongoingOrderCount.value =
              parsedResData.data.allOngoingOrdersView.length.toInt();
              print('Ongoing Orders Count: ${ongoingOrderCount.value}');
              print('Ongoing Orders Count: ${parsedResData.data.allOngoingOrdersView.length}');
        }
        isAllOngoingOrdersListError.value = false;

        allOngoingOrdersLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "All Ongoing Orders list");
      } else {
        // AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isAllOngoingOrdersListError.value = true;

        allOngoingOrdersLoading.value = false;

        update();
      }
    } catch (e) {
      isAllOngoingOrdersListError.value = true;

      allOngoingOrdersLoading.value = false;

      update();
      print('All Ongoing Orders res data : $e');
    }
  }

  ///Cancel Ongoing Order
  var isCancelOngoingOrderLoading = false.obs;
  var isCancelOngoingOrderError = false.obs;
  OrderCancelResModel viewPosOrderByIdResData = OrderCancelResModel();
  Future<bool> cancelOrderFromOngoingOrders(String? orderId,dynamic password) async {
    isCancelOngoingOrderLoading.value = true;
    final APIResponse<OrderCancelResModel> parsedResData =
        await OngoingOrdersService().cancelOngoingOrder(orderId: orderId,password: password);
    if (parsedResData.error != true) {
      viewPosOrderByIdResData = parsedResData.data;
      isCancelOngoingOrderError.value = false;

      isCancelOngoingOrderLoading.value = false;

      AppUtils().printData('${parsedResData.data}',
          info: "Cancel Ongoing Order Res data");
      return true;
    } else {
      isCancelOngoingOrderError.value = true;

      isCancelOngoingOrderLoading.value = false;
      return false;
    }
  }

  ///Cancel Booking Ongoing Order
  var isCancelBookingOngoingOrderLoading = false.obs;
  var isCancelBookingOngoingOrderError = false.obs;
  OrderBookingCancelResModel viewBookingPosOrderByIdResData =
      OrderBookingCancelResModel();
  Future<bool> cancelBookingOrderFromOngoingOrders(String? orderId,dynamic password) async {
    isCancelBookingOngoingOrderLoading.value = true;
    final APIResponse<OrderBookingCancelResModel> parsedResData =
        await OngoingOrdersService().bookingOngoingOrder(orderId: orderId,password:password);
    if (parsedResData.error != true) {
      viewBookingPosOrderByIdResData = parsedResData.data;
      isCancelBookingOngoingOrderError.value = false;

      isCancelBookingOngoingOrderLoading.value = false;

      AppUtils().printData('${parsedResData.data}',
          info: "Cancel Booking Ongoing Order Res data");
      return true;
    } else {
      isCancelBookingOngoingOrderError.value = true;

      isCancelBookingOngoingOrderLoading.value = false;
      return false;
    }
  }
}

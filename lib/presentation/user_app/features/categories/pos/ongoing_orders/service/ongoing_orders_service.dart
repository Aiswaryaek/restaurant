// ignore_for_file: avoid_print

import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/res_model/ongoing_orders_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/res_model/order_booking_cancel_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/service/res_model/order_cancel_model.dart';

import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../repository/api/api_helper.dart';
import '../../../../../../../repository/api/api_response.dart';
import '../../../../../../../styles/colors.dart';

class OngoingOrdersService {
  ///List Of All ongoing Orders
  Future<APIResponse<AllOngoingOrdersListResModel>> getAllOngoingOrdersList(
      int type) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"branchId": branchId, "type": type};
    print('Branch Id :$branchId');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/listPosOrders',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AllOngoingOrdersListResModel(allOngoingOrdersView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final allCategoriesList =
            AllOngoingOrdersListResModel.fromJson(responseData);
        return APIResponse(
            data: allCategoriesList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllOngoingOrdersListResModel(allOngoingOrdersView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///Order Cancel
  Future<APIResponse<OrderCancelResModel>> cancelOngoingOrder(
      {String? orderId,dynamic password}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"orderId": orderId, "branchId": branchId,"password":password};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/cancelOngoingOrders',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: OrderCancelResModel(), error: true, errorMessage: '');
      } else {
        final OrderCancelResModel resData =
            OrderCancelResModel.fromJson(response.data);
        print('Ongoing order cancel Response: $resData');
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: OrderCancelResModel(), error: true, errorMessage: '');
    }
  }

  ///Order Booking Cancel
  Future<APIResponse<OrderBookingCancelResModel>> bookingOngoingOrder(
      {String? orderId,dynamic password}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"orderId": orderId, "branchId": branchId,"password":password};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/deleteBookingOrder',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: OrderBookingCancelResModel(), error: true, errorMessage: '');
      } else {
        final OrderBookingCancelResModel resData =
            OrderBookingCancelResModel.fromJson(response.data);
        print('Ongoing Booking order cancel Response: $resData');
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: OrderBookingCancelResModel(), error: true, errorMessage: '');
    }
  }
}

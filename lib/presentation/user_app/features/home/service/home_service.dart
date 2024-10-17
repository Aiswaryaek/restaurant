import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_designs_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/add_pos_order_from_floor_plan_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/end_manual_shift_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/get_all_currency_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/start_manual_shift_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/verify_password_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/view_active_shift_model.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../repository/api/api_helper.dart';
import '../../../../../../../repository/api/api_response.dart';
import '../../../../../../../styles/colors.dart';

class HomeService {
  ///StartManualShift - Shift Start
  Future<APIResponse<StartManualShiftResModel>> startManualShift(
      String startDateTime) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"startDate": startDateTime, "branchId": branchId};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'settings/startmanualshift',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: StartManualShiftResModel(), error: true, errorMessage: '');
      } else {
        final StartManualShiftResModel resData =
            StartManualShiftResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: StartManualShiftResModel(), error: true, errorMessage: '');
    }
  }

  ///ViewActiveShift - GetShiftUpdation
  Future<APIResponse<ViewActiveShiftResModel>> viewActiveShift(
      String startDateTime) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"branchId": branchId, "curTime": startDateTime};
    try {
      final APIResponse response = await APIHelper.postShift(
          endPoint: 'settings/viewactiveshift',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: ViewActiveShiftResModel(), error: true, errorMessage: '');
      } else {
        final ViewActiveShiftResModel resData =
            ViewActiveShiftResModel.fromJson(response.data);
            print('############ACtive shift Response data: ${response.data}');
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      // AppUtils.oneTimeSnackBar('Could not complete the request',
      // bgColor: confirmColor);
      return APIResponse(
          data: ViewActiveShiftResModel(), error: true, errorMessage: '');
    }
  }

  ///Verify Password - End Shift
  Future<APIResponse<VerifyPasswordResModel>> verifyPassword(
      String password) async {
    final body = {"password": password};
    try {
      final APIResponse response = await APIHelper.postShift(
          endPoint: 'admin/verifypassword',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: VerifyPasswordResModel(), error: true, errorMessage: '');
      } else {
        final VerifyPasswordResModel resData =
            VerifyPasswordResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: VerifyPasswordResModel(), error: true, errorMessage: '');
    }
  }

  ///EndManualShift - End Start
  Future<APIResponse<EndManualShiftResModel>> endManualShift(
      String endDateTime) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"endDate": endDateTime, "branchId": branchId};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'settings/endmanualshift',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: EndManualShiftResModel(), error: true, errorMessage: '');
      } else {
        final EndManualShiftResModel resData =
            EndManualShiftResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      // AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: EndManualShiftResModel(), error: true, errorMessage: '');
    }
  }

  ///List Of All Currency
  Future<APIResponse<AllCurrencyListResModel>> getAllCurrencyListData() async {
    final body = {"status": 0};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'settings/viewCurrency',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AllCurrencyListResModel(allCurrencyView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final allCategoriesList =
            AllCurrencyListResModel.fromJson(responseData);
        return APIResponse(
            data: allCategoriesList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllCurrencyListResModel(allCurrencyView: []),
          error: true,
          errorMessage: '');
    }
  }
}

// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';

import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/currency/service/res_model/currency_add_res_model.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/currency/service/res_model/currency_list_res_model.dart';
import 'package:restaurant/styles/colors.dart';

import '../../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../../repository/api/api_helper.dart';
import '../../../../../../../../repository/api/api_response.dart';

class CurrencyService {
  ///Add Currency
  Future<APIResponse<CurrencyResModel>> addCurrency({
    required String name,
    required String symbol,
    required String currencySubUnit,
    required String currencyUnit,
    required String currencyCode,
    required String lastUpdatedDate,
    required int currencyRate,
    required int usdperunit,
    required dynamic symbolPosition,
    required bool status,
    required String country,
  }) async {
    final body = {
      "name": name,
      "symbol": symbol,
      "currencySubUnit": currencySubUnit,
      "currencyUnit": currencyUnit,
      "currencyCode": currencyCode,
      "lastUpdatedDate": lastUpdatedDate,
      "currencyRate": currencyRate,
      "usdperunit": usdperunit,
      "symbolPosition": symbolPosition,
      "status": status,
      "country": country
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'settings/addCurrency',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: CurrencyResModel(), error: true, errorMessage: '');
      } else {
        final CurrencyResModel resData =
            CurrencyResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: CurrencyResModel(), error: true, errorMessage: '');
    }
  }

  ///List Currency
  Future<APIResponse<CurrencyListResModel>> getCurrencyList() async {
    final body = {"status": 0};

    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'settings/viewCurrency',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: CurrencyListResModel(currencies: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final currencyList = CurrencyListResModel.fromJson(responseData);
        return APIResponse(data: currencyList, error: false, errorMessage: '');
      }

      ///
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
          
      return APIResponse(
          data: CurrencyListResModel(currencies: []),
          error: true,
          errorMessage: '');
    }
  }
}

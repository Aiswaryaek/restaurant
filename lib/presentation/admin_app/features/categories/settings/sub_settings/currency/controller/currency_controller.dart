import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../../repository/api/api_response.dart';
import '../service/currency_service.dart';
import '../service/res_model/currency_add_res_model.dart';
import '../service/res_model/currency_list_res_model.dart';

class CurrencyController extends GetxController {
  var isCurrencyCreateTapped = false.obs;

  ///add Currency
  var isCurrencyLoading = false.obs;
  var isCurrencyError = false.obs;
  CurrencyResModel addCurrencyResData = CurrencyResModel();
  final nameController = TextEditingController();
  final symbolController = TextEditingController();
  final currencySubUnitController = TextEditingController();
  final currencyUnitController = TextEditingController();
  final currencyCodeController = TextEditingController();
  final unitPerUsdController = TextEditingController();
  final usdPerUnitController = TextEditingController();
  var selectedSymbolPosition = 'Left'.obs;
  var countryValue = "".obs;
  var isValidName = true.obs;
  var isValidSymbol = true.obs;
  var isValidCurrencySubUnit = true.obs;
  var isValidCurrencyUnit = true.obs;
  var isValidCurrencyCode = true.obs;
  var isValidUnitPerUSD = true.obs;
  var isValidUnitPerUnit = true.obs;
  String datetime = DateTime.now().toString();
  var status = false.obs;

  ///Get Currency List
  var currencyDetailsLoading = false.obs;
  var isCurrencyListError = false.obs;
  List<CurrencyViewResModel> currencyDetailsMainList = [];
  List<CurrencyViewResModel> currencyDetailsList = [];
  String parseAndFormatDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);

    return formattedDate;
  }

  ///add Currency
  Future<bool> addCurrency({
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
    isCurrencyLoading.value = true;
    isCurrencyError.value = false;

    final APIResponse<CurrencyResModel> parsedResData = await CurrencyService()
        .addCurrency(
            name: name,
            symbol: symbol,
            currencySubUnit: currencySubUnit,
            currencyUnit: currencyUnit,
            currencyCode: currencyCode,
            lastUpdatedDate: lastUpdatedDate,
            currencyRate: currencyRate,
            usdperunit: usdperunit,
            symbolPosition: symbolPosition,
            status: status,
            country: country);
    if (parsedResData.error != true) {
      addCurrencyResData = parsedResData.data;
      print(addCurrencyResData);
      isCurrencyError.value = false;

      isCurrencyLoading.value = false;
      isCurrencyCreateTapped.value = false;
      AppUtils().printData('${parsedResData.data}',
          info: "Currency Created Response");
      return true;
    } else {
      isCurrencyError.value = true;

      isCurrencyLoading.value = false;
      isCurrencyCreateTapped = false.obs;
      return false;
    }
  }

  ///Get CurrencyList
  Future<void> getCurrencyList() async {
    currencyDetailsLoading.value = true;
    isCurrencyListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      currencyDetailsMainList.clear();
      currencyDetailsList.clear();
      final parsedResData = await CurrencyService().getCurrencyList();
      if (parsedResData.error != true) {
        if (parsedResData.data.currencies != null &&
            parsedResData.data.currencies.isNotEmpty) {
          for (var element in parsedResData.data.currencies) {
            currencyDetailsMainList.add(CurrencyViewResModel(
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
                country: element.country));
          }
          // currencyDetailsList.add(CurrencyListResModel(
          //     data: parsedResData.data.data!,
          //     status: parsedResData.data.status));
        }
        isCurrencyListError.value = false;

        currencyDetailsLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "Product details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isCurrencyListError.value = true;

        currencyDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isCurrencyListError.value = true;

      currencyDetailsLoading.value = false;

      update();
      print('Product detail res data : $e');
    }
  }


  ///validate and add currency
  validateFields() {
    isValidName.value = AppUtils.validateUserId(nameController.text);
    isValidSymbol.value = AppUtils.validateSymbolsOnly(symbolController.text);
    isValidCurrencySubUnit.value =
        AppUtils.validateUserId(currencySubUnitController.text);
    isValidCurrencyUnit.value =
        AppUtils.validateUserId(currencyUnitController.text);
    isValidCurrencyCode.value =
        AppUtils.validateUserId(currencyCodeController.text);
    isValidUnitPerUSD.value =
        AppUtils.validateUserId(unitPerUsdController.text);
    isValidUnitPerUnit.value =
        AppUtils.validateUserId(usdPerUnitController.text);
  }

  /// Save currency
  saveCurrency() {
    ///Validate fields
    if (isValidName.value &&
        isValidSymbol.value &&
        isValidCurrencySubUnit.value &&
        isValidCurrencyUnit.value &&
        isValidCurrencyCode.value &&
        isValidUnitPerUSD.value &&
        isValidUnitPerUnit.value) {
      ///Add currency
      addCurrency(
              name: nameController.text,
              symbol: symbolController.text,
              country: countryValue.value,
              currencySubUnit: currencySubUnitController.text,
              currencyUnit: currencyUnitController.text,
              currencyCode: currencyCodeController.text,
              currencyRate: int.parse(unitPerUsdController.text),
              usdperunit: int.parse(usdPerUnitController.text),
              symbolPosition:
                  selectedSymbolPosition.value == 'Left' ? false : true,
              status: status.value,
              lastUpdatedDate: datetime)
          .then((value) {
        if (value == true) {
          ///Get currency list. this used to refresh the ui
          getCurrencyList();
          isCurrencyCreateTapped = false.obs;
        }
      });
    }
  }
}

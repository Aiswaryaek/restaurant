// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:restaurant/core/config/session.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/common/features/login/service/login_service.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/login_admin_res_model.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/login_user_res_model.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/search_user_model.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/token_data_res_model.dart';
import 'package:restaurant/repository/api/api_response.dart';

class LogInController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController companyCodeController = TextEditingController();
  final TextEditingController prefixController = TextEditingController();
  var isLoading = false.obs;
  var isError = false.obs;
  var isSearchUserLoading = false.obs;
  var isSearchUserError = false.obs;
  var isShowLoginLayout = false.obs;

  final storage = GetStorage();
  var loginPasswordVisibility = false.obs;
  LoginAdminResModel logInAdminResData = LoginAdminResModel();
  LoginUserResModel logInUserResData = LoginUserResModel();
  SearchUserModel searchUserResData = SearchUserModel();

  ///The Api response of login are different from user and admin so that reason we set different api calls to get this different datas
  ///Admin Login
  Future<bool> adminLogIn({
    required String userName,
    required String passWord,
    required String companyCode,
    required String prefix,
  }) async {
    isLoading.value = true;
    isError.value = false;

    final APIResponse<LoginAdminResModel> parsedResData = await LogInService()
        .adminLogIn(
            userName: userName,
            passWord: passWord,
            companyCode: companyCode,
            prefix: prefix);
    if (parsedResData.error != true) {
      ///save auth token
      logInAdminResData = parsedResData.data;
      await storage.write(Session.authToken,
          parsedResData.data.token != null ? parsedResData.data.token! : '');

      ///save branchID
      await storage.write(
          Session.branchId,
          parsedResData.data.branchPk != null
              ? parsedResData.data.branchPk!
              : '');

      ///save Currency Id
      await storage.write(
          Session.currencyId,
          parsedResData.data.currency != null
              ? parsedResData.data.currency
              : '');

      ///Token decoding
      if (parsedResData.data.token != null) {
        Map<String, dynamic> tokenResData =
            Jwt.parseJwt(parsedResData.data.token.toString());
        TokenData tokenData = TokenData.fromJson(tokenResData);
        await storage.write(
            Session.role, tokenData.role != null ? tokenData.role! : '');
      }

      storage.write(Session.isLogin, true);
      isError.value = false;

      isLoading.value = false;

      AppUtils().printData('Login successful', info: "Login completed");
      return true;
    } else {
      isError.value = true;

      isLoading.value = false;
      return false;
    }
  }

  ///User login
  Future<bool> userLogIn({
    required String userName,
    required String passWord,
    required String companyCode,
    required String prefix,
  }) async {
    isLoading.value = true;
    isError.value = false;

    final APIResponse<LoginUserResModel> parsedResData = await LogInService()
        .userLogIn(
            userName: userName,
            passWord: passWord,
            companyCode: companyCode,
            prefix: prefix);
    if (parsedResData.error != true) {
      ///save auth token
      logInUserResData = parsedResData.data;
      await storage.write(Session.authToken,
          parsedResData.data.token != null ? parsedResData.data.token! : '');

      ///save branchID
      await storage.write(
          Session.branchId,
          parsedResData.data.branchPk != null
              ? parsedResData.data.branchPk!
              : '');

      ///save userName
      await storage.write(
          Session.userName,
          parsedResData.data.userName != null
              ? parsedResData.data.userName!
              : '');

      ///save Currency Id
      await storage.write(
          Session.currencyId,
          parsedResData.data.currency != null
              ? parsedResData.data.currency
              : '');

      ///Token decoding
      if (parsedResData.data.token != null) {
        Map<String, dynamic> tokenResData =
            Jwt.parseJwt(parsedResData.data.token.toString());
        TokenData tokenData = TokenData.fromJson(tokenResData);
        await storage.write(
            Session.role, tokenData.role != null ? tokenData.role! : '');
      }

      storage.write(Session.isLogin, true);
      isError.value = false;

      isLoading.value = false;

      AppUtils().printData('Login successful', info: "Login completed");
      return true;
    } else {
      isError.value = true;

      isLoading.value = false;
      return false;
    }
  }

  ///Search user
  Future<bool> searchUser({
    required String prefix,
    required String userName,
    required String companyCode,
  }) async {
    isSearchUserLoading.value = true;
    isSearchUserError.value = false;

    final APIResponse<SearchUserModel> parsedResData = await LogInService()
        .searchUser(
            prefix: prefix, userName: userName, companyCode: companyCode);
    if (parsedResData.error != true) {
      searchUserResData = parsedResData.data;

      isSearchUserError.value = false;

      isSearchUserLoading.value = false;

      AppUtils()
          .printData('${parsedResData.data}', info: "Search user Res data");
      return true;
    } else {
      isSearchUserError.value = true;

      isSearchUserLoading.value = false;
      return false;
    }
  }

  Future<void> clearAuthToken() async {
    // Clear the authentication token from storage
    await storage.remove(Session.authToken);
  }
}

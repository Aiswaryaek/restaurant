import 'package:restaurant/core/constants/colors.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/login_admin_res_model.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/login_user_res_model.dart';
import 'package:restaurant/presentation/common/features/login/service/res_model/search_user_model.dart';
import 'package:restaurant/repository/api/api_helper.dart';
import 'package:restaurant/repository/api/api_response.dart';

class LogInService {
  ///Admin login
  Future<APIResponse<LoginAdminResModel>> adminLogIn({
    required String userName,
    required String passWord,
    required String companyCode,
    required String prefix,
  }) async {
    final body = {
      "userName": userName,
      "password": passWord,
      "companyCode": companyCode,
      "prefix": prefix
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'admin/login',
          header: APIHelper.getApiHeader(),
          body: body);
          print('login: ${response.data}');
      if (response.error == true) {
        return APIResponse(
            data: LoginAdminResModel(), error: true, errorMessage: '');
      } else {
        final LoginAdminResModel resData = LoginAdminResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);
      return APIResponse(data: LoginAdminResModel(), error: true, errorMessage: '');
    }
  }
///User login
 Future<APIResponse<LoginUserResModel>> userLogIn({
    required String userName,
    required String passWord,
    required String companyCode,
    required String prefix,
  }) async {
    final body = {
      "userName": userName,
      "password": passWord,
      "companyCode": companyCode,
      "prefix": prefix
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'admin/login',
          header: APIHelper.getApiHeader(),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: LoginUserResModel(), error: true, errorMessage: '');
      } else {
        final LoginUserResModel resData = LoginUserResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);
      return APIResponse(data: LoginUserResModel(), error: true, errorMessage: '');
    }
  }
  ///Search user

  Future<APIResponse<SearchUserModel>> searchUser({
    required String prefix,
    required String userName,
    required String companyCode,
  }) async {
    final body = {
      "prefix": prefix,
      "userName": userName,
      "companyCode": companyCode
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'admin/searchuser',
          header: APIHelper.getApiHeader(),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: SearchUserModel(), error: true, errorMessage: '');
      } else {
        final SearchUserModel resData = SearchUserModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);
      return APIResponse(
          data: SearchUserModel(), error: true, errorMessage: '');
    }
  }
}

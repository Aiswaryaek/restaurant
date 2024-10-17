import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/app_config.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/common/features/error/app_error.dart';
import 'package:restaurant/presentation/common/features/login/binding/login_binding.dart';
import 'package:restaurant/presentation/common/features/login/view/login_page.dart';

import 'api_response.dart';

class APIHelper {
  static bool isRequestSucceeded(int statusCode) {
    // if (statusCode == 401) {
    //   AppUtils.oneTimeSnackBar("Session Expired !, Please re-login to continue",
    //       bgColor: Colors.red, time: 3);
    //   // Get.offAll(const LoginPage(), binding: LogInBinding());
    // }

    // if (statusCode == 402) {}

    ///todo : need to handle in other way
    return statusCode >= 200 && statusCode < 401 || statusCode == 500;
    // return (statusCode >= 200) && (statusCode <= 404 || statusCode == 500);
  }

  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    AppUtils.logger.d("Access : Bearer $access");

    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  ///try catch inside get was removed later since 500 is added in status code now it may required! //todo:
  ///for get methode
  ///if final url is null then only other urls applied
  static getData(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    AppUtils().printData('AllEmployees Header: $header');
    if (await AppUtils.isOnline()) {
      final uri = Uri.parse(finalUrl ?? (AppConfig.finalUrl + endPoint));
      AppUtils.logger.i(uri);
      final res = await http.get(uri, headers: header);
      AppUtils().printData('getData res ${utf8.decode(res.bodyBytes)}');
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        if (resBody['status'] == 'ok' ||
            res.statusCode == 200 ||
            res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody["data"]["message"] ?? 'Something went wrong!');
        }
      } else {
        return APIResponse(
            data: '', error: true, errorMessage: 'Something went wrong!');
      }
    } else {
      // Get.offAll(const AppErrorScreen());
      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection!');
    }
  }

  //for post
  ///endpoint is applied only if finalUrl is empty
  static Future<APIResponse> postData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    // AppUtils().printData('$body');
    // AppUtils().printData('postData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.post(uri, headers: header, body: jsonEncode(body));
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (res.statusCode == 200 || res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          // AppUtils.oneTimeSnackBar(
          //     resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody["data"]["message"] ?? 'Something went wrong!');
        }
      } else {
        // AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      // Get.offAll(const AppErrorScreen());
      AppUtils.oneTimeSnackBar('Oh Noo! 🙂');
      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }

  ///post For Shift
   static Future<APIResponse> postShift(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    // AppUtils().printData('$body');
    // AppUtils().printData('postData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.post(uri, headers: header, body: jsonEncode(body));
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (res.statusCode == 200 || res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          // AppUtils.oneTimeSnackBar(
          //     resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody["data"]["message"] ?? 'Something went wrong!');
        }
      } else {
        // AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      // Get.offAll(const AppErrorScreen());
      AppUtils.oneTimeSnackBar('Oh Noo! 🙂');
      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }

  //patch
  static Future<APIResponse> patchData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    if (await AppUtils.isOnline()) {
      // AppUtils().printData('$body');
      // AppUtils().printData('patch body above');
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res =
          await http.patch(uri, headers: header, body: jsonEncode(body));
      // AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (resBody['status'] == 'ok' ||
            res.statusCode == 200 ||
            res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(
              resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody["data"]["message"].toString() ??
                  'Something went wrong!');
        }
      } else {
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   AppUtils().printError('patchData() in api helper $e');
      //   AppUtils.throwError(e);
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      return APIResponse(
          data: '', error: true, errorMessage: 'No internet connection!');
    }
  }

  //for put

  static Future<APIResponse> putData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    // AppUtils().printData('$body');
    // AppUtils().printData('putData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.put(uri, headers: header, body: jsonEncode(body));
      // AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (resBody['status'] == 'ok' ||
            res.statusCode == 200 ||
            res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(
              resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody["data"]["message"].toString() ??
                  'Something went wrong!');
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      Get.offAll(AppErrorScreen());
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  static Future<APIResponse> deleteData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    AppUtils().printData('$body');
    AppUtils().printData('deleteData');
    AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res =
          await http.delete(uri, headers: header, body: jsonEncode(body));
      AppUtils().printData(res.body,
          info:
              'delete res body${res.statusCode}${isRequestSucceeded(res.statusCode)}');
      if (isRequestSucceeded(res.statusCode)) {
        // var resBody = json.decode(utf8.decode(res.bodyBytes));
        ///since the delete function doesn't return any data
        if (res.statusCode == 204) {
          return APIResponse(data: 'no body', error: false, errorMessage: '');
        } else {
          var resBody = json.decode(utf8.decode(res.bodyBytes));

          AppUtils.oneTimeSnackBar(
              resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: 'no body',
              error: true,
              errorMessage: resBody["data"]["message"].toString());
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
    } else {
      Get.offAll(AppErrorScreen());

      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }

  //for post
  ///endpoint is applied olny if finalUrl is empty
  static Future<APIResponse> postDataNoSnackBar(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    AppUtils().printData('$body');
    AppUtils().printData('postData');
    AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.post(uri, headers: header, body: jsonEncode(body));
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (resBody['status'] == 'ok' ||
            res.statusCode == 200 ||
            res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          // AppUtils.oneTimeSnackBar(resBody["data"]["message"].toString());
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody["data"]["message"].toString() ??
                  'Something went wrong!');
        }
      } else {
        // AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      Get.offAll(AppErrorScreen());

      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }
  ///Reservation
static Future<APIResponse> postReservationData({
  required String endPoint,
  required Map<String, String> header,
  required String body, // Ensure body is a JSON string
}) async {
  final uri = Uri.parse(AppConfig.finalUrl + endPoint);
  print('Request URL: $uri'); // Debugging statement
  print('Request Headers: $header'); // Debugging statement

  final response = await http.post(
    uri,
    headers: header,
    body: body, // Send the body as a JSON string
  );

  print('Response Status Code: ${response.statusCode}'); // Debugging statement
  print('Response Body: ${response.body}'); // Debugging statement
  
  return APIResponse(
    data: jsonDecode(response.body), // Deserialize the response
    error: response.statusCode != 200,
    errorMessage: response.reasonPhrase ?? '',
  );
}


///Card
static Future<APIResponse> postCardData({
  required String endPoint,
  required Map<String, String> header,
  // required String body, // Ensure body is a JSON string
}) async {
  final uri = Uri.parse(AppConfig.finalUrl + endPoint);
  print('Request URL: $uri'); // Debugging statement
  print('Request Headers: $header'); // Debugging statement

  final response = await http.post(
    uri,
    headers: header,
    // body: body, // Send the body as a JSON string
  );

  print('Response Status Code: ${response.statusCode}'); // Debugging statement
  print('Response Body: ${response.body}'); // Debugging statement
  
  return APIResponse(
    data: jsonDecode(response.body), // Deserialize the response
    error: response.statusCode != 200,
    errorMessage: response.reasonPhrase ?? '',
  );
}

  ///Custom put data
  static Future<APIResponse> customPutData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    AppUtils().printData('$body');
    AppUtils().printData('putdata');
    AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.put(uri, headers: header, body: jsonEncode(body));
      AppUtils().printData(res.body,
          info:
              'put res body${res.statusCode}${isRequestSucceeded(res.statusCode)}');
      if (isRequestSucceeded(res.statusCode)) {
        // var resBody = json.decode(utf8.decode(res.bodyBytes));
        ///since the delete function doesn't return any data
        if (res.statusCode == 200 ||
            res.statusCode == 201 ||
            res.statusCode == 204) {
          return APIResponse(data: 'no body', error: false, errorMessage: '');
        } else {
          var resBody = json.decode(utf8.decode(res.bodyBytes));

          AppUtils.oneTimeSnackBar(
              resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: 'no body',
              error: true,
              errorMessage: resBody["data"]["message"].toString());
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
    } else {
      Get.offAll(AppErrorScreen());

      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }

  ///Custom logout

  static Future<APIResponse> customLogout(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    AppUtils().printData('postData');
    AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.post(
        uri,
        headers: header,
      );
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (resBody['status'] == 'ok' ||
            res.statusCode == 200 ||
            res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(resBody["data"]["message"].toString());
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody["data"]["message"].toString() ??
                  'Something went wrong!');
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      Get.offAll(AppErrorScreen());

      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }

  static Future<APIResponse> postDataWithoutBody(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    // AppUtils().printData('postData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.post(
        uri,
        headers: header,
      );
      // print('Response statuscode : ${res.statusCode}');
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (resBody['status'] == 'ok' ||
            res.statusCode == 200 ||
            res.statusCode == 201) {
              print('Response Body: ${resBody} StatusCode: ${res.statusCode}');
          return APIResponse(data: resBody, error: false, errorMessage: '');
          
        } else {
          AppUtils.oneTimeSnackBar(resBody["data"]["message"].toString());
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage: resBody["data"]["message"].toString() ??
                  'Something went wrong!');
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      Get.offAll(const AppErrorScreen());

      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }

  ///Get
  static Future<APIResponse> get(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.get(uri, headers: header);
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (res.statusCode == 200 || res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(
              resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody["data"]["message"] ?? 'Something went wrong!');
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      // Get.offAll(const AppErrorScreen());
      AppUtils.oneTimeSnackBar('Oh Noo! 🙂');
      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }
  ///postWithNoBody
 static Future<APIResponse> postNoBody(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    if (await AppUtils.isOnline()) {
      // try{
      final uri = Uri.parse(finalUrl ?? AppConfig.finalUrl + endPoint);
      AppUtils.logger.i(uri);
      // AppUtils().printData(header);
      final res = await http.post(uri, headers: header);
      AppUtils().printData(res.body);
      if (isRequestSucceeded(res.statusCode)) {
        var resBody = json.decode(utf8.decode(res.bodyBytes));
        // AppUtils().printData('post resBody');
        AppUtils().printData(resBody);
        if (res.statusCode == 200 || res.statusCode == 201) {
          return APIResponse(data: resBody, error: false, errorMessage: '');
        } else {
          AppUtils.oneTimeSnackBar(
              resBody["data"]["message"] ?? 'Something went wrong!');
          return APIResponse(
              data: resBody,
              error: true,
              errorMessage:
                  resBody["data"]["message"] ?? 'Something went wrong!');
        }
      } else {
        AppUtils.oneTimeSnackBar('Something went wrong!');
        return APIResponse(
            data: res.body, error: true, errorMessage: 'Something went wrong!');
      }
      // }catch(e){
      //   return APIResponse(
      //       data: '', error: true, errorMessage: 'Could\'t reach server');
      // }
    } else {
      // Get.offAll(const AppErrorScreen());
      AppUtils.oneTimeSnackBar('Oh Noo! 🙂');
      return APIResponse(
          data: '', error: true, errorMessage: 'No Internet Connection');
    }
  }
}

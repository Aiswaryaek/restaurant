import 'dart:convert';

import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add%20_reservation_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_customer_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_pos_order_from_ongoing_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_pos_order_hold_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_pos_order_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/all_categories_view_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/cancel_reservation_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/categories_view_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/edit_reservation_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/fetch_payments_for_pos_by_branch_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/get_all_employees.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/post_order_from_floor_plan_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/post_pos_payment_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/post_reservation_to_pos_order_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_all_aggregators_list_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_card_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_cash_customer_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_customer_for_dropdown.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_customer_wallet_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_pos_configuration_setting_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_pos_order_by_id_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_pos_special_offer.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_products_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_reservation_list_model.dart';

import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../repository/api/api_helper.dart';
import '../../../../../../../repository/api/api_response.dart';
import '../../../../../../../styles/colors.dart';

class POSService {
  ///List Of All Categories
  Future<APIResponse<AllCategoriesListResModel>> getAllCategoriesList(
      bool type) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"type": type, "branchId": branchId};
    print('Branch Id :$branchId');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'category/view',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AllCategoriesListResModel(allCategoriesView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final allCategoriesList =
            AllCategoriesListResModel.fromJson(responseData);
        return APIResponse(
            data: allCategoriesList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllCategoriesListResModel(allCategoriesView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///List Of Categories
  Future<APIResponse<CategoriesListResModel>> getCategoriesList(
      String catId) async {
    final body = {"catId": catId};

    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'readymade/categoryfilter',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: CategoriesListResModel(categoriesView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final categoriesList = CategoriesListResModel.fromJson(responseData);
        return APIResponse(
            data: categoriesList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: CategoriesListResModel(categoriesView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///List Of Products
  Future<APIResponse<ViewProductsPosListResModel>> getViewProductPosList(
      String mainCatId, String catId) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "branchId": branchId,
      "index": 0,
      "mainCatgeoryId": mainCatId,
      "poscat": catId
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'readymade/viewproductsforpos',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: ViewProductsPosListResModel(viewProductsPosList: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final productList = ViewProductsPosListResModel.fromJson(responseData);
        return APIResponse(data: productList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: ViewProductsPosListResModel(viewProductsPosList: []),
          error: true,
          errorMessage: '');
    }
  }

  ///Add Pos Order - Cart AddOrder Button
  Future<APIResponse<AddPosOrderModel>> addPOSOrderRes(
      {List<Map<String, dynamic>> orderInfo = const [],
      required int subTotal,
      required int discountAmt,
      required dynamic amtTotal,
      required dynamic totalInclusive,
      required dynamic totalExclusive,
      required String custId,
      required String orderDate,
      required String ordType,
      required dynamic aggregatorId,
      required dynamic aggregatorRef,
      required dynamic waiterId}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "orderInfo": orderInfo,
      "subTotal": subTotal,
      "discountAmt": discountAmt,
      "amtTotal": amtTotal,
      "totalInclusive": totalInclusive,
      "totalExclusive": totalExclusive,
      "branchId": branchId,
      "cusId": custId,
      "orderDate": orderDate,
      "ordType": ordType,
      "aggregatorId": aggregatorId,
      "aggregatorRef": aggregatorRef,
      "waiterId": waiterId,
    };

    print(
        'Request Body: $body'); // Print the request body to ensure all data is correct

    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/addPosOrder',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);

      print(
          'Raw API Response: ${response.data}'); // Print the raw response from the API

      if (response.error == true) {
        return APIResponse(
            data: AddPosOrderModel(), error: true, errorMessage: '');
      } else {
        final AddPosOrderModel resData =
            AddPosOrderModel.fromJson(response.data);

        print(
            'Parsed API Response: ${resData.id}'); // Print the parsed id to verify

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the Add Order Request',
          bgColor: confirmColor);

      return APIResponse(
          data: AddPosOrderModel(), error: true, errorMessage: '');
    }
  }

  ///View Cash Customer
  Future<APIResponse<ViewCashCustomerResModel>> getViewCashCustomerRes() async {
    try {
      final APIResponse response = await APIHelper.postDataWithoutBody(
        endPoint: 'customer/viewCashCustomer',
        header: APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
      );
      if (response.error == true) {
        return APIResponse(
            data: ViewCashCustomerResModel(), error: true, errorMessage: '');
      } else {
        final ViewCashCustomerResModel resData =
            ViewCashCustomerResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar(
          'Could not complete the View Cash Customer Request',
          bgColor: confirmColor);

      return APIResponse(
          data: ViewCashCustomerResModel(), error: true, errorMessage: '');
    }
  }

  ///view Customer for Dropdown
  Future<APIResponse<AllCustomerDropdownList>>
      getViewCustomerDropdownRes() async {
    final body = {"search": ""};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'account/viewCustomerForDropdown',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AllCustomerDropdownList(allCustomerDropdown: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final dropdownList = AllCustomerDropdownList.fromJson(responseData);
        return APIResponse(data: dropdownList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllCustomerDropdownList(allCustomerDropdown: []),
          error: true,
          errorMessage: '');
    }
  }

  ///Add Customer
  Future<APIResponse<AddCustomerResModel>> addCustomerRes(
      {String? name,
      String? mobileNo,
      String? city,
      String? streetName,
      String? buildingNo,
      String? buildingName,
      String? roomNo,
      String? status,
      String? isCustomer,
      String? isVendor}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "name": name,
      "mobileNo": mobileNo,
      "city": city,
      "streetName": streetName,
      "buildingNo": buildingNo,
      "buildingName": buildingName,
      "roomNo": roomNo,
      "branchId": branchId,
      "status": status,
      "isCustomer": isCustomer,
      "IsVendor": isVendor
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'account/createVendor',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        print('Add order error');
        return APIResponse(
            data: AddCustomerResModel(), error: true, errorMessage: '');
      } else {
        final AddCustomerResModel resData =
            AddCustomerResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: AddCustomerResModel(), error: true, errorMessage: '');
    }
  }

  ///List Of All Employees
  Future<APIResponse<AllEmployeesListResModel>> getAllEmployeesRes() async {
    try {
      final APIResponse response = await APIHelper.get(
          endPoint: 'employee/getAllEmployees',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      if (response.error == true) {
        return APIResponse(
            data: AllEmployeesListResModel(allEmployeesView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final dropdownList = AllEmployeesListResModel.fromJson(responseData);
        return APIResponse(data: dropdownList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllEmployeesListResModel(allEmployeesView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///View Pos Order By Id - Get OrderDetails
  Future<APIResponse<ViewPosOrderByIdResModel>> viewPosOrderById(
      {String? orderId}) async {
    final body = {"id": orderId};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/viewPosOrderById',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        print('View Pos Order By Id error');
        return APIResponse(
            data: ViewPosOrderByIdResModel(), error: true, errorMessage: '');
      } else {
        final ViewPosOrderByIdResModel resData =
            ViewPosOrderByIdResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: ViewPosOrderByIdResModel(), error: true, errorMessage: '');
    }
  }

  ///postOrderFromFloorPlan - add Order After Table Selection
  Future<APIResponse<PostOrderFromFloorPlanResModel>> postOrderFromFloorPlanRes(
      {List<Map<String, dynamic>> orderInfo = const [],
      required int subTotal,
      required int discountAmt,
      required dynamic amtTotal,
      required dynamic totalInclusive,
      required dynamic totalExclusive,
      required String custId,
      required String orderDate,
      required String orderId,
      required dynamic aggregatorId,
      required dynamic aggregatorRef,
      required dynamic waiterId}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "orderInfo": orderInfo,
      "subTotal": subTotal,
      "discountAmt": discountAmt,
      "amtTotal": amtTotal,
      "totalInclusive": totalInclusive,
      "totalExclusive": totalExclusive,
      "branchId": branchId,
      "cusId": custId,
      "orderDate": orderDate,
      "orderId": orderId,
      "aggregatorId": aggregatorId,
      "aggregatorRef": aggregatorRef,
      "waiterId": waiterId,
    };
    print('Add Order From Floor Plan: $body');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/postOrderFromFloorPlan',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: PostOrderFromFloorPlanResModel(),
            error: true,
            errorMessage: '');
      } else {
        final PostOrderFromFloorPlanResModel resData =
            PostOrderFromFloorPlanResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar(
          'Could not complete the Add Order From Floor Request',
          bgColor: confirmColor);

      return APIResponse(
          data: PostOrderFromFloorPlanResModel(),
          error: true,
          errorMessage: '');
    }
  }

  ///Add Pos Order - Cart updateOrder from ongoing order
  Future<APIResponse<AddPosOrderFromOngoingResModel>> addPOSOrderFromOngoingRes(
      {List<Map<String, dynamic>> orderInfo = const [],
      required dynamic subTotal,
      required dynamic discountAmt,
      required dynamic amtTotal,
      required dynamic totalInclusive,
      required dynamic totalExclusive,
      required dynamic password,
      required String custId,
      required String ordType,
      required String ordId,
      required dynamic aggregatorId,
      required dynamic aggregatorRef,
      required dynamic waiterId}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "orderInfo": orderInfo,
      "subTotal": subTotal,
      "discountAmt": discountAmt,
      "amtTotal": amtTotal,
      "totalInclusive": totalInclusive,
      "totalExclusive": totalExclusive,
      "branchId": branchId,
      "password": password,
      "cusId": custId,
      "ordType": ordType,
      "orderId": ordId,
      "aggregatorId": aggregatorId,
      "aggregatorRef": aggregatorRef,
      "waiterId": waiterId,
    };
    print('Body Of Add order from ongoing : ${body}');
    print(
        'Add Order: Subtotal: ${subTotal.runtimeType}, discountAmt: ${discountAmt.runtimeType}, amtTotal: ${amtTotal.runtimeType}, totalInclusive: ${totalInclusive.runtimeType}, totalExclusive: ${totalExclusive.runtimeType}, BranchId: ${branchId.runtimeType}, custId: ${custId.runtimeType}, ordType: ${ordType.runtimeType}, OrdID: ${ordId.runtimeType}, AggregatorId: ${aggregatorId.runtimeType}, AggregatorRef: ${aggregatorRef.runtimeType}, Waiter: ${waiterId.runtimeType}');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/addItemsToExistingOrders',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);

      if (response.error == true) {
        return APIResponse(
            data: AddPosOrderFromOngoingResModel(),
            error: true,
            errorMessage: '');
      } else {
        final AddPosOrderFromOngoingResModel resData =
            AddPosOrderFromOngoingResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the Add Order Request',
          bgColor: confirmColor);

      return APIResponse(
          data: AddPosOrderFromOngoingResModel(),
          error: true,
          errorMessage: '');
    }
  }

  ///Hold - products from cart
  Future<APIResponse<AddPosOrderHoldResModel>> addPOSOrderHoldRes(
      {List<Map<String, dynamic>> orderInfo = const [],
      required int subTotal,
      required int discountAmt,
      required dynamic amtTotal,
      required dynamic totalInclusive,
      required dynamic totalExclusive,
      required String custId,
      required String orderDate,
      required dynamic orderId,
      required String ordType,
      required dynamic aggregatorId,
      required dynamic aggregatorRef,
      required dynamic waiterId}) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "orderInfo": orderInfo,
      "subTotal": subTotal,
      "discountAmt": discountAmt,
      "amtTotal": amtTotal,
      "totalInclusive": totalInclusive,
      "totalExclusive": totalExclusive,
      "branchId": branchId,
      "cusId": custId,
      "orderDate": orderDate,
      "orderId": orderId,
      "ordType": ordType,
      "aggregatorId": aggregatorId,
      "aggregatorRef": aggregatorRef,
      "waiterId": waiterId,
    };
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/addPosOrderHold',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);

      if (response.error == true) {
        return APIResponse(
            data: AddPosOrderHoldResModel(), error: true, errorMessage: '');
      } else {
        final AddPosOrderHoldResModel resData =
            AddPosOrderHoldResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the Add Order Request',
          bgColor: confirmColor);

      return APIResponse(
          data: AddPosOrderHoldResModel(), error: true, errorMessage: '');
    }
  }

  ///Reservation List
  Future<APIResponse<ViewReservationListResModel>>
      viewReservationListRes(dynamic index) async {
    String branchId = await AppUtils.getBranchId();
    final body = {"branchId": branchId,"index":index};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/viewReservationList',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);

      if (response.error == true) {
        return APIResponse(
            data: ViewReservationListResModel(), error: true, errorMessage: '');
      } else {
        final ViewReservationListResModel resData =
            ViewReservationListResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar(
          'Could not complete the View Reservation Request',
          bgColor: confirmColor);

      return APIResponse(
          data: ViewReservationListResModel(), error: true, errorMessage: '');
    }
  }

  ///Add Reservation
  Future<APIResponse<AddReservationResModel>> addReservationRes(
      List<String> tableIds,
      dynamic date,
      dynamic mobileNo,
      String customerId,
      String floorId,
      dynamic note,
      dynamic time,
      dynamic totalPerson) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "branchId": branchId,
      "cusId": customerId,
      "date": date,
      "floorId": floorId,
      "mobileNo": mobileNo,
      "note": note,
      "tableId": tableIds,
      "time": time,
      "totalPerson": totalPerson,
    };
    print('PayLoad :$body');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/addReservation',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AddReservationResModel(), error: true, errorMessage: '');
      } else {
        final AddReservationResModel resData =
            AddReservationResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: AddReservationResModel(), error: true, errorMessage: '');
    }
  }

  ///Cancel Reservation
  Future<APIResponse<CancelReservationResModel>> cancelReservationRes(
      String reservationId, String status) async {
    final body = {"_id": reservationId, "status": status};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/editReservation',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);

      if (response.error == true) {
        return APIResponse(
            data: CancelReservationResModel(), error: true, errorMessage: '');
      } else {
        final CancelReservationResModel resData =
            CancelReservationResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar(
          'Could not complete the Reservation Cancel Request',
          bgColor: confirmColor);

      return APIResponse(
          data: CancelReservationResModel(), error: true, errorMessage: '');
    }
  }

  ///Edit Reservation
  Future<APIResponse<EditReservationResModel>> editReservationRes(
      List<String> tableIds,
      dynamic date,
      dynamic mobileNo,
      String customerId,
      String floorId,
      dynamic note,
      dynamic time,
      dynamic totalPerson,
      dynamic reservationId) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "branchId": branchId,
      "cusId": customerId,
      "date": date,
      "floorId": floorId,
      "mobileNo": mobileNo,
      "note": note,
      "tableId": tableIds,
      "time": time,
      "totalPerson": totalPerson,
      "_id": reservationId
    };
    print('PayLoad :$body');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/editReservation',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: EditReservationResModel(), error: true, errorMessage: '');
      } else {
        final EditReservationResModel resData =
            EditReservationResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: EditReservationResModel(), error: true, errorMessage: '');
    }
  }

  ///add order - reservation
  Future<APIResponse<PostReservationToAddOrderModel>> addReservationToPosOrder(
      dynamic currentDate, dynamic reservationId) async {
    final body = {
      "reservationId": reservationId,
      "postDate": currentDate,
    };
    print('PayLoad :$body');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/postReservationToPosOrder',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: PostReservationToAddOrderModel(),
            error: true,
            errorMessage: '');
      } else {
        final PostReservationToAddOrderModel resData =
            PostReservationToAddOrderModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: PostReservationToAddOrderModel(),
          error: true,
          errorMessage: '');
    }
  }

  ///List Of All Aggregators
  Future<APIResponse<AllAggregatorsListResModel>>
      getAllAggregatorsList() async {
    String branchId = await AppUtils.getBranchId();
    final body = {"branchId": branchId};
    print('Branch Id :$branchId');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/viewAggregatorList',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AllAggregatorsListResModel(allAggregatorsView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final allCategoriesList =
            AllAggregatorsListResModel.fromJson(responseData);
        return APIResponse(
            data: allCategoriesList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllAggregatorsListResModel(allAggregatorsView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///View pos Configuration Settings
  Future<APIResponse<ViewPosConfigurationResModel>>
      getViewPosConfigurationSettings() async {
    try {
      final APIResponse response = await APIHelper.postDataWithoutBody(
        endPoint: 'settings/viewPosConfigurationSettings',
        header: APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
      );
      print('POSConfigurationSettings: ${response.data}');
      if (response.error == true) {
        return APIResponse(
            data: ViewPosConfigurationResModel(),
            error: true,
            errorMessage: '');
      } else {
        final ViewPosConfigurationResModel resData =
            ViewPosConfigurationResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar(
          'Could not complete the View pos Configuration Settings',
          bgColor: confirmColor);

      return APIResponse(
          data: ViewPosConfigurationResModel(), error: true, errorMessage: '');
    }
  }

  ///Fetch Payments For Pos By Branch - Payment Types
  Future<APIResponse<AllPaymentsForPosByBranchListResModel>>
      getAllPaymentsForPosByBranchList() async {
    String branchId = await AppUtils.getBranchId();
    final body = {"branchId": branchId};
    print('Branch Id :$branchId');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'settings/fetchpaymentsforposbybranch',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AllPaymentsForPosByBranchListResModel(
                allPaymentsForPosView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final allPaymentsForPosView =
            AllPaymentsForPosByBranchListResModel.fromJson(responseData);
        return APIResponse(
            data: allPaymentsForPosView, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data:
              AllPaymentsForPosByBranchListResModel(allPaymentsForPosView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///List Of All Categories
  Future<APIResponse<AllCardsListResModel>> getAllCardsList() async {
    try {
      final APIResponse response = await APIHelper.postCardData(
        endPoint: 'settings/viewcard',
        header: APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
      );
      if (response.error == true) {
        return APIResponse(
            data: AllCardsListResModel(allCardsView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final allCardsView = AllCardsListResModel.fromJson(responseData);
        return APIResponse(data: allCardsView, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      // AppUtils.oneTimeSnackBar('Could not complete the request',
      //     bgColor: confirmColor);

      return APIResponse(
          data: AllCardsListResModel(allCardsView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///View Customer Wallet - payment wallet option
  Future<APIResponse<ViewCustomerWalletResModel>> getViewCustomerWallet(
      {String? custId}) async {
    final body = {"cusId": custId};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/viewCustomerWallet',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: ViewCustomerWalletResModel(), error: true, errorMessage: '');
      } else {
        final ViewCustomerWalletResModel resData =
            ViewCustomerWalletResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: ViewCustomerWalletResModel(), error: true, errorMessage: '');
    }
  }

  ///Add Payment Order - Cart AddOrder Button
  Future<APIResponse<PostPosPaymentResModel>> addPostPosPaymentRes({
    List<Map<String, dynamic>> paymentMethod = const [],
    dynamic ordId,
    dynamic discountAmt,
    dynamic deliveryCharge,
    dynamic pkgCharge,
    dynamic amtTotal,
    dynamic paymentDate,
    dynamic custId,
    dynamic ordDuration,
    dynamic password
  }) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "orderId": ordId,
      "branchId": branchId,
      "discountAmt": discountAmt,
      "deliveryCharge": deliveryCharge,
      "pkgCharge": pkgCharge,
      "amtTotal": amtTotal,
      "paymentDate": paymentDate,
      "paymentMethod": paymentMethod,
      "cusId": custId,
      "ordDuration": ordDuration,
      "password":password
    };
    print('Response from Post Payment: $body');
    print(
        'orderId: ${ordId.runtimeType}, branchId: ${branchId.runtimeType}, discountAmt: ${discountAmt.runtimeType}, deliveryCharge: ${deliveryCharge.runtimeType}, pkgCharge: ${pkgCharge.runtimeType}, amtTotal: ${amtTotal.runtimeType}, paymentDate: ${paymentDate.runtimeType}, cusId: ${custId.runtimeType}, 33ordDuration: ${ordDuration.runtimeType}');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/postPosPayment',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: PostPosPaymentResModel(), error: true, errorMessage: '');
      } else {
        final PostPosPaymentResModel resData =
            PostPosPaymentResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the Add Order Request',
          bgColor: confirmColor);

      return APIResponse(
          data: PostPosPaymentResModel(), error: true, errorMessage: '');
    }
  }

 ///List Of special items
  Future<APIResponse<ViewPOSSpecialOfferResModel>> getSpecialItems(
      String day) async {
        String branchId = await AppUtils.getBranchId();
    final body = {"branchId":branchId,"day":day};

    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/viewSpecialOffer',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: ViewPOSSpecialOfferResModel(viewSpecialOffersPosList: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final specialItemsList = ViewPOSSpecialOfferResModel.fromJson(responseData);
        return APIResponse(
            data: specialItemsList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: ViewPOSSpecialOfferResModel(viewSpecialOffersPosList: []),
          error: true,
          errorMessage: '');
    }
  }
}

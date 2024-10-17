// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add%20_reservation_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_customer_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_pos_order_from_ongoing_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_pos_order_hold_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/add_pos_order_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/cancel_reservation_model.dart';
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
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/service/res_model/view_reservation_list_model.dart';
import 'package:restaurant/repository/api/api_response.dart';
import '../../../../../../../../core/utils/app_utils.dart';
import '../service/pos_service.dart';
import '../service/res_model/all_categories_view_model.dart';
import '../service/res_model/categories_view_model.dart';
import '../service/res_model/view_products_for_pos_model.dart';

class POSController extends GetxController {
  ///Get All Categories List
  var allCategoriesViewDetailsLoading = false.obs;
  var isAllCategoriesListError = false.obs;
  var orderStatus = 'OrderFromCategories'.obs;
  List<AllCategoriesViewResModel> allCategoriesViewMainList = [];
  List<AllCategoriesViewResModel> allCategoryViewList = [];

  Future<void> getAllCategoriesList(bool type) async {
    allCategoriesViewDetailsLoading.value = true;
    isAllCategoriesListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      allCategoriesViewMainList.clear();
      allCategoryViewList.clear();
      final parsedResData = await POSService().getAllCategoriesList(type);
      if (parsedResData.error != true) {
        if (parsedResData.data.allCategoriesView != null &&
            parsedResData.data.allCategoriesView.isNotEmpty) {
          for (var element in parsedResData.data.allCategoriesView) {
            allCategoriesViewMainList.add(AllCategoriesViewResModel(
                branchId: element.branchId,
                id: element.id,
                categoryName: element.categoryName,
                salesJournal: element.salesJournal,
                salesExpenseAccount: element.salesExpenseAccount,
                salesIncome: element.salesIncome,
                status: element.status,
                type: element.type,
                imageUrl: element.imageUrl,
                v: element.v,
                branchIdList: element.branchIdList));
          }
        }
        isAllCategoriesListError.value = false;

        allCategoriesViewDetailsLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "All Categories details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isAllCategoriesListError.value = true;

        allCategoriesViewDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isAllCategoriesListError.value = true;

      allCategoriesViewDetailsLoading.value = false;

      update();
      print('All Categories detail res data : $e');
    }
  }

  ///Get Categories List
  var categoriesViewDetailsLoading = false.obs;
  var isCategoriesListError = false.obs;
  List<CategoriesViewResModel> categoriesViewMainList = [];
  List<CategoriesViewResModel> categoryViewList = [];

  Future<void> getCategoriesList(String? catId) async {
    categoriesViewDetailsLoading.value = true;
    isCategoriesListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      categoriesViewMainList.clear();
      categoryViewList.clear();
      final parsedResData = await POSService().getCategoriesList(catId!);
      if (parsedResData.error != true) {
        if (parsedResData.data.categoriesView != null &&
            parsedResData.data.categoriesView.isNotEmpty) {
          for (var element in parsedResData.data.categoriesView) {
            categoriesViewMainList.add(CategoriesViewResModel(
                id: element.id,
                catId: element.catId,
                name: element.name,
                parentName: element.parentName,
                parentCategories: element.parentCategories,
                v: element.v,
                catname: element.catname));
          }
        }
        isCategoriesListError.value = false;

        categoriesViewDetailsLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "Categories details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isCategoriesListError.value = true;

        categoriesViewDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isCategoriesListError.value = true;

      categoriesViewDetailsLoading.value = false;

      update();
      print('Categories detail res data : $e');
    }
  }

  ///Get Product List
  var productListPosLoading = false.obs;
  var isProductListPosError = false.obs;
  List<ViewProductsForPosModel> productListViewMainList = [];
  List<ViewProductsForPosModel> productListView = [];

  Future<void> getProductListForPOS(String mainCatId, String catId) async {
    productListPosLoading.value = true;
    isProductListPosError.value = false;
    update();
    try {
      ///Avoid duplicate items
      productListViewMainList.clear();
      productListView.clear();
      final parsedResData =
          await POSService().getViewProductPosList(mainCatId, catId);
      if (parsedResData.error != true) {
        if (parsedResData.data.viewProductsPosList != null &&
            parsedResData.data.viewProductsPosList.isNotEmpty) {
          for (var element in parsedResData.data.viewProductsPosList) {
            productListViewMainList.add(ViewProductsForPosModel(
              id: element.id,
              mainCatgeoryId: element.mainCatgeoryId,
              poscat: element.poscat,
              prodType: element.prodType,
              barcode: element.barcode,
              uom: element.uom,
              purchaseuom: element.purchaseuom,
              cost: element.cost,
              salesPrice: element.salesPrice,
              attribute: element.attribute,
              productName: element.productName,
              imageUrl: element.imageUrl,
              purchaseUomName: element.purchaseUomName,
              uomName: element.uomName,
              taxes: element.taxes,
              includedPrice: element.includedPrice,
              relevanceScore: element.relevanceScore,
            ));
          }
        }
        isProductListPosError.value = false;

        productListPosLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "Products details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isProductListPosError.value = true;

        productListPosLoading.value = false;

        update();
      }
    } catch (e) {
      isProductListPosError.value = true;

      productListPosLoading.value = false;

      update();
      print('Products detail res data : $e');
    }
  }

  ///Get View Cash Customer
  var isViewCashCustomerLoading = false.obs;
  var isViewCashCustomerError = false.obs;
  ViewCashCustomerResModel viewCashCustomerResData = ViewCashCustomerResModel();
  Future<bool> getViewCashCustomer() async {
    isViewCashCustomerLoading.value = true;
    // isViewCashCustomerError.value = false;
    update();
    try {
      final parsedResData = await POSService().getViewCashCustomerRes();
      if (parsedResData.error != true) {
        viewCashCustomerResData = parsedResData.data;

        isViewCashCustomerError.value = true;

        isViewCashCustomerLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "View Cash Customer data");
        return true;
      } else {
        AppUtils.oneTimeSnackBar("Oops! Something went wrong");
        isViewCashCustomerError.value = false;

        isViewCashCustomerLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isViewCashCustomerError.value = false;

      isViewCashCustomerLoading.value = false;
      update();
      print('Free demo register res data : $e');
      return false;
    }
  }

  ///GetViewCustomerDropdownList
  var customerDropdownViewDetailsLoading = false.obs;
  var isCustomerDropdownListError = false.obs;
  List<ViewCustomerForDropdownResModel> customerDropdownViewMainList = [];
  List<ViewCustomerForDropdownResModel> customerDropdownViewList = [];

  Future<void> getCustomerDropdownList() async {
    customerDropdownViewDetailsLoading.value = true;
    isCustomerDropdownListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      customerDropdownViewMainList.clear();
      customerDropdownViewList.clear();
      final parsedResData = await POSService().getViewCustomerDropdownRes();
      if (parsedResData.error != true) {
        if (parsedResData.data.allCustomerDropdown != null &&
            parsedResData.data.allCustomerDropdown.isNotEmpty) {
          for (var element in parsedResData.data.allCustomerDropdown) {
            customerDropdownViewMainList.add(ViewCustomerForDropdownResModel(
                id: element.id,
                name: element.name,
                mobileNo: element.mobileNo));
          }
        }
        isCustomerDropdownListError.value = false;

        customerDropdownViewDetailsLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data,
            info: "Customer Dropdown details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isCustomerDropdownListError.value = true;

        customerDropdownViewDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isCustomerDropdownListError.value = true;

      customerDropdownViewDetailsLoading.value = false;

      update();
      print('Customer Dropdown detail res data : $e');
    }
  }

  ///POS add Order - Cart Add Order Button
  var isAddOrderLoading = false.obs;
  var productOrderId = ''.obs;
  AddPosOrderModel posAddOrderData = AddPosOrderModel();
Future<bool> addPosOrder(
    {required int subTotal,
    required int discountAmt,
    List<Map<String, dynamic>> orderInfo = const [],
    required dynamic amtTotal,
    required dynamic totalInclusive,
    required dynamic totalExclusive,
    required String custId,
    required String orderDate,
    required String ordType,
    required dynamic aggregatorId,
    required dynamic aggregatorRef,
    required dynamic waiterId}) async {
  
  isAddOrderLoading.value = true;

  try {
    final parsedResData = await POSService().addPOSOrderRes(
        orderInfo: orderInfo,
        subTotal: subTotal,
        discountAmt: discountAmt,
        amtTotal: amtTotal,
        totalInclusive: totalInclusive,
        totalExclusive: totalExclusive,
        custId: custId,
        orderDate: orderDate,
        ordType: ordType,
        aggregatorId: aggregatorId,
        aggregatorRef: aggregatorRef,
        waiterId: waiterId);
      
    if (parsedResData.error != true) {
      posAddOrderData = parsedResData.data;
      isAddOrderLoading.value = false;

      // Store the order id in the reactive variable for easy access
      productOrderId.value = posAddOrderData.id ?? ''; // If id is null, set an empty string

      print('Add order id: ${posAddOrderData.id}');
      print('Order ID stored in controller: ${productOrderId.value}');

      return true;
    } else {
      isAddOrderLoading.value = false;
      update();
      return false;
    }
  } catch (e) {
    isAddOrderLoading.value = false;
    update();
    print('Add Order error: $e');
    return false;
  }
}


  

  ///Add Customer
  var isAddCustomerLoading = false.obs;
  var isAddCustomerError = false.obs;
  String addedCustomer = '';
  AddCustomerResModel viewAddCustomerResData = AddCustomerResModel();
  Future<bool> addCustomer(
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
    isAddCustomerLoading.value = true;
    final APIResponse<AddCustomerResModel> parsedResData = await POSService()
        .addCustomerRes(
            name: name,
            mobileNo: mobileNo,
            city: city,
            streetName: streetName,
            buildingNo: buildingNo,
            buildingName: buildingName,
            roomNo: roomNo,
            status: status,
            isCustomer: isCustomer,
            isVendor: isVendor);
    if (parsedResData.error != true) {
      viewAddCustomerResData = parsedResData.data;
      print('Add Customer --- $viewAddCustomerResData');
      addedCustomer = viewAddCustomerResData.name!;
      isAddCustomerError.value = false;

      isAddCustomerLoading.value = false;

      AppUtils()
          .printData('${parsedResData.data}', info: "Add Customer Res data");
      return true;
    } else {
      isAddCustomerError.value = true;
      print('Add Customer Error**');
      isAddCustomerLoading.value = false;
      return false;
    }
  }

  ///GetAllEmployeesDropdownList
  var employeesDropdownLoading = false.obs;
  var isEmployeeDropdownListError = false.obs;
  List<GetAllEmployeesResModel> employeeDropdownViewMainList = [];
  List<GetAllEmployeesResModel> employeeDropdownViewList = [];

  Future<void> getAllEmployeeDropdownList() async {
    employeesDropdownLoading.value = true;
    isEmployeeDropdownListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      employeeDropdownViewMainList.clear();
      employeeDropdownViewList.clear();
      final parsedResData = await POSService().getAllEmployeesRes();
      if (parsedResData.error != true) {
        if (parsedResData.data.allEmployeesView != null &&
            parsedResData.data.allEmployeesView.isNotEmpty) {
          for (var element in parsedResData.data.allEmployeesView) {
            employeeDropdownViewMainList.add(GetAllEmployeesResModel(
                id: element.id,
                empId: element.empId,
                staffName: element.staffName,
                gender: element.gender,
                fathersName: element.fathersName,
                maritialStatus: element.maritialStatus,
                contactnumber: element.contactnumber,
                bloodGroup: element.bloodGroup,
                emergencyContactNumber: element.emergencyContactNumber,
                address: element.address,
                email: element.email,
                dob: element.dob,
                country: element.country,
                state: element.state,
                imageUrl: element.imageUrl,
                username: element.username,
                password: element.password,
                hash: element.hash,
                salt: element.salt,
                department: element.department,
                designation: element.designation,
                dateOfJoin: element.dateOfJoin,
                workHour: element.workHour,
                branchId: element.branchId,
                salaryType: element.salaryType,
                monthlySalary: element.monthlySalary,
                contractPeriodFrm: element.contractPeriodFrm,
                contractPeriodTo: element.contractPeriodTo,
                status: element.status,
                acHolder: element.acHolder,
                acNo: element.acNo,
                bank: element.bank,
                bankCode: element.bankCode,
                bankLocation: element.bankLocation,
                pan: element.pan,
                documents: element.documents,
                dateOfLeaving: element.dateOfLeaving,
                qrcode: element.qrcode,
                adminId: element.adminId,
                outletLocation: element.outletLocation,
                v: element.v,
                allowBranches: element.allowBranches,
                establishment: element.establishment,
                designationName: element.designationName,
                departmentName: element.departmentName,
                branchName: element.branchName));
          }
        }
        isEmployeeDropdownListError.value = false;

        employeesDropdownLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data,
            info: "Employees Dropdown details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isEmployeeDropdownListError.value = true;

        employeesDropdownLoading.value = false;

        update();
      }
    } catch (e) {
      isEmployeeDropdownListError.value = true;

      employeesDropdownLoading.value = false;

      update();
      print('Employees Dropdown detail res data : $e');
    }
  }

  ///View Pos Order By Id - Get OrderDetails
  var isViewPosOrderByIdLoading = false.obs;
  var isViewPosOrderByIdError = false.obs;
  var cartTappedFromOngoingOrders = false.obs;
  var productOrderDate = 'Test'.obs;
  var productPaymentConfirmed = false.obs;
  var customerId =''.obs;
  var tappedCategoryItem=''.obs;
  ViewPosOrderByIdResModel viewPosOrderByIdResData = ViewPosOrderByIdResModel();
  Future<bool> viewPosOrderByIdRes(String? orderId) async {
    isViewPosOrderByIdLoading.value = true;
    final APIResponse<ViewPosOrderByIdResModel> parsedResData =
        await POSService().viewPosOrderById(orderId: orderId);
    if (parsedResData.error != true) {
     viewPosOrderByIdResData = parsedResData.data;
    isViewPosOrderByIdError.value = false;
    
    // Store the order date in the reactive variable
    productOrderDate.value = viewPosOrderByIdResData.orderDate ?? ''; 
    print('Order date stored in controller: ${productOrderDate.value}');
    
    isViewPosOrderByIdLoading.value = false;
      return true;
    } else {
      isViewPosOrderByIdError.value = true;

      isViewPosOrderByIdLoading.value = false;
      return false;
    }
  }

  ///PostOrderFromFloorPlan - Add Order after Table Selection
  var isPostOrderFromFloorPlanLoading = false.obs;
  var isAddOrderFromChDraftTapped = false.obs;
  PostOrderFromFloorPlanResModel postOrderFromFloorPlanData =
      PostOrderFromFloorPlanResModel();
  Future<bool> postOrderFromFloorPlan(
      {required int subTotal,
      required int discountAmt,
      List<Map<String, dynamic>> orderInfo = const [],
      required dynamic amtTotal,
      required dynamic totalInclusive,
      required dynamic totalExclusive,
      required String custId,
      required String orderDate,
      required String orderId,
      required dynamic aggregatorId,
      required dynamic aggregatorRef,
      required dynamic waiterId}) async {
    isPostOrderFromFloorPlanLoading.value = true;
    try {
      final parsedResData = await POSService().postOrderFromFloorPlanRes(
          orderInfo: orderInfo,
          subTotal: subTotal,
          discountAmt: discountAmt,
          amtTotal: amtTotal,
          totalInclusive: totalInclusive,
          totalExclusive: totalExclusive,
          custId: custId,
          orderDate: orderDate,
          orderId: orderId,
          aggregatorId: aggregatorId,
          aggregatorRef: aggregatorRef,
          waiterId: waiterId);
      if (parsedResData.error != true) {
        postOrderFromFloorPlanData = parsedResData.data;
        isPostOrderFromFloorPlanLoading.value = false;
         // Store the order id in the reactive variable for easy access
      productOrderId.value = postOrderFromFloorPlanData.data!.id ?? ''; // If id is null, set an empty string

      print('Add order id: ${postOrderFromFloorPlanData.data!.id}');
      print('Order ID stored in controller: ${productOrderId.value}');
        AppUtils().printData(parsedResData.data,
            info: "Add Order From Floor Plan res data");
        return true;
      } else {
        isPostOrderFromFloorPlanLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isPostOrderFromFloorPlanLoading.value = false;
      update();
      print('Add Order From Floor Plan res data : $e');
      return false;
    }
  }

  ///POS add Order - Cart Add Order Button
  var isAddOrderFromOngoingLoading = false.obs;
  AddPosOrderFromOngoingResModel posAddOrderFromOngoingData =
      AddPosOrderFromOngoingResModel();
  Future<bool> addPosOrderFromOngoing(
      {List<Map<String, dynamic>> orderInfo = const [],
      required int subTotal,
      required int discountAmt,
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
    isAddOrderFromOngoingLoading.value = true;
    try {
      final parsedResData = await POSService().addPOSOrderFromOngoingRes(
          orderInfo: orderInfo,
          subTotal: subTotal,
          discountAmt: discountAmt,
          amtTotal: amtTotal,
          totalInclusive: totalInclusive,
          totalExclusive: totalExclusive,
          password: password,
          custId: custId,
          ordId: ordId,
          ordType: ordType,
          aggregatorId: aggregatorId,
          aggregatorRef: aggregatorRef,
          waiterId: waiterId);
      if (parsedResData.error != true) {
        posAddOrderFromOngoingData = parsedResData.data;
           // Store the order id in the reactive variable for easy access
      productOrderId.value = posAddOrderFromOngoingData.data!.id ?? ''; // If id is null, set an empty string

      print('Add order id: ${posAddOrderFromOngoingData.data!.id}');
      print('Order ID stored in controller: ${productOrderId.value}');
        isAddOrderFromOngoingLoading.value = false;
        AppUtils().printData(parsedResData.data, info: "Add Order res data");
        return true;
      } else {
        isAddOrderFromOngoingLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isAddOrderFromOngoingLoading.value = false;
      update();
      print('Add Order res data : $e');
      return false;
    }
  }

//POS add Order - Cart Add Order Button
  var isAddPosOrderHoldLoading = false.obs;
  AddPosOrderHoldResModel posAddOrderHoldData = AddPosOrderHoldResModel();
  Future<bool> addPosOrderHold(
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
    isAddPosOrderHoldLoading.value = true;
    try {
      final parsedResData = await POSService().addPOSOrderHoldRes(
          orderInfo: orderInfo,
          subTotal: subTotal,
          discountAmt: discountAmt,
          amtTotal: amtTotal,
          totalInclusive: totalInclusive,
          totalExclusive: totalExclusive,
          custId: custId,
          orderDate: orderDate,
          orderId: orderId,
          ordType: ordType,
          aggregatorId: aggregatorId,
          aggregatorRef: aggregatorRef,
          waiterId: waiterId);
      if (parsedResData.error != true) {
        posAddOrderHoldData = parsedResData.data;
        isAddPosOrderHoldLoading.value = false;
        AppUtils()
            .printData(parsedResData.data, info: "Add Order Hold res data");
        return true;
      } else {
        isAddPosOrderHoldLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isAddPosOrderHoldLoading.value = false;
      update();
      print('Add Order Hold res data : $e');
      return false;
    }
  }

//Reservation List
  var isReservationListLoading = false.obs;
  var isReservationListError = false.obs;
  var isOrderReservationIsSuccess = false.obs;
  ViewReservationListResModel viewReservationListResData =
      ViewReservationListResModel();
  Future<bool> viewReservationList(dynamic index) async {
    isReservationListLoading.value = true;
    final APIResponse<ViewReservationListResModel> parsedResData =
        await POSService().viewReservationListRes(index);
    if (parsedResData.error != true) {
      viewReservationListResData = parsedResData.data;
      isReservationListError.value = false;

      isReservationListLoading.value = false;

      AppUtils().printData('${parsedResData.data}',
          info: "View Reservation List data");
      return true;
    } else {
      isReservationListError.value = true;

      isReservationListLoading.value = false;
      return false;
    }
  }

//Add Reservation
  var isAddReservationLoading = false.obs;
  var isAddReservationError = false.obs;
  AddReservationResModel viewAddReservationResData = AddReservationResModel();

  Future<bool> addReservation(
      List<String> tableIds,
      dynamic date,
      dynamic mobileNo,
      String customerId,
      String floorId,
      dynamic note,
      dynamic time,
      dynamic totalPerson) async {
    isAddReservationLoading.value = true;
    // update();
    try {
      final parsedResData = await POSService().addReservationRes(tableIds, date,
          mobileNo, customerId, floorId, note, time, totalPerson);
      if (parsedResData.error != true) {
        viewAddReservationResData = parsedResData.data;

        isAddReservationError.value = true;
        isAddReservationLoading.value = false;
        // update();

        AppUtils().printData(parsedResData.data, info: "Edit Reservation data");
        return true;
      } else {
        // AppUtils.oneTimeSnackBar('Check if the tables are already added');
        isAddReservationError.value = false;

        isAddReservationLoading.value = false;
        // update();
        return false;
      }
    } catch (e) {
      isAddReservationError.value = false;

      isAddReservationLoading.value = false;
      // update();
      print('Edit Reservation res data : $e');
      return false;
    }
  }

//Cancel reservation
  var isCancelReservationLoading = false.obs;
  var isCancelReservationError = false.obs;
  CancelReservationResModel cancelReservationResData =
      CancelReservationResModel();
  Future<bool> cancelReservation(String reservationId, String status) async {
    isCancelReservationLoading.value = true;
    final APIResponse<CancelReservationResModel> parsedResData =
        await POSService().cancelReservationRes(reservationId, status);
    if (parsedResData.error != true) {
      cancelReservationResData = parsedResData.data;
      isCancelReservationError.value = false;

      isCancelReservationLoading.value = false;

      AppUtils()
          .printData('${parsedResData.data}', info: "Cancel Reservation data");
      return true;
    } else {
      isCancelReservationError.value = true;

      isCancelReservationLoading.value = false;
      return false;
    }
  }

  ///Edit Reservation
  var isEditReservationLoading = false.obs;
  var isEditReservationError = false.obs;
  EditReservationResModel editReservationData = EditReservationResModel();
  Future<bool> editReservation(
      List<String> tableIds,
      dynamic date,
      dynamic mobileNo,
      String customerId,
      String floorId,
      dynamic note,
      dynamic time,
      dynamic totalPerson,
      dynamic reservationId) async {
    isEditReservationLoading.value = true;
    // update();
    try {
      final parsedResData = await POSService().editReservationRes(
          tableIds,
          date,
          mobileNo,
          customerId,
          floorId,
          note,
          time,
          totalPerson,
          reservationId);
      if (parsedResData.error != true) {
        editReservationData = parsedResData.data;

        isEditReservationError.value = true;
        isEditReservationLoading.value = false;
        // update();

        AppUtils().printData(parsedResData.data, info: "Edit Reservation data");
        return true;
      } else {
        // AppUtils.oneTimeSnackBar('Check if the tables are already added');
        isEditReservationError.value = false;

        isEditReservationLoading.value = false;
        // update();
        return false;
      }
    } catch (e) {
      isEditReservationError.value = false;

      isEditReservationLoading.value = false;
      // update();
      print('Edit Reservation res data : $e');
      return false;
    }
  }

//Add Order - Reservation
  var isAddOrderFromReservationLoading = false.obs;
  var isAddOrderFromReservationError = false.obs;
  PostReservationToAddOrderModel viewAddOrderFromReservationResData =
      PostReservationToAddOrderModel();

  Future<bool> addOrderFromReservation(
      dynamic currentDate, dynamic reservationId) async {
    isAddOrderFromReservationLoading.value = true;
    // update();
    try {
      final parsedResData = await POSService()
          .addReservationToPosOrder(currentDate, reservationId);
      if (parsedResData.error != true) {
        viewAddOrderFromReservationResData = parsedResData.data;

        isAddOrderFromReservationError.value = true;
        isAddOrderFromReservationLoading.value = false;
        // update();

        AppUtils().printData(parsedResData.data,
            info: "Add Order From Reservation data");
        return true;
      } else {
        // AppUtils.oneTimeSnackBar('Check if the tables are already added');
        isAddOrderFromReservationError.value = false;

        isAddOrderFromReservationLoading.value = false;
        // update();
        return false;
      }
    } catch (e) {
      isAddOrderFromReservationError.value = false;

      isAddOrderFromReservationLoading.value = false;
      // update();
      print('Add Order From Reservation res data : $e');
      return false;
    }
  }

  ///Get All Aggregators List
  var allAggregatorsViewDetailsLoading = false.obs;
  var isAllAggregatorsListError = false.obs;
  List<AggregatorsListResModel> allAggregatorsViewMainList = [];
  List<AggregatorsListResModel> allAggregatorsViewList = [];

  Future<void> allAggregatorsList() async {
    allAggregatorsViewDetailsLoading.value = true;
    isAllAggregatorsListError.value = false;
    update();
    try {
      allAggregatorsViewMainList.clear();
      allAggregatorsViewList.clear();
      final parsedResData = await POSService().getAllAggregatorsList();
      if (parsedResData.error != true) {
        if (parsedResData.data.allAggregatorsView != null &&
            parsedResData.data.allAggregatorsView.isNotEmpty) {
          for (var element in parsedResData.data.allAggregatorsView) {
            allAggregatorsViewMainList.add(AggregatorsListResModel(
                id: element.id,
                name: element.name,
                branchId: element.branchId,
                commType: element.commType,
                amount: element.amount,
                v: element.v,
                empId: element.empId,
                isSelf: element.isSelf,
                code: element.code,
                branchName: element.branchName));
          }
        }
        isAllAggregatorsListError.value = false;

        allAggregatorsViewDetailsLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data,
            info: "All Aggregators details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isAllAggregatorsListError.value = true;

        allAggregatorsViewDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isAllAggregatorsListError.value = true;

      allAggregatorsViewDetailsLoading.value = false;

      update();
      print('All Aggregators detail res data : $e');
    }
  }

  ///Get View Pos Configuration Settings
  var isViewPosConfigurationSettingsLoading = false.obs;
  var isViewPosConfigurationSettingsError = false.obs;
  ViewPosConfigurationResModel viewPosConfigurationSettingsResData =
      ViewPosConfigurationResModel();
  Future<bool> viewPosConfigurationSettings() async {
    isViewPosConfigurationSettingsLoading.value = true;
    update();
    try {
      final parsedResData =
          await POSService().getViewPosConfigurationSettings();
      if (parsedResData.error != true) {
        viewPosConfigurationSettingsResData = parsedResData.data;

        isViewPosConfigurationSettingsError.value = true;

        isViewPosConfigurationSettingsLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data,
            info: "View pos configuration accounts data");
        return true;
      } else {
        AppUtils.oneTimeSnackBar("Oops! Something went wrong");
        isViewPosConfigurationSettingsError.value = false;

        isViewPosConfigurationSettingsLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isViewPosConfigurationSettingsError.value = false;

      isViewPosConfigurationSettingsLoading.value = false;
      update();
      print('pos configuration accounts res data : $e');
      return false;
    }
  }

  ///Fetch Payments for pos by branch - payments types
  var allPaymentForPosByBranchLoading = false.obs;
  var isPaymentForPosByBranchListError = false.obs;
  List<FetchPaymentsForPosByBranchResModel> allPaymentTypeViewMainList = [];
  List<FetchPaymentsForPosByBranchResModel> allPaymentTypeViewList = [];

  Future<void> getAllPaymentsForPOSByBranchList() async {
    allPaymentForPosByBranchLoading.value = true;
    isPaymentForPosByBranchListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      allPaymentTypeViewMainList.clear();
      allPaymentTypeViewList.clear();
      final parsedResData =
          await POSService().getAllPaymentsForPosByBranchList();
      if (parsedResData.error != true) {
        if (parsedResData.data.allPaymentsForPosView != null &&
            parsedResData.data.allPaymentsForPosView.isNotEmpty) {
          for (var element in parsedResData.data.allPaymentsForPosView) {
            allPaymentTypeViewMainList.add(FetchPaymentsForPosByBranchResModel(
                type: element.type,
                journalId: element.journalId,
                id: element.id,
                journalName: element.journalName));
          }
        }
        isPaymentForPosByBranchListError.value = false;

        allPaymentForPosByBranchLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "All payment details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isPaymentForPosByBranchListError.value = true;

        allPaymentForPosByBranchLoading.value = false;

        update();
      }
    } catch (e) {
      isPaymentForPosByBranchListError.value = true;

      allPaymentForPosByBranchLoading.value = false;

      update();
      print('All Payment detail res data : $e');
    }
  }

  ///Get All Cards List
  var allCardsLoading = false.obs;
  var isAllCardsListError = false.obs;

  List<ViewCardResModel> allCardsViewMainList = [];
  List<ViewCardResModel> allCardsViewList = [];

  Future<void> getAllCardsList() async {
    allCardsLoading.value = true;
    isAllCardsListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      allCardsViewMainList.clear();
      allCardsViewList.clear();
      final parsedResData = await POSService().getAllCardsList();
      if (parsedResData.error != true) {
        if (parsedResData.data.allCardsView != null &&
            parsedResData.data.allCardsView.isNotEmpty) {
          for (var element in parsedResData.data.allCardsView) {
            allCardsViewMainList.add(ViewCardResModel(
                id: element.id,
                cardName: element.cardName,
                commission: element.commission,
                status: element.status,
                imageUrl: element.imageUrl,
                v: element.v,
                journalId: element.journalId,
                journalName: element.journalName));
          }
        }
        isAllCardsListError.value = false;

        allCardsLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "All Cards details list");
      } else {
        // AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isAllCardsListError.value = true;

        allCardsLoading.value = false;

        update();
      }
    } catch (e) {
      isAllCardsListError.value = true;

      allCardsLoading.value = false;

      update();
      print('All Cards detail res data : $e');
    }
  }

  ///View customer wallet - payment wallet
  var isViewCustomerWalletLoading = false.obs;
  var isViewCustomerWalletError = false.obs;
  ViewCustomerWalletResModel viewCustomerWalletResData =
      ViewCustomerWalletResModel();
  Future<bool> viewCustomerWalletRes(String? custId) async {
    isViewCustomerWalletLoading.value = true;
    final APIResponse<ViewCustomerWalletResModel> parsedResData =
        await POSService().getViewCustomerWallet(custId: custId);
    if (parsedResData.error != true) {
      viewCustomerWalletResData = parsedResData.data;
      isViewCustomerWalletError.value = false;

      isViewCustomerWalletLoading.value = false;

      AppUtils().printData('${parsedResData.data}',
          info: "view Customer Wallet  Res data");
      return true;
    } else {
      isViewCustomerWalletError.value = true;

      isViewCustomerWalletLoading.value = false;
      return false;
    }
  }

  ///POS add Order - Cart Add Order Button
  var isPostPosPaymentLoading = false.obs;
  PostPosPaymentResModel posPostPaymentData = PostPosPaymentResModel();
  Future<bool> addPOSPayment({
    List<Map<String, dynamic>> paymentMethod = const [],
    dynamic ordId,
    dynamic discountAmt,
    dynamic deliveryCharge,
    dynamic pkgCharge,
    dynamic amtTotal,
    dynamic paymentDate,
    dynamic custId,
    dynamic ordDuration,
    dynamic password,
  }) async {
    isPostPosPaymentLoading.value = true;
    try {
      final parsedResData = await POSService().addPostPosPaymentRes(
          paymentMethod: paymentMethod,
          ordId: ordId,
          discountAmt: discountAmt,
          deliveryCharge: deliveryCharge,
          pkgCharge: pkgCharge,
          amtTotal: amtTotal,
          paymentDate: paymentDate,
          custId: custId,
          ordDuration: ordDuration,
          password:password);
      if (parsedResData.error != true) {
        posPostPaymentData = parsedResData.data;
        isPostPosPaymentLoading.value = false;
        productOrderId.value = '';
        AppUtils()
            .printData(parsedResData.data, info: "Add POS payment res data");
        return true;
      } else {
        isPostPosPaymentLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isPostPosPaymentLoading.value = false;
      update();
      print('Add POS Payment res data : $e');
      return false;
    }
  }


///ViewSpecialOffer - specialItems Categories
  var specialItemsPosLoading = false.obs;
  var isSpecialItemsPosError = false.obs;
  List<ViewSpecialOfferResModel> specialItemsViewMainList = [];
  List<ViewSpecialOfferResModel> specialItemsListView = [];

  Future<void> specialItemsListForPOS(String day) async {
    specialItemsPosLoading.value = true;
    isSpecialItemsPosError.value = false;
    update();
    try {
      ///Avoid duplicate items
      specialItemsViewMainList.clear();
      specialItemsListView.clear();
      final parsedResData =
          await POSService().getSpecialItems(day);
      if (parsedResData.error != true) {
        if (parsedResData.data.viewSpecialOffersPosList != null &&
            parsedResData.data.viewSpecialOffersPosList.isNotEmpty) {
          for (var element in parsedResData.data.viewSpecialOffersPosList) {
            specialItemsViewMainList.add(ViewSpecialOfferResModel(
              id: element.id,
             name: element.name,
             status: element.status,
            ));
          }
        }
        isSpecialItemsPosError.value = false;

        specialItemsPosLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "Special Items details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isSpecialItemsPosError.value = true;

        specialItemsPosLoading.value = false;

        update();
      }
    } catch (e) {
      isSpecialItemsPosError.value = true;

      specialItemsPosLoading.value = false;

      update();
      print('Special Items res data : $e');
    }
  }
}

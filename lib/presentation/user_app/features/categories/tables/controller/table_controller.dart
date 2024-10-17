// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:restaurant/core/utils/app_utils.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_designs_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/table_service.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/add_pos_order_from_floor_plan_model.dart';

class TableController extends GetxController {
  ///viewFloor
  var viewFloorDetailsLoading = false.obs;
  var isViewFloorListError = false.obs;
  List<ViewFloorResModel> viewFloorMainList = [];
  List<ViewFloorResModel> viewFloorList = [];

  Future<void> getViewFloorList() async {
    viewFloorDetailsLoading.value = true;
    isViewFloorListError.value = false;
    update();
    try {
      ///Avoid duplicate items
      viewFloorMainList.clear();
      viewFloorList.clear();
      final parsedResData = await TableService().getAllFloorRes();
      if (parsedResData.error != true) {
        if (parsedResData.data.allFloorView != null &&
            parsedResData.data.allFloorView.isNotEmpty) {
          for (var element in parsedResData.data.allFloorView) {
            viewFloorMainList.add(ViewFloorResModel(
                id: element.id,
                branchId: element.branchId,
                nameOfFloor: element.nameOfFloor,
                color: element.color,
                seatSelection: element.seatSelection,
                v: element.v));
          }
        }
        isViewFloorListError.value = false;

        viewFloorDetailsLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data,
            info: "Customer Dropdown details list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isViewFloorListError.value = true;

        viewFloorDetailsLoading.value = false;

        update();
      }
    } catch (e) {
      isViewFloorListError.value = true;

      viewFloorDetailsLoading.value = false;

      update();
      print('Customer Dropdown detail res data : $e');
    }
  }

  ///viewFloorDesignsForPos
 var isViewFloorDesignLoading = false.obs;
  var isViewFloorDesignError = false.obs;
  ViewFloorDesignForPosResModel viewFloorDesignResData = ViewFloorDesignForPosResModel();
  Future<bool> getAllFloorDesignsList(String id) async {
    isViewFloorDesignLoading.value = true;
    update();
    try {
      final parsedResData = await TableService().getAllFloorDesignsForPos(id);
      if (parsedResData.error != true) {
        viewFloorDesignResData = parsedResData.data;

        isViewFloorDesignError.value = true;

        isViewFloorDesignLoading.value = false;
        update();

        AppUtils()
            .printData(parsedResData.data, info: "View Floor Design data");
        return true;
      } else {
        AppUtils.oneTimeSnackBar("Oops! Something went wrong");
        isViewFloorDesignError.value = false;

        isViewFloorDesignLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      isViewFloorDesignError.value = false;

      isViewFloorDesignLoading.value = false;
      update();
      print('view floor design res data : $e');
      return false;
    }
  }

  ///AddOrderFromFloorPlan - Table(Add order)
  var isAddOrderFromFloorPlanLoading = false.obs;
  var isAddOrderFromPosOrderError = false.obs;
  var isOrderFromFloorPlanIsSuccess = false.obs;
  var floorPlanOrderId ='Test'.obs;
  AddPosOrderFromFloorPlanResModel addPosOrderFromFloorPlanResData =
      AddPosOrderFromFloorPlanResModel();
  Future<bool> posAddOrderFromFloorPlan(
      List<String> tableIds,
      List<String> chairIds,
      String orderDate,
      String customerId,
      String floorId) async {
    isAddOrderFromFloorPlanLoading.value = true;
    // update();
    try {
      final parsedResData = await TableService().addPosOrderFromFloorPlan(
          tableIds, chairIds, orderDate, customerId, floorId);
      if (parsedResData.error != true) {
        addPosOrderFromFloorPlanResData = parsedResData.data;

        isAddOrderFromPosOrderError.value = true;
        isAddOrderFromFloorPlanLoading.value = false;
        // update();

        AppUtils().printData(parsedResData.data,
            info: "Add Order From Floor Plan data");
        return true;
      } else {
        AppUtils.oneTimeSnackBar('Check if the tables are already added');
        isAddOrderFromPosOrderError.value = false;

        isAddOrderFromFloorPlanLoading.value = false;
        // update();
        return false;
      }
    } catch (e) {
      isAddOrderFromPosOrderError.value = false;

      isAddOrderFromFloorPlanLoading.value = false;
      // update();
      print('Add Order From Floor Plan res data : $e');
      return false;
    }
  }
}

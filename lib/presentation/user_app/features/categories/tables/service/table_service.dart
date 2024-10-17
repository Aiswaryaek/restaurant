import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_designs_for_pos_model.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/service/res_model/view_floor_model.dart';
import 'package:restaurant/presentation/user_app/features/home/service/res_model/add_pos_order_from_floor_plan_model.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../repository/api/api_helper.dart';
import '../../../../../../../repository/api/api_response.dart';
import '../../../../../../../styles/colors.dart';

class TableService {
  ///View Floor
  Future<APIResponse<AllFloorResModel>> getAllFloorRes() async {
    try {
      final APIResponse response = await APIHelper.postNoBody(
          endPoint: 'pos/viewFloor',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()));
      if (response.error == true) {
        return APIResponse(
            data: AllFloorResModel(allFloorView: []),
            error: true,
            errorMessage: '');
      } else {
        final List<dynamic> responseData = response.data as List<dynamic>;
        final dropdownList = AllFloorResModel.fromJson(responseData);
        return APIResponse(data: dropdownList, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);

      return APIResponse(
          data: AllFloorResModel(allFloorView: []),
          error: true,
          errorMessage: '');
    }
  }

  ///ViewFloorDesignForPOS - TableList
  Future<APIResponse<ViewFloorDesignForPosResModel>> getAllFloorDesignsForPos(
      String id) async {
    final body = {"id": id};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/viewFloorDesignForPos',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: ViewFloorDesignForPosResModel(),
            error: true,
            errorMessage: '');
      } else {
        final ViewFloorDesignForPosResModel resData =
            ViewFloorDesignForPosResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: ViewFloorDesignForPosResModel(), error: true, errorMessage: '');
    }
  }

  ///addPosOrderFromFloorPlan - Table(Add Order)
  Future<APIResponse<AddPosOrderFromFloorPlanResModel>>
      addPosOrderFromFloorPlan(List<String> tableIds, List<String> chairIds,
          String orderDate, String customerId, String floorId) async {
    String branchId = await AppUtils.getBranchId();
    final body = {
      "branchId": branchId,
      "tableId": tableIds,
      "chairId": chairIds,
      "orderDate": orderDate,
      "cusId": customerId,
      "subTotal": 0,
      "amtTotal": 0,
      "floorId": floorId
    };
    print('PayLoad :$body');
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: 'pos/addPosOrderFromFloorPlan',
          header:
              APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
          body: body);
      if (response.error == true) {
        return APIResponse(
            data: AddPosOrderFromFloorPlanResModel(),
            error: true,
            errorMessage: '');
      } else {
        final AddPosOrderFromFloorPlanResModel resData =
            AddPosOrderFromFloorPlanResModel.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      // AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: confirmColor);
      return APIResponse(
          data: AddPosOrderFromFloorPlanResModel(),
          error: true,
          errorMessage: '');
    }
  }
}

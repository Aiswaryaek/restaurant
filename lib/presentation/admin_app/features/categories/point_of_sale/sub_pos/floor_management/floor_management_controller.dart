import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class FloorManagementLeftMenuController extends GetxController{
  var isFloorManagementDashboardDrawer = false.obs;
  var isPasswordUpdation = false.obs;

  var floorManagementDrawerTappedItem=''.obs;
  var floorTableSelectedColor=Colors.white.obs;
  var floorTableSelectedNumber=''.obs;
}
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddEmployeeController extends GetxController {
  var isStaffAddEmployeeDrawer = false.obs;
  var addEmployeeDrawerTappedItem = 'Personal Info'.obs;
  final TextEditingController staffNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emergencyContactNumberController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var profileInfoSelectedGenderValue = 'Male'.obs;
  var profileInfoSelectedMaritalStatusValue = '01'.obs;
  var profileInfoSelectedBloodGroupValue = '01'.obs;
  var profileInfoSelectedCountryValue = '01'.obs;
  var profileInfoSelectedStateValue = '01'.obs;

  List<String> profileInfoGenderDropDownList = [
    'Male',
    'Female',
    'Transgender'
  ];
}

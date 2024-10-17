import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/custom_text_field_with_title.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class PosCategoryCreate extends StatefulWidget {
  const PosCategoryCreate({super.key});

  @override
  State<PosCategoryCreate> createState() => _PosCategoryCreateState();
}
  bool isChecked = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
    String? _selectedItem;

class _PosCategoryCreateState extends State<PosCategoryCreate> {
    final stateController = TextEditingController();
    final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(16)),
      child: Column(
        children: [
         
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Main category field
                        Expanded(
                          child:CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Main Category',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )
                     
                        ),
                        ///Name field
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                         Expanded(
                          child:
                               CustomTextFieldWithTitle(
                            controller: nameController,
                            title: 'Name',),
                        ),
                       
                      ]
                    ),
                    SizedBox(height: AppScreenUtil().screenHeight(13),),
                     ///Parent id field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Main category field
                        Expanded(
                          child: 
                       CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Parent ID',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )
                        ),
                        ///Name field
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        ///This field is used only for spacing arrangement
                         Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.transparent,),
                                  
                            
                              ),
                   
                            ],
                          ),
                        ),
                       
                      ]
                    ),
        ],
      ),
    );
  }
}

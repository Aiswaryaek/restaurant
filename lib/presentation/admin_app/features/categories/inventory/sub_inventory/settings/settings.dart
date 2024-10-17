import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/widgets/common_drop_down_with_title.dart';
import 'package:restaurant/presentation/admin_app/widgets/settings_check_box_with_label.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class ConfigurationSettings extends StatefulWidget {
  const ConfigurationSettings({super.key});

  @override
  State<ConfigurationSettings> createState() => _ConfigurationSettingsState();
}
  bool isChecked = false;
  final List<String> _dropdownItems = ['01', '02', '03'];
    String? _selectedItem;

class _ConfigurationSettingsState extends State<ConfigurationSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(16)),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text('Inventory Configuration',style: inventoryConfigurationLabelStyle,),
             SizedBox(height: AppScreenUtil().screenHeight(18),),
             ///Check box
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Container(
                color: Colors.transparent,
                width: AppScreenUtil().screenWidth(145),
                 child: Column(
                               children: [
                              const SettingsCheckBoxWithLabel(checkBoxLabel: 'Product Varient'),
                               SizedBox(height: AppScreenUtil().screenHeight(29),),
                    const     SettingsCheckBoxWithLabel(checkBoxLabel: 'Multi Warehouse'),
                           
                           
                               ],
                              ),
               ),
             Container(
                              width: AppScreenUtil().screenWidth(145),
                              color: Colors.transparent,

               child: Column(
               
                children: [
                            const   SettingsCheckBoxWithLabel(checkBoxLabel: 'Multi Location'),
                SizedBox(height: AppScreenUtil().screenHeight(29),),
               
                     const    SettingsCheckBoxWithLabel(checkBoxLabel: 'Transfer Margin'),
                           
                           
                ],
               ),
             ),
          ],)
            
            
            ],
          ),
                                         SizedBox(height: AppScreenUtil().screenHeight(29),),

           ///Income account and expanse account fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child:
                            CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Income Account',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )   
                        ),
                        SizedBox(width: AppScreenUtil().screenWidth(25)),
                        Expanded(
                          child:
     CommonDropDownWithTitle(
                      dropDownItems: _dropdownItems,
                      title: 'Expense Account',
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    )                           )
                      ],
                    ),
        ],
      ),
    );
  }
}

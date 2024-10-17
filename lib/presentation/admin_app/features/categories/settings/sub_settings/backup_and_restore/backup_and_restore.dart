// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/tabs/back_up_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/tabs/clear_data_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/backup_and_restore/tabs/restore_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/roles_and_permission_settings/tabs/designation_tab.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/roles_and_permission_settings/tabs/employe_tab.dart';

import 'package:restaurant/styles/colors.dart';
import 'package:restaurant/styles/textstyles.dart';
import 'package:restaurant/utiles/app_screen_util.dart';

class BackupAndRestore extends StatefulWidget {
  const BackupAndRestore({super.key});

  @override
  State<BackupAndRestore> createState() =>
      _BackupAndRestoreState();
}

class _BackupAndRestoreState
    extends State<BackupAndRestore> {
  String selectedTab = 'Backup';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(16)),
      child: Column(
        children: [
          SizedBox(height: AppScreenUtil().screenHeight(10),),
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
            
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(selectedTab == 'Backup' ? 10 : 0),
                bottomRight: Radius.circular(selectedTab == 'Clear Data' ? 10 : 0),
              ),
              child: Container(
                 height: AppScreenUtil().screenHeight(20),
                ///Tab underline container
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                    border: Border(
                      bottom: BorderSide(color: blackColor, width:1),
                    ),

                ),
                child: Row(
                  children: [
                    ///Backup Tab
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Backup';
                          });
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          decoration: (selectedTab == 'Backup')
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constantWhite),
                          child: Center(
                            child: Text(
                              'Backup',
                              style: (selectedTab == 'Backup')
                                  ? rolesAndPermissionSelectedTabLabelStyle
                                  : rolesAndPermissionUnSelectedTabLabelStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                
                    ///Restore Tab
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Restore';
                          });
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          decoration: (selectedTab == 'Restore')
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constantWhite),
                          child: Center(
                            child: Text(
                              'Restore',
                              style: (selectedTab == 'Restore')
                                  ? rolesAndPermissionSelectedTabLabelStyle
                                  : rolesAndPermissionUnSelectedTabLabelStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///Clear Data tab
                      Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 'Clear Data';
                          });
                        },
                        child: Container(
                          height: AppScreenUtil().screenHeight(20),
                          decoration: (selectedTab == 'Clear Data')
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constantWhite),
                          child: Center(
                            child: Text(
                              'Clear Data',
                              style: (selectedTab == 'Clear Data')
                                  ? rolesAndPermissionSelectedTabLabelStyle
                                  : rolesAndPermissionUnSelectedTabLabelStyle,
                            ),
                          ),
                        ),
                      ),
                                          )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppScreenUtil().screenHeight(23),
          ),
      
          ///Backup layout
          (selectedTab == 'Backup') ? BackupTab() :(selectedTab == 'Restore')? RestoreTab():ClearDataTab()
        ],
      ),
    );
  }
}

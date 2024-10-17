import 'package:get/get.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/company_settings/binding/company_settings_binding.dart';
import 'package:restaurant/presentation/admin_app/features/categories/settings/sub_settings/currency/binding/currency_binding.dart';
import 'package:restaurant/presentation/admin_app/features/categories/staff/sub_staff/add_employee/binding/add_employe_binding.dart';
import 'package:restaurant/presentation/admin_app/features/home/home_page.dart';
import 'package:restaurant/presentation/common/features/login/binding/login_binding.dart';
import 'package:restaurant/presentation/common/features/login/view/login_page.dart';
import 'package:restaurant/presentation/common/features/no_internet/binding/no_internet_binding.dart';
import 'package:restaurant/presentation/common/features/no_internet/view/app_network_error.dart';
import 'package:restaurant/presentation/common/features/splash_screen/binding/splash_binding.dart';
import 'package:restaurant/presentation/common/features/splash_screen/view/splash_screen.dart';
import 'package:restaurant/presentation/user_app/features/categories/dashboard/view/dash_board.dart';
import 'package:restaurant/presentation/user_app/features/categories/order_list/order_list.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/ongoing_orders/binding/ongoing_order_binding.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/controller/pos_controller.dart';
import 'package:restaurant/presentation/user_app/features/categories/pos/pos/view/pos.dart';
import 'package:restaurant/presentation/user_app/features/categories/tables/binding/table_binding.dart';
import 'package:restaurant/presentation/user_app/features/home/binding/home_binding.dart';
import 'package:restaurant/presentation/user_app/features/home/view/home_page.dart';
import 'package:restaurant/routes/route_name.dart';

import '../presentation/user_app/features/categories/pos/pos/binding/pos_Binding.dart';

RouteName _routeName = RouteName();

class Routes {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: '/', page: () => const SplashScreen(), bindings: [
      SplashBinding(),
      PosBinding(),
      CurrencyBinding(),
      LogInBinding(),
      CompanySettingsBinding(),
      AddEmployeeBindings(),
      TableBindings(),
      HomeBindings(),
      OngoingOrderBindings()
    ]),
    GetPage(
        name: _routeName.loginPage,
        page: () => const LoginPage(),
        bindings: [
          LogInBinding(),
          PosBinding(),
          HomeBindings(),
          TableBindings(),
          OngoingOrderBindings()
        ]),
    GetPage(
      name: '/AdminHomePage',
      page: () => const AdminHomePage(),
    ),
    GetPage(
      name: '/POSPage',
      page: () => const POSPage(),
    ),
    GetPage(
      name: '/OrderList',
      page: () => const OrderList(),
    ),
    GetPage(
      name: '/DashBoardPage',
      page: () => const DashBoardPage(),
    ),
    GetPage(
      name: _routeName.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
        name: '/AppNetworkErrorScreen',
        page: () => const AppNetworkErrorScreen(),
        bindings: [NoInternetBinding(), LogInBinding()]),
  ];
}

import 'package:gap/screens/addPage.dart';
import 'package:gap/screens/adminPage.dart';
import 'package:gap/screens/editPage.dart';
import 'package:gap/screens/homePage.dart';
import 'package:gap/screens/managePage.dart';
import 'package:gap/screens/searchPage.dart';
import 'package:get/get.dart';

part 'routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchPage(),
    ),
    GetPage(
      name: Routes.add,
      page: () => AddPage(),
    ),
    GetPage(
      name: Routes.manage,
      page: () => ManagePage(),
    ),
    GetPage(
      name: Routes.admin,
      page: () => AdminPage(),
    ),
    GetPage(
      name: Routes.edit,
      page: () => EditPage(),
    ),
  ];
}

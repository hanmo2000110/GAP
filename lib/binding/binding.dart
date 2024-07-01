import 'package:gap/controller/addController.dart';
import 'package:gap/controller/fileController.dart';
import 'package:gap/controller/initController.dart';
import 'package:gap/controller/manageController.dart';
import 'package:gap/controller/searchController.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchPageController());
    Get.put(AddController());
    Get.put(InitController());
    Get.put(FileController());
    Get.put(ManageController());
  }
}

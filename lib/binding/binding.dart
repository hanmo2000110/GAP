import 'package:gap/controller/SearchController.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchPageController());
    // Get.put(CourseController());
    // Get.put(UserController());
    // Get.put(RequirementController());
    // Get.put(RecommendController());
  }
}

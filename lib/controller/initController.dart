import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gap/controller/searchController.dart';
import 'package:gap/model/cellModel.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  static InitController get to => Get.find();

  Future<void> loadDonators() async {
    var names = <String>{};
    var db = FirebaseFirestore.instance;
    var datas = await db.collection('datas').get();
    for (var doc in datas.docs) {
      names.add(doc.data()['name']);
    }
    print(names);
    SearchPageController.to.names.value = names.toList();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadDonators();
  }
}

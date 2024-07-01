import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  static AddController get to => Get.find();
  var db = FirebaseFirestore.instance;
  String date = "아직 선택하지 않았습니다.";
  String name = "";
  String where = "";
  String amount = "";
  String category = "";
  String extra = "";
  RxString type = ''.obs;

  final List<String> items = [
    '수입',
    '지출',
  ];

  void reset() {
    date = "아직 선택하지 않았습니다.";
    type.value = "";
  }

  Future<void> edit(String id) async {
    await db.collection('datas').doc(id).update({
      'date': date,
      'name': name,
      'where': where,
      'amount': int.parse(amount),
      // 'amount': amount,
      'category': category,
      'extra': extra,
      'type': type.value,
    });
  }

  Future<void> add() async {
    db.collection("datas").add({
      'date': date,
      'name': name,
      'where': where,
      'amount': int.parse(amount),
      // 'amount': amount,
      'category': category,
      'extra': extra,
      'type': type.value,
    });
  }

  void setField(field, value) {
    if (field == 'date') date = value;
    if (field == 'name') name = value;
    if (field == 'category') category = value;
    if (field == 'amount') amount = value;
    if (field == 'extra') extra = value;
    if (field == 'where') where = value;
  }
}

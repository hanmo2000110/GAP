import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gap/model/cellModel.dart';
import 'package:get/get.dart';

class ManageController extends GetxController {
  static ManageController get to => Get.find();
  List<CellModel> cellList = [];
  RxBool searchResult = false.obs;
  String startDate = "미선택";
  String lastDate = "미선택";
  FirebaseFirestore db = FirebaseFirestore.instance;
  RxInt income = 0.obs;
  RxInt outcome = 0.obs;
  RxList<String> names = <String>[].obs;
  String? selectedName = "";

  final List<String> outcomeItems = [
    '교육비',
    '사회활동비및기관별총지출',
    '선교비',
    '운영관리비',
    '기타_지출',
  ];
  List<String> outcomeSelectedItems = [];

  final List<String> incomeItems = [
    '경상수입',
    '목적헌금',
    '기타',
  ];
  List<String> incomeSelectedItems = [];

  void reset() {
    selectedName = "";
    searchResult.value = false;
    startDate = "미선택";
    lastDate = "미선택";
    incomeSelectedItems = [];
    outcomeSelectedItems = [];
    income.value = 0;
    outcome.value = 0;
    cellList = [];
  }

  Future<void> search() async {
    dynamic firestore = db.collection("datas");

    if (startDate != "미선택") {
      firestore = firestore.where("date", isGreaterThanOrEqualTo: startDate);
    }

    if (lastDate != "미선택") {
      firestore = firestore.where("date", isLessThanOrEqualTo: lastDate);
    }

    if (incomeSelectedItems.isNotEmpty || outcomeSelectedItems.isNotEmpty) {
      firestore = firestore.where("category",
          whereIn: incomeSelectedItems + outcomeSelectedItems);
    }

    if (selectedName != "") {
      firestore = firestore.where("name", isEqualTo: selectedName);
    }

    var result = await firestore.get();

    var res = result.docs.toList();
    var t1 = 0;
    var t2 = 0;
    for (var doc in res) {
      cellList.add(CellModel.fromJson(doc.data()));
      if (doc.data()['type'] == "수입") t1 += doc.data()['amount'] as int;
      if (doc.data()['type'] == "지출") t2 += doc.data()['amount'] as int;
    }

    searchResult.value = true;
    income.value = t1;
    outcome.value = t2;
    cellList = [];
  }

  void setField(field, value) {
    if (field == 'startDate') startDate = value;
    if (field == 'lastDate') lastDate = value;
  }
}

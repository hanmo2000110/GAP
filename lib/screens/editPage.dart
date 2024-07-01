import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/controller/addController.dart';
import 'package:gap/widgets/donatorDropDown.dart';
import 'package:gap/widgets/textField.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _AddPageState();
}

class _AddPageState extends State<EditPage> {
  DateTime initialDay = DateTime.now();
  String day = "아직 선택되지 않았습니다";
  int mode = 0;
  var doc = Get.arguments as QueryDocumentSnapshot<Map<String, dynamic>>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(214, 139, 195, 74),
        title: const Text(
          "수입/지출 내역 추가",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "수입/지출 내역 직접 추가",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              nameTextField(
                  AddController.to, 'date', '날짜 : ${doc.data()['date']}'),
              const SizedBox(height: 10),
              Obx(() => donatorDropdown(AddController.to)),
              const SizedBox(height: 10),
              nameTextField(AddController.to, 'category',
                  '수입항 : ${doc.data()['category']}'),
              const SizedBox(height: 10),
              nameTextField(
                  AddController.to, 'where', '수입목 : ${doc.data()['where']}'),
              const SizedBox(height: 10),
              nameTextField(
                  AddController.to, 'name', '성명 : ${doc.data()['name']}'),
              const SizedBox(height: 10),
              nameTextField(
                  AddController.to, 'extra', '비고 : ${doc.data()['extra']}'),
              const SizedBox(height: 10),
              nameTextField(
                  AddController.to, 'amount', '금액 : ${doc.data()['amount']}'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await AddController.to.edit(doc.id);
                  Get.back();
                },
                child: const Text("등록"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/controller/addController.dart';
import 'package:gap/controller/fileController.dart';
import 'package:gap/widgets/donatorDropDown.dart';
import 'package:gap/widgets/textField.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateTime initialDay = DateTime.now();
  String day = "아직 선택되지 않았습니다";
  int mode = 0;

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
                  AddController.to, 'date', '마지막 날짜 : (예 : XXXX-XX-XX)'),
              const SizedBox(height: 10),
              Obx(() => donatorDropdown(AddController.to)),
              const SizedBox(height: 10),
              nameTextField(AddController.to, 'category', '수입항을 입력하세요'),
              const SizedBox(height: 10),
              nameTextField(AddController.to, 'where', '수입목을 입력하세요'),
              const SizedBox(height: 10),
              nameTextField(AddController.to, 'name', '성명을 입력하세요'),
              const SizedBox(height: 10),
              nameTextField(AddController.to, 'extra', '비고를 입력하세요'),
              const SizedBox(height: 10),
              nameTextField(AddController.to, 'amount', '금액을 입력하세요'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await AddController.to.add();
                  Get.back();
                },
                child: const Text("등록"),
              ),
              const SizedBox(height: 10),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              const Text(
                "수입/지출 내역 엑셀로 추가",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(() => donatorDropdown(AddController.to)),
              const SizedBox(height: 10),
              Obx(
                () => DropTarget(
                  onDragDone: (detail) async {
                    debugPrint('onDragDone:');
                    if (detail != null && detail.files.isNotEmpty) {
                      String fileName = detail.files.first.name;
                      Uint8List fileBytes =
                          await detail.files.first.readAsBytes();
                      debugPrint(fileName);
                      setState(() {
                        FileController.to.showFileName.value =
                            "Now File Name: $fileName";
                      });

                      FileController.to.data = utf8.decode(fileBytes);
                      /*
                        do jobs
                        */
                    }
                  },
                  onDragEntered: (detail) {
                    setState(() {
                      debugPrint('onDragEntered:');
                      FileController.to.dragging = true;
                    });
                  },
                  onDragExited: (detail) {
                    debugPrint('onDragExited:');
                    setState(() {
                      FileController.to.dragging = false;
                    });
                  },
                  child: FileController.to.makeDropZone(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  // await AddController.to.add();
                  FileController.to.fileUpload(AddController.to.type);
                  Get.back();
                },
                child: const Text("등록 (파일 선택 필수)"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/model/cellModel.dart';
import 'package:get/get.dart';

class FileController extends GetxController {
  static FileController get to => Get.find();
  // final List<File> list = [];
  String data = "";
  RxString showFileName = "".obs;
  Color uploadingColor = Colors.blue[100]!;
  Color defaultColor = Colors.grey[400]!;
  bool dragging = false;

  Future<void> fileUpload(type) async {
    await cellDataInsert(type);
  }

  Future<void> cellDataInsert(type) async {
    print("file start");
    List<List<dynamic>> csvData = await loadCSVData(data);
    for (var row in csvData) {
      print(row);

      var db = FirebaseFirestore.instance;
      var res = await db.collection("datas").add({
        'type': type.toString(),
        'date': row[0],
        'category': row[1],
        'where': row[2],
        'name': row[3],
        'amount': row[4],
        'extra': row[5],
      });
      await db.collection('datas').doc(res.id).update({'cellId': res.id});
    }
  }

  Future<List<List<dynamic>>> loadCSVData(String data) async {
    List<List<dynamic>> csvTable = CsvToListConverter().convert(data);
    return csvTable;
  }

  Container makeDropZone() {
    Color color = dragging ? uploadingColor : defaultColor;
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: color,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Drop Your ",
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                ),
              ),
              Text(
                ".csv File",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.insert_drive_file_rounded,
                color: color,
              ),
              Text(
                " Here",
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv'],
              );
              print('file picking is done');
              if (result != null && result.files.isNotEmpty) {
                String fileName = result.files.first.name;
                Uint8List fileBytes = result.files.first.bytes!;

                showFileName.value = "Now File Name: $fileName";
                data = utf8.decode(fileBytes);

                // await fileUpload();
                /*
                do jobs
                 */
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "or ",
                  style: TextStyle(
                    color: color,
                  ),
                ),
                Text(
                  "Find and Upload",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.upload_rounded,
                  color: color,
                ),
              ],
            ),
          ),
          Text(
            "(*.csv)",
            style: TextStyle(
              color: color,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            showFileName.value,
            style: TextStyle(
              color: defaultColor,
            ),
          ),
        ],
      ),
    );
  }
}

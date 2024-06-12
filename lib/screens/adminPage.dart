import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:gap/model/cellModel.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  // CSV 파일을 읽고 데이터를 반환하는 함수
  Future<List<List<dynamic>>> loadCSV(String filePath) async {
    final data = await rootBundle.loadString(filePath);
    List<List<dynamic>> csvTable = CsvToListConverter().convert(data);
    return csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(214, 139, 195, 74),
        title: const Text(
          "관리자 페이지",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                List<List<dynamic>> csvData =
                    await loadCSV('assets/outcome.csv');
                for (var row in csvData) {
                  print(row);
                  var temp = CellModel(
                      type: "지출",
                      date: row[0],
                      category: row[1],
                      where: row[2],
                      name: row[3],
                      amount: row[4],
                      extra: row[5]);
                  db.collection("datas").add(temp.toJson());
                }
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(214, 139, 195, 74),
                ),
                child: const Center(
                  child: Text(
                    "수입 지출 엑셀 업로드",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

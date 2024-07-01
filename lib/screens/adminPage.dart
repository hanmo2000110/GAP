import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:gap/controller/searchController.dart';

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
                var names = <String>{};
                db = FirebaseFirestore.instance;
                var datas = await db.collection('datas').get();
                for (var doc in datas.docs) {
                  names.add(doc.data()['name']);
                }
                print(names);
                SearchPageController.to.names.value = names.toList();
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
                    "후원자 명단 업데이트",
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

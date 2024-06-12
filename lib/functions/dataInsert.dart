import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:gap/model/cellModel.dart';

Future<List<List<dynamic>>> loadCSV(String filePath) async {
  final data = await rootBundle.loadString(filePath);
  List<List<dynamic>> csvTable = CsvToListConverter().convert(data);
  return csvTable;
}

void cellDataInsert() async {
  List<List<dynamic>> csvData = await loadCSV('assets/outcome.csv');
  for (var row in csvData) {
    print(row);
    var temp = CellModel(
        type: "수입",
        date: row[0],
        category: row[1],
        where: row[2],
        name: row[3],
        amount: row[4],
        extra: row[5]);
    // db.collection("records").add(temp.toJson());
  }
}

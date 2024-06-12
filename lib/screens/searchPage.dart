import 'package:flutter/material.dart';
import 'package:gap/controller/SearchController.dart';
import 'package:gap/widgets/incomeDropDownSelecter.dart';
import 'package:gap/widgets/outcomeDropDownSelector.dart';
import 'package:gap/widgets/textField.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DateTime initialDay = DateTime.now();
  String startDay = "아직 선택되지 않았습니다";
  String lastDay = "아직 선택되지 않았습니다";
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(214, 139, 195, 74),
        title: const Text(
          "수입 지출 검색",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: initialDay,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                  if (dateTime != null) {
                    setState(() {
                      SearchPageController.to.startDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);
                    });
                  }
                },
                child: Text('시작 날짜 : ${SearchPageController.to.startDate}'),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: initialDay,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                  if (dateTime != null) {
                    setState(() {
                      SearchPageController.to.lastDate =
                          DateFormat('yyyy-MM-dd').format(dateTime);
                    });
                  }
                },
                child: Text('마지막 날짜 : ${SearchPageController.to.lastDate}'),
              ),
              const SizedBox(height: 10),
              const IncomeDropDownSelector(),
              const SizedBox(height: 10),
              const OutcomeDropDownSelector(),
              const SizedBox(height: 10),
              nameTextField(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  SearchPageController.to.search();
                },
                child: const Text("검색"),
              ),
              const SizedBox(height: 10),
              DataTable(
                columns: [
                  DataColumn(
                      label: Container(width: 120, child: Text('시작 날짜'))),
                  DataColumn(
                      label: Container(width: 120, child: Text('마지막 날짜'))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(SearchPageController.to.startDate)),
                    DataCell(Text(SearchPageController.to.lastDate)),
                  ]),
                ],
              ),
              Obx(
                () => SearchPageController.to.searchResult.value
                    ? DataTable(
                        columns: [
                          DataColumn(
                              label: Container(width: 120, child: Text('수입'))),
                          DataColumn(
                              label: Container(width: 120, child: Text('지출'))),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                              "${f.format(SearchPageController.to.income.value)} 원",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            DataCell(Text(
                              "${f.format(SearchPageController.to.outcome.value)} 원",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ]),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

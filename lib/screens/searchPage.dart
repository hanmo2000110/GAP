import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/controller/searchController.dart';
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
              const SizedBox(height: 10),
              nameTextField(SearchPageController.to, 'startDate',
                  '시작 날짜 : (예 : XXXX-XX-XX)'),
              const SizedBox(height: 5),
              nameTextField(SearchPageController.to, 'lastDate',
                  '마지막 날짜 : (예 : XXXX-XX-XX)'),
              const SizedBox(height: 10),
              const IncomeDropDownSelector(),
              const SizedBox(height: 10),
              const OutcomeDropDownSelector(),
              const SizedBox(height: 10),
              Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      '검색할 후원자를 선택하세요',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: SearchPageController.to.names
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: SearchPageController.to.selectedName,
                    onChanged: (String? value) {
                      setState(() {
                        SearchPageController.to.selectedName = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        height: 40,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                        )),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
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

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/controller/addController.dart';
import 'package:gap/controller/manageController.dart';
import 'package:gap/controller/searchController.dart';
import 'package:gap/route/pages.dart';
import 'package:gap/widgets/donatorDropDown.dart';
import 'package:gap/widgets/incomeDropDownSelecter.dart';
import 'package:gap/widgets/outcomeDropDownSelector.dart';
import 'package:gap/widgets/textField.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  var f = NumberFormat('###,###,###,###');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(214, 139, 195, 74),
        title: const Text(
          "수입 지출 관리",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  nameTextField(SearchPageController.to, 'startDate',
                      '시작 날짜 : (예 : XXXX-XX-XX)'),
                  const SizedBox(width: 5),
                  nameTextField(SearchPageController.to, 'lastDate',
                      '마지막 날짜 : (예 : XXXX-XX-XX)'),
                  const SizedBox(width: 10),
                  const IncomeDropDownSelector(),
                  const SizedBox(width: 10),
                  const OutcomeDropDownSelector(),
                  const SizedBox(width: 10),
                  Obx(
                    () => SizedBox(
                      width: 200,
                      child: DropdownButtonHideUnderline(
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
                              padding:
                                  const EdgeInsets.only(left: 16, right: 8),
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
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await SearchPageController.to.manage();
                      } catch (err) {
                        print(err);
                      }
                    },
                    child: const Text("검색"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // SearchPageController.to.search();
                    },
                    child: const Text("도표 생성"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Obx(
                () => Container(
                  // padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Container(width: 80, child: Text('수입/지출'))),
                      DataColumn(
                          label: Container(width: 80, child: Text('날짜'))),
                      DataColumn(
                          label: Container(width: 80, child: Text('수입항'))),
                      DataColumn(
                          label: Container(width: 120, child: Text('수입목'))),
                      DataColumn(
                          label: Container(width: 120, child: Text('성명'))),
                      DataColumn(
                          label: Container(width: 120, child: Text('금액'))),
                      DataColumn(
                          label: Container(width: 120, child: Text('비고'))),
                      DataColumn(label: Container(width: 120, child: Text(''))),
                    ],
                    rows: [
                      ...SearchPageController.to.manageResult.value
                          ? SearchPageController.to.manageList
                              .map((doc) => DataRow(cells: [
                                    DataCell(Text(doc.data()['type'])),
                                    DataCell(Text(doc.data()['date'])),
                                    DataCell(Text(doc.data()['category'])),
                                    DataCell(Text(doc.data()['where'])),
                                    DataCell(Text(doc.data()['name'])),
                                    DataCell(
                                        Text(f.format(doc.data()['amount']))),
                                    DataCell(Text(doc.data()['extra'])),
                                    DataCell(Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              Get.toNamed(Routes.edit,
                                                  arguments: doc);
                                              await SearchPageController.to
                                                  .manage();
                                            },
                                            child: Text("수정")),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                            onPressed: () async {
                                              await SearchPageController.to
                                                  .delete(doc.id);
                                              SearchPageController.to.manageList
                                                  .remove(doc);
                                            },
                                            child: Text("삭제"))
                                      ],
                                    )),
                                  ]))
                              .toList()
                          : [
                              const DataRow(cells: [
                                DataCell(Text("")),
                                DataCell(Text("")),
                                DataCell(Text("")),
                                DataCell(Text("")),
                                DataCell(Text("")),
                                DataCell(Text("")),
                                DataCell(Text("")),
                                DataCell(Text("")),
                              ])
                            ],
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

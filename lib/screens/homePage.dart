import 'package:flutter/material.dart';
import 'package:gap/controller/SearchController.dart';
import 'package:gap/route/pages.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menu = ["수입/지출 검색", "수입/지출 추가", "수입/지출 관리", "개발 중"];
  List<String> routes = [
    Routes.search,
    Routes.add,
    Routes.manage,
    Routes.admin,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(214, 139, 195, 74),
          title: const Center(
              child: Text(
            "회계 관리 프로그램",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
            mainAxisSpacing: 10, //수평 Padding
            crossAxisSpacing: 10, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            // return Text(index.toString());
            return InkWell(
              onTap: () {
                // if (index < 3)
                SearchPageController.to.reset();
                Get.toNamed(routes[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(214, 139, 195, 74),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  menu[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            );
          },
        ));
  }
}

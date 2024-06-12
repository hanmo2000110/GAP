import 'package:flutter/material.dart';
import 'package:gap/controller/SearchController.dart';

SizedBox Function() nameTextField = () => SizedBox(
      width: 280,
      height: 50,
      child: TextField(
        decoration: const InputDecoration(
          labelText: '검색하려는 후원자를 입력하세요',
          hintText: '검색하려는 후원자를 입력하세요',
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          SearchPageController.to.donatorName = value;
          // print(SearchPageController.to.donatorName);
        },
      ),
    );

import 'package:flutter/material.dart';

SizedBox Function(dynamic, String, String) nameTextField =
    (controller, field, text) => SizedBox(
          width: 250,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: text,
              hintText: text,
              labelStyle: const TextStyle(color: Colors.grey),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              controller.setField(field, value);
              // print(SearchPageController.to.donatorName);
            },
          ),
        );

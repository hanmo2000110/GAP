import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

DropdownButtonHideUnderline Function(dynamic) donatorDropdown =
    (controller) => DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Text(
              '수입 지출 중 선택하시오',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            items: (controller.items as List<String>)
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
            value: controller.type.value == "" ? null : controller.type.value,
            onChanged: (String? value) {
              controller.type.value = value as String;
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
        );

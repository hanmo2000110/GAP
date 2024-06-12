import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/controller/SearchController.dart';

class OutcomeDropDownSelector extends StatefulWidget {
  const OutcomeDropDownSelector({super.key});

  @override
  State<OutcomeDropDownSelector> createState() =>
      _OutcomeDropDownSelectorState();
}

class _OutcomeDropDownSelectorState extends State<OutcomeDropDownSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          '지출 항목 : 미선택 시 전체 선택',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: SearchPageController.to.outcomeItems.map((item) {
          return DropdownMenuItem(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected =
                    SearchPageController.to.outcomeSelectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    isSelected
                        ? SearchPageController.to.outcomeSelectedItems
                            .remove(item)
                        : SearchPageController.to.outcomeSelectedItems
                            .add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (isSelected)
                          const Icon(Icons.check_box_outlined)
                        else
                          const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: SearchPageController.to.outcomeSelectedItems.isEmpty
            ? null
            : SearchPageController.to.outcomeSelectedItems.last,
        onChanged: (value) {},
        selectedItemBuilder: (context) {
          return SearchPageController.to.outcomeItems.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  SearchPageController.to.outcomeSelectedItems.join(', '),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              );
            },
          ).toList();
        },
        buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.only(left: 16, right: 8),
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
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

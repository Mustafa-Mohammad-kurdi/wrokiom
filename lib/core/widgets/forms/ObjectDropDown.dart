import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/AppColors.dart';
import '../../constants/AppTheme.dart';

class ObjectDropDown<T extends dynamic> extends StatefulWidget {
  final Icon? icon;
  final List<T>? items;
  final String? text;
  final ValueChanged<T>? onChanged;
  T? initialValue;
  double? width;

  ObjectDropDown(
      {Key? key,
      this.items,
      this.text,
      this.initialValue,
      this.onChanged,
      this.width,
      this.icon})
      : super(key: key);

  @override
  State<ObjectDropDown<T>> createState() => _ObjectDropDownState<T>();
}

class _ObjectDropDownState<T extends dynamic> extends State<ObjectDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    widget.width ??= 80.w;

    // if(!widget.type)
    // try {
    //   for (T element in widget.items!) {
    //     if (element != null) {
    //       element.label;
    //       break;
    //     }
    //   }
    // } on NoSuchMethodError {
    //   return Text('First item not include name property');
    // } on StateError {
    //   return Text('Items is empty');
    // } catch (e) {
    //   return Text(e.toString());
    // }
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Row(
          children: [
            if (widget.icon != null) widget.icon!,
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                widget.text!,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items
            ?.map((item) => DropdownMenuItem<T>(
                  value: item,
                  child: FittedBox(
                    child: Text(
                      item!.name.toString().tr(),
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodyText1,
                    ),
                  ),
                ))
            .toList(),
        value: widget.initialValue,
        onChanged: (value) {
          setState(() {
            widget.initialValue = value;
          });
          if (widget.onChanged != null) widget.onChanged!(value!);
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.blackText,
          size: 25,
        ),
        iconSize: 35,
        iconEnabledColor: AppColors.primary,
        iconDisabledColor: AppColors.white,

        // buttonWidth: widget.width,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.greySwatch[20]!, width: 1),
          color: AppColors.white,
        ),
        buttonElevation: 2,
        itemHeight: 56,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: widget.width,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}

class ObjectDropDownItem {
  final int? id;
  final String? name;

  bool operator ==(o) => o is ObjectDropDownItem && id == o.id;

  ObjectDropDownItem({this.id, this.name});
}

import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../constants/AppColors.dart';

typedef DateValueChanged(DateTime dateTime);

class RoundedDateTimeField extends StatefulWidget {
  final String? hintText;
  final Widget? icon;
  final DateValueChanged onPress;
  final DateTime initialDate;
  RoundedDateTimeField(
      {Key? key,
      this.hintText,
      this.icon,
      required this.onPress,
      required this.initialDate})
      : super(key: key);

  @override
  _RoundedDateTimeFieldState createState() => _RoundedDateTimeFieldState();
}

class _RoundedDateTimeFieldState extends State<RoundedDateTimeField> {
  late DateTime _dateTime;
  DateTime? _selectedDate;
  TextEditingController? controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialDate.toString());
    super.initState();
    setState(() {
      controller!.text = DateFormat('dd-MMMM-yyyy').format(widget.initialDate);
    });
  }

  @override
  Widget build(BuildContext context) {


    return DateTimeFormField(
      initialValue: DateTime.now().compareTo(widget.initialDate) == -1 ?DateTime.now():widget.initialDate ,
      dateFormat: DateFormat("dd-MMMM-yyyy"),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      decoration: const InputDecoration(
        // contentPadding: EdgeInsets.all(16),
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.event_note, color: AppColors.primary),
        labelText: "Birth Date",
      ),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      onDateSelected: (DateTime value) {
        controller!.text = DateFormat('dd-MMMM-yyyy').format(value);
        _selectedDate = value;
        print(value);
        widget.onPress(value);
      },
    );
//     return RoundedTextField(
//       suffixIcon: widget.icon,
//       // labelText: widget.hintText,
//       hintText: widget.hintText,
// //      initialValue: widget.initialValue,
//       readOnly: true,
//       onTap: () {
//         _pickTime();
//       },
//       controller: controller,
// //      TextEditingController(
// //          text: _selectedDate != null
// //              ? DateFormat.yMMMd().format(_selectedDate)
// //              : widget.hintText),
//     );
  }
//
//   _pickTime() async {
//     setState(() {
//       _selectedDate ??= widget.initialDate;
//     });
//     await showDialog(
//       context: context,
//       builder: (_) => Stack(
//         fit: StackFit.expand,
//         children: [
//           Material(
//             type: MaterialType.transparency,
//             child: AlertDialog(
//               content: DatePickerWidget(
//                 dateFormat: "dd-MMMM-yyyy",
//                 looping: false,
//                 // default is not looping
//                 firstDate: DateTime(1920),
//                 lastDate: DateTime.now(),
//
//                 //  lastDate: DateTime(2002, 1, 1),
// //              initialDate: DateTime.now(),// DateTime(1994),
//                 //   "dd-MMMM-yyyy",
//                 locale: DatePicker.localeFromString(AppSharedPreferences.lang),
//                 onChange: (DateTime newDate, _) {
//                   setState(() {
//                     // TODO define it in the constants to always use it
//                     controller!.text =
//                         DateFormat('dd-MMMM-yyyy').format(newDate);
//                     _selectedDate = newDate;
//                   });
//                 },
//                 pickerTheme: DateTimePickerTheme(
//                   itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
//                   dividerColor: Colors.blue,
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   child: Text("Cancel".tr()),
//                   onPressed: () {
//                     Navigation.pop();
//                   },
//                 ),
//                 TextButton(
//                   child: Text("Ok".tr()),
//                   onPressed: () {
//                     widget.onPress(_selectedDate!);
//                     print("_selectedDate");
//                     print(_selectedDate);
//                     Navigation.pop();
//                   },
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}

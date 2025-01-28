import 'package:e_wallet_app/common/common_button.dart';
import 'package:e_wallet_app/utils/database.dart';
import 'package:e_wallet_app/wallet/model/expense_model.dart';

import '../common/glassmorphic.dart';
import '../common/textinput.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AddEntryForm extends StatefulWidget {
  const AddEntryForm({super.key});

  @override
  State<AddEntryForm> createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  TextEditingController amountController = TextEditingController();
  TextEditingController date =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConst.addExpense),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlassContainer(
                child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConst.amount,
                    style: TextStyle(fontSize: 18, color: Color(0xffefefef))),
                TextInput(
                  hint: StringConst.amount,
                  keyboardType: TextInputType.number,
                  controller: amountController,
                ),
                Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.light(
                          secondary: Colors.white,
                          onPrimary: Colors.indigo,
                          onSurface: Colors.white,
                          primary: Colors.white)),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2050),
                    onDateChanged: (value) {
                      date.text = value.toString();
                    },
                  ),
                ),
                Text(StringConst.description,
                    style: TextStyle(fontSize: 18, color: Color(0xffefefef))),
                TextInput(
                  hint: StringConst.description,
                  maxLine: 5,
                  controller: description,
                ),
                CommonButton(
                    title: StringConst.save,
                    onPress: () {
                      DatabaseHelper.instance.insertExpense(ExpenseModel(
                          amount: int.parse(amountController.text),
                          date: date.text,
                          desc: description.text));
                      Navigator.pop(context);
                    })
              ],
            ))
          ],
        ),
      ),
    );
  }
}

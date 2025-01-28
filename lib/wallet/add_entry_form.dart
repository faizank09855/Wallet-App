import 'package:e_wallet_app/common/common_button.dart';
import 'package:e_wallet_app/utils/database.dart';
import 'package:e_wallet_app/wallet/bloc/wallet_bloc.dart';
import 'package:e_wallet_app/wallet/model/expense_model.dart';
import 'package:e_wallet_app/wallet/service/wallet_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/glassmorphic.dart';
import '../common/textinput.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AddEntryForm extends StatefulWidget {
  final WalletBloc bloc;
  final ExpenseModel? expenseModel;
  const AddEntryForm({super.key, this.expenseModel, required this.bloc});

  @override
  State<AddEntryForm> createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  @override
  void initState() {
    setData();
    super.initState();
  }

  setData() {
    if (widget.expenseModel != null) {
      amountController.text = widget.expenseModel!.amount.toString();
      date.text = widget.expenseModel!.date.toString();
      description.text = widget.expenseModel!.desc.toString();
    }
  }

  TextEditingController amountController = TextEditingController();
  TextEditingController date =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController description = TextEditingController();

  onSubmit() {
    final expense = ExpenseModel(
        amount: int.parse(amountController.text),
        date: date.text,
        desc: description.text,
        id: widget.expenseModel?.id);
    if (widget.expenseModel == null) {
      widget.bloc.add(AddExpense(expenseModel: expense));
    } else {
      WalletService.updateDataById(expense);
    }
    Navigator.pop(context);
  }

  final appbar = AppBar(
    title: Text(StringConst.addExpense),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  );

  Widget calendar() => Theme(
        data: ThemeData(
            colorScheme: ColorScheme.light(
                secondary: Colors.white,
                onPrimary: Colors.indigo,
                onSurface: Colors.white,
                primary: Colors.white)),
        child: CalendarDatePicker(
          initialDate: widget.expenseModel == null
              ? DateTime.now()
              : DateTime.parse(widget.expenseModel!.date!),
          firstDate: DateTime(2020),
          lastDate: DateTime(2050),
          onDateChanged: (value) {
            date.text = value.toString();
          },
        ),
      );

  Widget amount() => Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.amount,
            style: hintStyle,
          ),
          TextInput(
            hint: StringConst.amount,
            keyboardType: TextInputType.number,
            controller: amountController,
          )
        ],
      );

  final hintStyle = TextStyle(fontSize: 18, color: Color(0xffefefef));
  Widget desc() => Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.description,
            style: hintStyle,
          ),
          TextInput(
            hint: StringConst.description,
            maxLine: 5,
            controller: description,
          )
        ],
      );

  Widget submit() => CommonButton(title: StringConst.save, onPress: onSubmit);

  Widget body() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlassContainer(
                child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                amount(),
                calendar(),
                desc(),
                submit(),
              ],
            ))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: Colors.indigo,
      body: body(),
    );
  }
}

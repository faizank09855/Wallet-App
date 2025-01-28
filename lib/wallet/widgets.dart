import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/expense_model.dart';

class CommonListTile extends StatelessWidget {
  final ExpenseModel expenseModel;
  const CommonListTile({super.key, required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${expenseModel.amount}\$",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    expenseModel.desc!,
                    style: TextStyle(
                      color: Color(0xff3d3d3d),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateFormat('dd MMM, yyyy')
                        .format(DateTime.parse(expenseModel.date!)),
                    style: TextStyle(fontSize: 12, color: Color(0xff6d6d6d)),
                  ),
                ],
              ),
              Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.indigo),
                    child: Icon(
                      size: 20,
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.indigo),
                    child: Icon(
                      size: 20,
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}

import 'package:e_wallet_app/wallet/add_entry_form.dart';
import 'package:e_wallet_app/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/expense_model.dart';
import 'service/wallet_service.dart';

class CommonListTile extends StatelessWidget {
  final WalletBloc bloc ;
  final ExpenseModel expenseModel;
  const CommonListTile({super.key, required this.expenseModel, required this.bloc});


  showDeleteDialog(context){

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Are You Sure"),
          content:
          Text("Do You Want To Delete This Payment"),
          actions: [
            TextButton(
                onPressed: () {
                  WalletService
                      .deleteDataById(expenseModel.id!);
                  Navigator.pop(context);
                },
                child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"))
          ],
        ));
  }

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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: Text(
                      expenseModel.desc!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff3d3d3d),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEntryForm(
                                    expenseModel: expenseModel, bloc: bloc!,
                                  )));
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.indigo),
                      child: Icon(
                        size: 20,
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDeleteDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.indigo),
                      child: Icon(
                        size: 20,
                        Icons.delete,
                        color: Colors.white,
                      ),
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



class CommonPopupMenu extends StatelessWidget {
  final Function(dynamic) onSelect;
  const CommonPopupMenu({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10)),
      child: PopupMenuButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Filter",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: FilterEnum.dateACS,
              child: Text("Date Ascending"),
            ),
            PopupMenuItem(
                value: FilterEnum.dateDECS,
                child: Text("Date Descending")),
            PopupMenuItem(
              value: FilterEnum.amountACS,
              child: Text("Amount Ascending"),
            ),
            PopupMenuItem(
              value: FilterEnum.amountDECS,
              child: Text("Amount Descending"),
            ),
          ];
        },
        onSelected: onSelect,
      ),
    );
  }
}


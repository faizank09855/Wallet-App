import 'package:e_wallet_app/utils/database.dart';
import 'package:e_wallet_app/wallet/add_entry_form.dart';
import 'package:e_wallet_app/wallet/model/expense_model.dart';
import 'package:e_wallet_app/wallet/widgets.dart';
import 'package:flutter/material.dart';

class WalletList extends StatefulWidget {
  const WalletList({super.key});

  @override
  State<WalletList> createState() => _WalletListState();
}

class _WalletListState extends State<WalletList> {

  @override
  void initState() {
    getData();
    super.initState();
  }


  List<ExpenseModel> expenseModel  =[];

  getData()async{
    final response =  await DatabaseHelper.instance.getAllExpense();
    expenseModel =  response;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet List"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton( onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddEntryForm()));
      } , backgroundColor: Colors.indigo, child : Icon(Icons.add , color: Colors.white,),),
      body: RefreshIndicator(
        onRefresh: () async {
          getData();

        },
        child: ListView.builder(
          itemCount: expenseModel.length,
          itemBuilder: (context, index) {
            return CommonListTile(expenseModel: expenseModel[index]);
          },
        ),
      ),
    );
  }
}

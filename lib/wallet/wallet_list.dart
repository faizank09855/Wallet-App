import 'package:e_wallet_app/utils/constants.dart';
import 'package:e_wallet_app/wallet/add_entry_form.dart';
import 'package:e_wallet_app/wallet/model/expense_model.dart';
import 'package:e_wallet_app/wallet/service/wallet_service.dart';
import 'package:e_wallet_app/wallet/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_expense.dart';
import 'bloc/wallet_bloc.dart';

class WalletList extends StatefulWidget {
  const WalletList({super.key});

  @override
  State<WalletList> createState() => _WalletListState();
}

class _WalletListState extends State<WalletList>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<ExpenseModel> expenseModel = [];
  WalletBloc? bloc;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    bloc = BlocProvider.of<WalletBloc>(context);
    bloc!.add(GetAllWalletData());
    super.initState();
  }

  getData() async {
    final response = await WalletService.getAllExpense(FilterEnum.amountDECS);
    expenseModel = response;
    setState(() {});
  }

  navigateToEntry() => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddEntryForm(
                bloc: bloc!,
              )));

  final appBar = AppBar(
    title: Text(StringConst.walletList),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    centerTitle: true,
    actions: [SizedBox(width: 10)],
  );

  Widget floatButton() => FloatingActionButton(
        onPressed: navigateToEntry,
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      );

  Widget body() => Column(
        children: [
          TabBar(
            labelColor: Colors.indigo,
            indicatorColor: Colors.indigo,
            controller: tabController,
            tabs: [
              Tab(text: StringConst.all),
              Tab(text: StringConst.summary),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                AllExpense(bloc: bloc!),
                SummaryScreen(),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatButton(),
      body: body(),
    );
  }
}

import 'package:e_wallet_app/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/expense_model.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});
  List<ExpenseModel> expenseModel = [];
  Map<String, dynamic> monthData = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state is WalletLoaded) {
          return ListView.builder(
            itemCount: state.monthData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      spacing: 20,
                      children: [
                        Text(
                          state.monthData.keys.elementAt(index).toString(),
                          style: TextStyle(
                              color: Color(0xff3d3d3d),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "${state.monthData.values.elementAt(index)}\$",
                          style: TextStyle(
                              color: Color(0xff3d3d3d),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

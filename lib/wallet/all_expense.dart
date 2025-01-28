import 'package:e_wallet_app/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets.dart';

class AllExpense extends StatelessWidget {
  final WalletBloc bloc ;
  const AllExpense({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        CommonPopupMenu(
          onSelect: (value) {
            bloc.add(GetFilterWalletData(filterEnum: value));
          },
        ),

        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              bloc.add(GetAllWalletData());
            },
            child: BlocBuilder<WalletBloc, WalletState>(
              builder: (context, state) {
                if (state is WalletLoaded) {
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 120),
                    itemCount: state.expenseModal.length,
                    itemBuilder: (context, index) {
                      return CommonListTile(
                        expenseModel: state.expenseModal[index],
                        bloc: bloc,
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

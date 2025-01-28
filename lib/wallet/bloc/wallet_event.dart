part of 'wallet_bloc.dart';

@immutable
abstract class WalletEvent {}

class GetAllWalletData extends WalletEvent {}

class GetFilterWalletData extends WalletEvent {
  final FilterEnum filterEnum ;
  GetFilterWalletData({required this.filterEnum});
}

class AddExpense extends WalletEvent {
  final ExpenseModel expenseModel ;
  AddExpense({required this.expenseModel});

}


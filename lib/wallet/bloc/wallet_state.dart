part of 'wallet_bloc.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {
}
class WalletLoading extends WalletState {
}
class WalletLoaded extends WalletState {
 final List<ExpenseModel> expenseModal ;
 final Map<String , dynamic> monthData ;

  WalletLoaded({required this.expenseModal , required this.monthData, });


}
class WalletError extends WalletState {
  final String error ;
  WalletError({required this.error});
}

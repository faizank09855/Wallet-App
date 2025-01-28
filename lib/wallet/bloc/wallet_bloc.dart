
import 'package:bloc/bloc.dart';
import 'package:e_wallet_app/wallet/service/wallet_service.dart';
import 'package:meta/meta.dart';
import '../model/expense_model.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    Map<String, dynamic>? monthData ;
    on<GetAllWalletData>((event, emit) async {
      emit(WalletLoading());
      try {
        final allExpense =
            await WalletService.getAllExpense(FilterEnum.dateACS);
         monthData = await WalletService.getMonthlyData();
        emit(WalletLoaded(expenseModal: allExpense, monthData: monthData!));
      } catch (e) {
        WalletError(error: e.toString());
      }
    });

    on<GetFilterWalletData>((event, emit) async {
      emit(WalletLoading());
      try {
        final allExpense =
        await WalletService.getAllExpense(event.filterEnum);
        emit(WalletLoaded(expenseModal: allExpense, monthData: monthData!));
      } catch (e) {
        WalletError(error: e.toString());
      }
    });

    on<AddExpense>((event, emit) async {
      emit(WalletLoading());
      try {
        final insertResponse =
        await WalletService.insertExpense(event.expenseModel);
        final allExpense =
        await WalletService.getAllExpense(FilterEnum.dateACS);
        monthData = await WalletService.getMonthlyData();
        emit(WalletLoaded(expenseModal: allExpense, monthData: monthData!));
      } catch (e) {
        WalletError(error: e.toString());
      }
    });
  }
}

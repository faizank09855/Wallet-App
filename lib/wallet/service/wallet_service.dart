import 'package:e_wallet_app/utils/database.dart';
import 'package:intl/intl.dart';
import '../model/expense_model.dart';

class WalletService {

  static String orderFilter(FilterEnum filter) {
    switch (filter) {
      case FilterEnum.dateACS:
        return 'date ASC';
      case FilterEnum.dateDECS:
        return 'date DESC';
      case FilterEnum.amountACS:
        return 'amount ASC';
      case FilterEnum.amountDECS:
        return 'amount DESC';
      default:
        return 'date DESC';
    }
  }

  static Future<List<ExpenseModel>> getAllExpense(FilterEnum filter) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('expense', orderBy: orderFilter(filter));
    return result.map((map) => ExpenseModel.fromMap(map)).toList();
  }

  static Future<int> deleteDataById(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(
      'expense',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> updateDataById(ExpenseModel expenseModel) async {
    final db = await DatabaseHelper.instance.database;

    return await db.update(
      'expense',
      {
        'amount': expenseModel.amount,
        "desc": expenseModel.desc,
        "date": expenseModel.date
      },
      where: 'id = ?',
      whereArgs: [expenseModel.id],
    );
  }

  static Future<int> insertExpense(ExpenseModel expenseModel) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('expense', expenseModel.toMapAdd());
  }

  static Future<Map<String, dynamic>> getMonthlyData() async {
    final db = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> allData = await db.query('expense');

    Map<String, dynamic> groupedData = {};
    for (var row in allData) {
      String date = row['date'];
      DateTime parsedDate = DateTime.parse(date);
      String yearMonth = DateFormat("MMM").format(parsedDate);

      if (groupedData[yearMonth] == null) {
        groupedData[yearMonth] = int.parse(row["amount"].toString());
      } else {
        groupedData[yearMonth] =
            groupedData[yearMonth] + int.parse(row["amount"].toString());
      }
    }
    return groupedData;
  }


}


enum FilterEnum { dateACS, dateDECS, amountACS, amountDECS }
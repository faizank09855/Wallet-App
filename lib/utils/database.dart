import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../wallet/model/expense_model.dart';



class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ewallet.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE expense (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount INTEGER NOT NULL,
        date TEXT NOT NULL,
        desc TEXT NOT NULL
      )
    ''');
  }


  Future<List<ExpenseModel>> getAllExpense() async {
    final db = await database;
    final result = await db.query('expense');
    return result.map((map) => ExpenseModel.fromMap(map)).toList();
  }
  //
  // Future<List<ExpenseModel>> getUserImages(userId) async {
  //   final db = await database;
  //   final result = await db.query('user_images' , where: "userId = ?" , whereArgs: [userId]);
  //   return result.map((map) => ExpenseModel.fromMap(map)).toList();
  // }
  //
  Future<int> insertExpense(ExpenseModel expenseModel) async {
    final db = await database;
    return await db.insert('expense', expenseModel.toMap());
  }
  //
  // Future<int> updateUserImage(UserImage userImage) async {
  //   final db = await database;
  //   return await db.update(
  //     'user_images',
  //     userImage.toMap(),
  //     where: 'userId = ?',
  //     whereArgs: [userImage.userId],
  //   );
  // }

}

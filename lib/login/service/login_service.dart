import '../../utils/database.dart';
import '../model/users_model.dart';

class LoginService {
  static Future insertExpense(Users user) async {
    try {
      final db = await DatabaseHelper.instance.database;
      await db.insert('users', user.toMap());
      return {"status": true , "message" : "success"};
    } catch (e) {
      return {"status": false, "message": e.toString()};
    }
  }

  static Future<Map> login(email, password) async {
    final db = await DatabaseHelper.instance.database;
    try{
      final result = await db.query(
        'users',
        where: "email = ?",
        whereArgs: [email],
      );
      if (result.isNotEmpty) {
        if (password == result[0]["password"]) {
          return {"status": true, "data": result[0]};
        }
        return {
          "status": false, "message" : "Wrong password"
        };
      } else {
        return {
          "status": false,
          "message" : "No User"
        };
      }
    }catch(e){
      print(e.toString());
      return {
        "status": false, "message" : "No user found"
      };
    }
  }
}

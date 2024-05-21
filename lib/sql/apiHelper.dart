
import 'package:flayconai_v2/sql/apikey.dart';
import 'package:flayconai_v2/sql/db.dart';

class ApiDBHelper {
  static String tableName = "Apikey";
  Future<void> creatApi(HuggerModel api) async {
    var database = await DataBaseHelper.instance.database;
    await database!.insert(tableName, api.toMap());
  }

  Future<List<HuggerModel>> getApi() async {
    List<HuggerModel> users = [];
    var database = await DataBaseHelper.instance.database;

    List<Map<String, dynamic>> list =
        await database!.rawQuery("SELECT * FROM $tableName");
    for (var element in list) {
      var person = HuggerModel.fromMap(element);
      users.add(person);
    }
    return users;
  }

  // Future<void> deleteUser(int id) async {
  //   var database = await DataBaseHelper.instance.database;
  //   await database!.delete(
  //     tableName,
  //     where: "id = ?",
  //     whereArgs: [id],
  //   );
  // }

  Future<void> updateApi(int id, String? apikey, ) async {
    var database = await DataBaseHelper.instance.database;
    var pp = await database!.rawUpdate(
        'UPDATE $tableName SET apikey = ?,  WHERE id = ?',
        ['$apikey',  '$id']);
    print(pp);
  }
}

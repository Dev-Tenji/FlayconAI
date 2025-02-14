import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static const _databaseName = "app.db";
  static const _databaseVersion = 1;

  DataBaseHelper._internal();
  static final DataBaseHelper dataBaseHelper = DataBaseHelper._internal();
  static DataBaseHelper get instance => dataBaseHelper;

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE USER(id INTEGER PRIMARY KEY, apikey TEXT)",
    );
  }
}

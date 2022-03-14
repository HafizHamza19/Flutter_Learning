import 'package:flutterlearn/provider/Login.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int dbVersion = 1;
  static const String dbName = "Database";
  static const String tableName = "Records";

  static DatabaseHelper get instance => _databaseHelper;
  // make this a singleton class
  static final DatabaseHelper _databaseHelper =
      DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

// only have a single app-wide reference to the database
  static Database? _database;
  static init() async {
    if (_database != null) {
      return _database;
    } else {
      return _database = await initDatabase();
    }
  }

  static initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    return await openDatabase(path,
        version: dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    await deleteDatabase(path);
    _onCreate;
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableName (
            sqlId INTEGER PRIMARY KEY AUTOINCREMENT,
            firstname TEXT NOT NULL,
            lastname TEXT NOT NULL,
            email TEXT NOT NULL
          )
          ''');
  }

  static Future<int> insertData(List<Login> data) async {
    Database db = await DatabaseHelper.init();
    int index = -1;
    for (var element in data) {
      final row = element.toJson();
      index = await db.insert(tableName, row);
    }
    return index;
  }

  static Future<List<Login>> getdata() async {
    Database db = await DatabaseHelper.init();
    return await db
        .query(tableName)
        .then((value) => value.map((e) => Login.fromJson(e)).toList());
  }

  static Future<int> updateData(List<Login> data, int id) async {
    Database db = await DatabaseHelper.init();
    return db
        .update(tableName, data[0].toJson(), where: 'sqlId=?', whereArgs: [id]);
  }

  static Future<int> deleteRecord(int id) async {
    Database db = await DatabaseHelper.init();
    return db.delete(tableName, where: 'sqlId=?', whereArgs: [id]);
  }

  static dropTable() async {
    Database db = await DatabaseHelper.init();
    await db.execute("DROP TABLE $tableName");
    await db.execute('''
          CREATE TABLE $tableName (
            sqlId INTEGER PRIMARY KEY AUTOINCREMENT,
            firstname TEXT NOT NULL,
            lastname TEXT NOT NULL,
            email TEXT NOT NULL
          )
          ''');
  }
}

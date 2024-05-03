import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/player.dart';

Logger _logger = Logger();

class UserQL {
  Database? _database;
  static const String _tableName = 'user';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase;
    return _database!;
  }

  Future<Database> get initializeDatabase async => openDatabase(
        join(await getDatabasesPath(), '$_tableName.db'),
        onCreate: (db, version) {
          return db.execute('CREATE TABLE $_tableName'
              '('
              'id TEXT PRIMARY KEY,'
              'name TEXT,'
              'nowTime TEXT,'
              'no INTEGER'
              ')');
        },
        version: 1,
      );

  Future<List<Player>> get userList async {
    _database = await database;
    if (_database != null) {
      final List<Map<String, dynamic>> maps =
          await _database!.query(_tableName);
      if (maps.isNotEmpty) {
        return List.from(maps.map((e) => Player.fromJson(e)));
      }
      return [];
    }
    return [];
  }

  Future<Player?> player(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) return Player.fromJson(maps.first);
    return null;
  }

  Future insertUser(Map<String, dynamic> map) async {
    final Database db = await database;
    //
    return await db.insert(
      _tableName,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete() async =>
      deleteDatabase(join(await getDatabasesPath(), '$_tableName.db'));

  // void insertR(iJson) {}
/*  Future insertR(Map<String, dynamic> map) => _database!.insert(
    _tableName,
    map,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );*/
}

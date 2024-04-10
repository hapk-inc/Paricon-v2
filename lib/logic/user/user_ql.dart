import 'package:logger/logger.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../../model/player.dart';

Logger _logger = Logger();

class UserQL {
  Database? _database;
  static const String _tableName = 'user';

  Future<Database> get database async {
    if (_database != null) {
      _logger.i("Database Exist");
      return _database!;
    }

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
              'tag INTEGER'
              ')');
        },
        version: 1,
      );

  Future<Player?> player(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      _logger.d("$maps");
      return Player.fromJson(maps.first);
    }
    return null;
  }

  Future insertUser(Map<String, dynamic> map) async {
    final Database db = await database;
    _logger.i("$map");
    await db.insert(
      _tableName,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete() async =>
      deleteDatabase(join(await getDatabasesPath(), '$_tableName.db'));

/*
  Future updateUser(String id, Player user) async {
    final Database db = await database;
    await db.update(
      _tableName,
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.numId],
    );
  }
*/

// Add more methods for other CRUD operations as needed
}

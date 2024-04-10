import 'package:logger/logger.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../../model/user_record.dart';

Logger _logger = Logger();

class LeaderBoardQL {
  Database? _database;
  static const String _tableName = 'leaderboard';

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
              'lastPlayed TEXT,'
              'recordPlayed TEXT,'
              'timeTaken INTEGER,'
              'recordTimeTaken INTEGER,'
              'mCount INTEGER'
              ')');
        },
        version: 1,
      );

  Future<List<UserRecord>> get leaderBoard async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    if (maps.isNotEmpty) {
      return List.from(maps.map((e) => UserRecord.fromJson(e)));
    }
    return [];
  }

  Future insertRecord(Map<String, dynamic> map) async {
    _logger.i("50--Running InsertRecord");
    final Database db = await database;
    await db.insert(
      _tableName,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

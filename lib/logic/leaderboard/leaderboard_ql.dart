import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/user_record.dart';

class LeaderBoardQL {
  Database? _database;
  static const String _tableName = 'leaderboard';

  Future<List<UserRecord>> get leaderboard async {
    _database = await database;
    if (_database != null) {
      final List<Map<String, dynamic>> maps =
          await _database!.query(_tableName, orderBy: 'lastPlayed');
      if (maps.isNotEmpty) {
        return List.from(maps.map((e) => UserRecord.fromJson(e)));
      }
      return [];
    }
    return [];
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await init;
    return _database!;
  }

  Future<Database> get init async => openDatabase(
        join(await getDatabasesPath(), '$_tableName.db'),
        onCreate: (db, version) => db.execute(
          'CREATE TABLE $_tableName'
          '('
          'id TEXT PRIMARY KEY,'
          'lastPlayed TEXT,'
          'recordPlayed TEXT,'
          'timeTaken INTEGER,'
          'recordTimeTaken INTEGER,'
          'mCount INTEGER'
          ')',
        ),
        version: 1,
      );

  Future insertR(Map<String, dynamic> map) => _database!.insert(
        _tableName,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
}

/* Future<List<Player>> getAllPlayersSortedByRank() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('players', orderBy: 'rank');
    return List.generate(maps.length, (i) {
      return Player.fromMap(maps[i]);
    });
  }
*/

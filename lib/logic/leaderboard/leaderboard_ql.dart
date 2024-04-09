import 'package:logger/logger.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

Logger _logger = Logger();

class LeaderBoardQL {
  Database? _database;
  static const String _tableName = 'leaderboard';

  //String path = join(databasesPath, 'demo.db');

  Future<Database> get database async {
    _logger.i("Initialising Database");
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
              '(id TEXT PRIMARY KEY,name TEXT)');
        },
        version: 1,
      );
}

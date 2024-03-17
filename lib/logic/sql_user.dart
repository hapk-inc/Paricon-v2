import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/my_user.dart';
import '../model/user_activity.dart';

final Provider<SQUser> sqUserProvider =
    Provider<SQUser>((_) => throw UnimplementedError());

class SQUser {
  Database? _db;
  static const String _name = 'users';

  Future<void> get initSQL async {
    if (_db != null) {
      return;
    }

    _db = await openDatabase(
      join(await getDatabasesPath(), '$_name.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE $_name'
            '(id TEXT PRIMARY KEY, '
            'name TEXT, avatar TEXT'
            ')');
      },
      version: 1,
    );
  }
  //id && numid

  // Define a function that inserts dogs into the database
  Future<void> insert(String id, UserActivity userActivity) async =>
      await _db?.insert(
        _name,
        {
          'name': userActivity.name,
          'id': id,
          if (userActivity.avatar != null) 'avatar': userActivity.avatar
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

  Future<List<MyUser>> get recentUser async {
    final List<Map<String, Object?>> maps = await _db?.query(_name) ?? [];
    return [
      for (final {'id': id as int, 'name': name as String} in maps)
        MyUser(name: name, id: id)
    ];
  }
}

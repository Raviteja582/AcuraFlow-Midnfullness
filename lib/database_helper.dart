import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'affirmation_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('affirmations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE affirmations (
      id INTEGER PRIMARY KEY,
      text TEXT
    )
    ''');
    await db.execute('''
    CREATE TABLE app_data (
      key TEXT PRIMARY KEY,
      value INTEGER
    )
    ''');

    final affirmations = [
      'You are capable of achieving your goals.',
      'Every day is a new opportunity to grow.',
      'Embrace positivity and reject negativity.',
      'Everyday is a new beginning.',
      'Be grateful for today.',
      'Challenges help us grow.',
      'Believe in yourself and your abilities.',
      'Today is filled with endless opportunities.',
      'Be peaceful, calm, and centered.',
      'Attract success and prosperity.'
    ];

    for (var i = 0; i < affirmations.length; i++) {
      await db.insert('affirmations', {'id': i, 'text': affirmations[i]});
    }
  }

  Future<Affirmation?> getAffirmation(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'affirmations',
      columns: ['id', 'text'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Affirmation.fromMap(maps.first);
    }
    return null;
  }

  Future<int?> getLastShownAffirmationId() async {
    final db = await instance.database;
    final result = await db.query('app_data', where: 'key = ?', whereArgs: ['last_shown_id']);
    if (result.isNotEmpty) {
      return result.first['value'] as int;
    }
    return null;
  }

  Future<void> setLastShownAffirmationId(int id) async {
    final db = await instance.database;
    await db.insert(
      'app_data',
      {'key': 'last_shown_id', 'value': id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';

class DBHelper {
  static Database? _database;

  // 获取数据库路径并打开
  static Future<Database> get database async {
    _database ??= await openLocalDatabase(); // 用自定义的函数打开数据库
    return _database!;
  }

  // 获取当天健康数据
  static Future<Map<String, dynamic>?> getTodayHealthData(int userId) async {
    final db = await database;
    String today = DateTime.now().toIso8601String().substring(
      0,
      10,
    ); // yyyy-MM-dd

    final result = await db.query(
      'healthdata',
      where: 'userid = ? AND date = ?',
      whereArgs: [userId, today],
    );

    if (result.isNotEmpty) return result.first;
    return null;
  }

  // 插入或更新今日数据
  static Future<void> insertOrUpdateToday(
    int userId, {
    required double currentWeight,
    required double iniWeight,
    required double goalWeight,
    int water = 0,
    int step = 0,
    int cal = 0,
    double time = 0,
  }) async {
    final db = await database;
    String today = DateTime.now().toIso8601String().substring(0, 10);

    final existing = await db.query(
      'healthdata',
      where: 'userid = ? AND date = ?',
      whereArgs: [userId, today],
    );

    if (existing.isNotEmpty) {
      // update
      await db.update(
        'healthdata',
        {
          'currentWeight': currentWeight,
          'iniWeight': iniWeight,
          'goalweight': goalWeight,
          'water': water,
          'step': step,
          'cal': cal,
          'exerciseTime': time,
        },
        where: 'userid = ? AND date = ?',
        whereArgs: [userId, today],
      );
    } else {
      // insert
      await db.insert('healthdata', {
        'userid': userId,
        'date': today,
        'currentWeight': currentWeight,
        'iniWeight': iniWeight,
        'goalweight': goalWeight,
        'water': water,
        'step': step,
        'cal': cal,
        'exerciseTime': time,
      });
    }
  }

  // 单独更新饮水量
  static Future<void> updateWater(int userId, int newWater) async {
    final db = await database;
    String today = DateTime.now().toIso8601String().substring(0, 10);

    await db.update(
      'healthdata',
      {'water': newWater},
      where: 'userid = ? AND date = ?',
      whereArgs: [userId, today],
    );
  }

  // 单独更新体重
  static Future<void> updateWeight(
    int userId,
    double current,
    double ini,
    double goal,
  ) async {
    final db = await database;
    String today = DateTime.now().toIso8601String().substring(0, 10);

    await db.update(
      'healthdata',
      {'currentWeight': current, 'iniWeight': ini, 'goalweight': goal},
      where: 'userid = ? AND date = ?',
      whereArgs: [userId, today],
    );
  }
}

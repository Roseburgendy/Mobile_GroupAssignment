import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final Database db;
  DatabaseService(this.db);

  // 注册用户
  Future<int?> registerUser({
    required String email,
    required String passwordHash,
  }) async {
    try {
      return await db.insert(
        'users',
        {
          'username': email,             // 用 email 作为 username 存入
          'passwordHash': passwordHash,
        },
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    } catch (e) {
      print('signup fail: $e');
      return null;
    }
  }

  // 根据用户名（email）查找用户
  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    final res = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );
    return res.isNotEmpty ? res.first : null;
  }

  // 登录验证
  Future<bool> validateLogin(String username, String password) async {
  final user = await getUserByUsername(username);
  if (user == null) return false;
  return user['passwordHash'] == password;
}

Future<int?> getUserIdByUsername(String username) async {
  final res = await db.query(
    'users',
    where: 'username = ?',
    whereArgs: [username],
    limit: 1,
  );

  if (res.isNotEmpty) {
    return res.first['id'] as int;
  }
  return null;
}


  Future<void> insertDefaultHealthDataIfNeeded(String username) async {
  final userId = await getUserIdByUsername(username);
  if (userId == null) {
    print('未找到用户 ID，跳过健康数据初始化');
    return;
  }

  final now = DateTime.now();
  final today = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  final existing = await db.query(
    'healthdata',
    where: 'userid = ? AND date = ?',
    whereArgs: [userId, today],
    limit: 1,
  );

  if (existing.isEmpty) {
    await db.insert('healthdata', {
      'date': today,
      'userid': userId,
    });
    print('已为用户 ID $userId 创建 $today 的 healthdata');
  } else {
    print('用户 ID $userId 的健康数据已存在于 $today');
  }
}

//recent week data
Future<List<List<double>>> getWeeklyHealthData(int userId) async {
  final now = DateTime.now();
  final List<String> last7Days = List.generate(7, (i) {
    final date = now.subtract(Duration(days: 6 - i));
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  });

  final List<Map<String, dynamic>> results = await db.query(
    'healthdata',
    where: 'userid = ? AND date IN (${List.filled(7, '?').join(',')})',
    whereArgs: [userId, ...last7Days],
    orderBy: 'date ASC',
  );

  final Map<String, Map<String, dynamic>> resultMap = {
    for (var row in results) row['date']: row
  };

  List<double> calories = [];
  List<double> water = [];

  for (var date in last7Days) {
    final row = resultMap[date];
    calories.add((row?['cal'] ?? 0).toDouble());
    water.add((row?['water'] ?? 0).toDouble());
  }

  return [calories, water];
}


///test data
 Future<int> createZzqUser() async {
    final res = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: ['zzq'],
      limit: 1,
    );

    if (res.isNotEmpty) {
      print('用户 zzq 已存在，ID: ${res.first['id']}');
      return res.first['id'] as int;
    }

    final id = await db.insert('users', {
      'username': 'zzq',
      'passwordHash': 'qzz',
    });
    print('创建 zzq 用户成功，ID: $id');
    return id;
  }

  Future<void> insertSampleHealthDataForZzq(int userId) async {
    final now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      final date = now.subtract(Duration(days: 6 - i));
      final dateStr = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

      try {
        await db.insert(
          'healthdata',
          {
            'date': dateStr,
            'currentWeight': 65 + i * 0.1,
            'iniWeight': 65.0,
            'goalweight': 60.0,
            'cal': 1200 + i * 50,
            'water': 1800 - i * 50,
            'step': 3000 + i * 500,
            'exerciseTime': 30 + i * 5,
            'userid': userId,
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
        print('插入 zzq 的 $dateStr 数据成功');
      } catch (e) {
        print('插入 zzq 的 $dateStr 数据失败: $e');
      }
    }
  }




  // 打印所有用户
  Future<void> printAllUsers() async {
    final users = await db.query('users');
    if (users.isEmpty) {
      print('当前数据库中没有用户');
    } else {
      print('已注册用户列表:');
      for (final user in users) {
        final id = user['id'];
        final username = user['username'];
        print('ID: $id | Username: $username');
      }
    }
  }
}

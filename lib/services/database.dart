import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final Database db;
  DatabaseService(this.db);

  Future<int?> registerUser({
    required String email,
    required String passwordHash,
  }) async {
    try {
      return await db.insert(
        'users',
        {
          'email': email,
          'passwordHash': passwordHash,
        },
        conflictAlgorithm: ConflictAlgorithm.abort, 
      );
    } catch (e) {
      print('注册失败: \$e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final res = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );
    return res.isNotEmpty ? res.first : null;
  }

  Future<bool> validateLogin(String email, String passwordHash) async {
    final user = await getUserByEmail(email);
    if (user == null) return false;
    return user['passwordHash'] == passwordHash;
  }
}
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openLocalDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'healthapp.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      // 创建用户表（UserData）
      await db.execute('''
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  passwordHash TEXT NOT NULL,
  email TEXT,
  balance INTEGER DEFAULT 0
);
''');

      // 创建健康数据表（healthdata）
      await db.execute('''
CREATE TABLE healthdata (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date TEXT NOT NULL,
  step INTEGER DEFAULT 0,
  water INTEGER DEFAULT 0,
  time REAL DEFAULT 0,
  cal REAL DEFAULT 0,
  iniWeight REAL,
  goalWeight REAL,
  currentWeight REAL,
  userID INTEGER NOT NULL,
  FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE(userID, date)
);
''');

      // 创建宠物列表表（petList）
      await db.execute('''
CREATE TABLE petList (
  petID INTEGER PRIMARY KEY AUTOINCREMENT,
  petName TEXT NOT NULL,
  price INTEGER NOT NULL,
  availability INTEGER DEFAULT 1,
  userID INTEGER NOT NULL,
  FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE
);
''');
    },
  );
}

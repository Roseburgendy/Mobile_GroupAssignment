import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openLocalDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'healthapp.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      //用户表，里面新增了一个point值，表示当前可用点数
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT UNIQUE NOT NULL,
          passwordHash TEXT NOT NULL,
          email TEXT
          points INTEGER DEFAULT 0
        );
      ''');

      //健康数据表，新增pointsEarned值，表示当天累计获取的点数
      await db.execute('''
        CREATE TABLE healthdata (
          id INTEGER PRIMARY KEY NOT NULL,
          date TEXT NOT NULL,
          currentWeight REAL,
          iniWeight REAL,
          goalweight REAL,
          cal INTEGER DEFAULT 0,
          water INTEGER DEFAULT 0,
          step INTEGER DEFAULT 0,
          exerciseTime REAL DEFAULT 0,
          pointsEarned INTEGER DEFAULT 0, 
          userid INTEGER NOT NULL,
          FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE,
          UNIQUE(userid, date)
        );
      ''');

      // 创建宠物列表表（petList），记录用户已经购买的宠物
      await db.execute('''
        CREATE TABLE petList (
          petID INTEGER PRIMARY KEY AUTOINCREMENT,
          petName TEXT NOT NULL,
          picturePath TEXT,
          level TEXT,
          iconPath TEXT,
          price INTEGER NOT NULL,
          description TEXT,
          availability INTEGER DEFAULT 1,
          userID INTEGER NOT NULL,
          FOREIGN KEY (userID) REFERENCES users(id) ON DELETE CASCADE
        );
        ''');
    },
  );
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openLocalDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'healthapp.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT UNIQUE NOT NULL,
          passwordHash TEXT NOT NULL,
          email TEXT
        );
      ''');

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
          userid INTEGER NOT NULL,
          FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE,
          UNIQUE(userid, date)
        );
      ''');

        // petList
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

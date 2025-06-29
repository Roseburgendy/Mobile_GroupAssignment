import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:assignment1/pet_gridview_xjq.dart'; // 你刚才的模型类

class PetDatabaseHelper {
  static final PetDatabaseHelper _instance = PetDatabaseHelper._internal();
  factory PetDatabaseHelper() => _instance;
  PetDatabaseHelper._internal();

  Database? _db;


  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'healthapp.db');
    return await openDatabase(
      path);
  }


  // 获取用户的宠物列表
  Future<List<PetCardData>> getPetsByUserId(
    int userId, {
    bool onlyCollected = false,
  }) async {
    final db = await database;
    final maps = await db.query(
      'petList',
      where: 'userID = ?' + (onlyCollected ? ' AND availability = 1' : ''),
      whereArgs: [userId],
    );
    return maps.map((map) => PetCardData.fromMap(map)).toList();
  }

  Future<void> insertInitialPets(int userId) async {
    final db = await database;

    // 检查是否已经有数据（避免重复插入）
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM petList WHERE userID = ?', [
        userId,
      ]),
    );

    if (count! > 0) return; // 有就不插了

    final List<PetCardData> initialPets = [
      PetCardData(
        petID: null,
        name: 'Boba',
        picturePath: 'assets/image_xjq/Boba.png',
        level: 'Lv.2',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 6,
        description: 'Stay chill, bro',
        descriptionKey: 'petBobaDesc',
      ),
      PetCardData(
        petID: null,
        name: 'Ebi-Man',
        picturePath: 'assets/image_xjq/Ebi-Man.png',
        level: 'Lv.1',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 3,
        description: 'Never mention sashimi in front of him',
        descriptionKey: 'petEbiDesc',

      ),
      PetCardData(
        petID: null,
        name: 'DJ Oni',
        picturePath: 'assets/image_xjq/DJ Oni.png',
        level: 'Lv.1',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 3,
        description: 'Maybe he is also an idol?',
        descriptionKey: 'petDjDesc',

      ),
      PetCardData(
        petID: null,
        name: 'New Human',
        picturePath: 'assets/image_xjq/New Human.png',
        level: 'Lv.3',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 9,
        description: 'Definitely doing good on rhythm games',
          descriptionKey: 'petNewHumanDesc'
      ),
      PetCardData(
        petID: null,
        name: 'Rorrrrrr',
        picturePath: 'assets/image_xjq/Rorrrrrr.png',
        level: 'Lv.2',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 5,
        description: 'Enjoy death metal!',
        descriptionKey: 'petRorrrrrrDesc',

      ),
      PetCardData(
        petID: null,
        name: 'Ms.Becky',
        picturePath: 'assets/image_xjq/Ms.Becky.png',
        level: 'Lv.2',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 5,
        description: 'Melt into the night',
        descriptionKey: 'petMsBeckyDesc',

      ),
      PetCardData(
        petID: null,
        name: 'Gui Gui',
        picturePath: 'assets/image_xjq/Gui Gui.png',
        level: 'Lv.1',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 3,
        description: 'Solid as a rock',
        descriptionKey: 'petGuiDesc',
      ),
      PetCardData(
        petID: null,
        name: '"Im Banana"',
        picturePath: 'assets/image_xjq/Im Banana.png',
        level: 'Lv.1',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 3,
        description: 'bro really think bro is a banana',
        descriptionKey: 'petBananaDesc',

      ),
      PetCardData(
        petID: null,
        name: 'Mr.Naruhodo',
        picturePath: 'assets/image_xjq/Mr.Naruhodo.png',
        level: 'Lv.1',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 2,
        description: 'Objection!',
        descriptionKey: 'petNaruhodoDesc',
      ),
      PetCardData(
        petID: null,
        name: 'Godfather',
        picturePath: 'assets/image_xjq/Godfather.png',
        level: 'Lv.2',
        iconPath: 'assets/icons_xjq/locked_icon.svg',
        price: 5,
        description: 'You never even think to call me Godfather',
        descriptionKey: 'petGodfatherDesc',

      ),

      // 你可以继续添加更多默认宠物
    ];

    for (final pet in initialPets) {
      await db.insert('petList', {
        'petName': pet.name,
        'price': pet.price,
        'availability': 0, // 默认未拥有
        'userID': userId,
        'picturePath': pet.picturePath,
        'iconPath': pet.iconPath,
        'level': pet.level,
        'description': pet.description,
        'descriptionKey': pet.descriptionKey,
      });
    }
  }

  // 插入新宠物
  Future<int> insertPet(PetCardData pet, int userId) async {
    final db = await database;
    return await db.insert('petList', {...pet.toMap(), 'userID': userId});
  }

  // 更新宠物状态（例如购买）
  Future<int> updatePetAvailability(int petId, int newAvailability) async {
    final db = await database;
    return await db.update(
      'petList',
      {'availability': newAvailability},
      where: 'petID = ?',
      whereArgs: [petId],
    );
  }

  // 删除宠物（可选）
  Future<int> deletePet(int petId) async {
    final db = await database;
    return await db.delete('petList', where: 'petID = ?', whereArgs: [petId]);
  }
}

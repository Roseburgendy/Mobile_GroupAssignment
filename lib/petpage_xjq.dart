import 'package:flutter/material.dart';
import 'package:assignment1/pet_gridview_xjq.dart';
import 'package:assignment1/dbzzq/open_local_database.dart';
import 'package:assignment1/dbxjq/pet_database_helper.dart';

class PetPage extends StatefulWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
<<<<<<< Updated upstream
  int selectedIndex = 0; // 0 = Collected, 1 = To Collect

  late List<PetCardData> collectedPets;
  late List<PetCardData> uncollectedPets;

  @override
  void initState() {
    super.initState();
    // 数据初始化
    collectedPets =
        CollectedPetModel.getCollectedPets()
            .map(
              (pet) => PetCardData(
                name: pet.name,
                picturePath: pet.picturePath,
                level: pet.level,
                iconPath: pet.iconPath,
              ),
            )
            .toList();

    uncollectedPets =
        UncollectedPetModel.getUncollectedPet()
            .map(
              (pet) => PetCardData(
                name: pet.name,
                picturePath: pet.picturePath,
                level: pet.level,
                iconPath: pet.iconPath,
              ),
            )
            .toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet House",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
=======
  int selectedIndex = 0;
  int userPoints = 0;

  late List<PetCardData> collectedPets = [];
  late List<PetCardData> uncollectedPets = [];

  //这里需要之后再决定用户的ID，需要别的function
  final int userID = 1; // 临时固定用户 ID
  final PetDatabaseHelper dbHelper = PetDatabaseHelper();

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  //初始化插入动物数据
  Future<void> _initializeUserData() async {
    await dbHelper.insertInitialPets(userID);
    final allPets = await dbHelper.getPetsByUserId(userID);
    final db = await openLocalDatabase();

    final pointsResult = await db.query(
      'healthdata',
      where: 'userid = ?',
      whereArgs: [userID],
      orderBy: 'date DESC',
      limit: 1,
    );

    //从health表读取当前点数（实际上要在哪个表我不大清楚呃呃呃）
    final points =
        pointsResult.isNotEmpty ? (pointsResult.first['point'] ?? 0) as int : 0;

    setState(() {
      userPoints = points;
      collectedPets = allPets.where((p) => p.availability == 1).toList();
      uncollectedPets = allPets.where((p) => p.availability == 0).toList();
    });
  }

  //更新health data表里的point值
  Future<void> _updateUserPoints(int newPoints) async {
    final db = await openLocalDatabase();
    final today = DateTime.now().toIso8601String().split('T').first;

    final existing = await db.query(
      'healthdata',
      where: 'userid = ? AND date = ?',
      whereArgs: [userID, today],
    );

    if (existing.isEmpty) {
      await db.insert('healthdata', {
        'userid': userID,
        'date': today,
        'point': newPoints,
      });
    } else {
      await db.update(
        'healthdata',
        {'point': newPoints},
        where: 'userid = ? AND date = ?',
        whereArgs: [userID, today],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet House", style: Headline4Style),
>>>>>>> Stashed changes
        centerTitle: true,
      ),
      body: Column(
        children: [
<<<<<<< Updated upstream
          // 上半部分头像区域
          const SizedBox(height: 20),
          const _PetProfile(),

          // 切换按钮区域
=======
          const SizedBox(height: 20),
          _PetProfile(
            collectedCount: collectedPets.length,
            total: collectedPets.length + uncollectedPets.length,
            userPoints: userPoints,
          ),
>>>>>>> Stashed changes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSwitchButton("COLLECTED", 0),
              const SizedBox(width: 12),
              buildSwitchButton("TO COLLECT", 1),
            ],
          ),
<<<<<<< Updated upstream

          const SizedBox(height: 20),

          // 展示内容区域（用 IndexedStack）
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                PetGridView(pets: collectedPets),
                PetGridView(pets: uncollectedPets),
              ],
            ),
          ),
        ],
      ),
    );
  }

=======
          const SizedBox(height: 20),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                PetGridView(
                  pets: collectedPets,
                  userPoints: userPoints,
                  isCollected: true,
                ),
                PetGridView(
                  pets: uncollectedPets,
                  userPoints: userPoints,
                  isCollected: false,
                  onPurchase: (pet) async {
                    final updatedPet = PetCardData(
                      petID: pet.petID,
                      name: pet.name,
                      picturePath: pet.picturePath,
                      level: 'Collected',
                      iconPath: 'assets/icons_xjq/collected_icon.svg',
                      price: pet.price,
                      description: pet.description,
                      availability: 1,
                    );

                    await dbHelper.updatePetAvailability(pet.petID!, 1);
                    final newPoints = userPoints - pet.price;
                    await _updateUserPoints(newPoints);

                    setState(() {
                      collectedPets.add(updatedPet);
                      uncollectedPets.remove(pet);
                      userPoints = newPoints;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

>>>>>>> Stashed changes
  Widget buildSwitchButton(String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Container(
      decoration:
          isSelected
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
<<<<<<< Updated upstream
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
=======
                boxShadow: [AppEffectStyles.buttonShadowEffect],
>>>>>>> Stashed changes
              )
              : null,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
<<<<<<< Updated upstream
          backgroundColor: isSelected ? Colors.green : Colors.transparent,
          foregroundColor:
              isSelected ? Colors.white : const Color.fromARGB(255, 17, 55, 7),
=======
          backgroundColor:
              isSelected ? AppColors.primarySolid50 : Colors.transparent,
          foregroundColor: isSelected ? Colors.white : AppColors.primarySolid90,
>>>>>>> Stashed changes
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side:
                isSelected
<<<<<<< Updated upstream
                    ? BorderSide(color: Colors.black, width: 1)
                    : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 0, // 关闭默认阴影
        ),
        child: Text(
          label,
          style: TextStyle(
=======
                    ? const BorderSide(color: Colors.black, width: 1)
                    : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
>>>>>>> Stashed changes
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _PetProfile extends StatelessWidget {
<<<<<<< Updated upstream
  const _PetProfile();
=======
  final int collectedCount;
  final int total;
  final int userPoints;

  const _PetProfile({
    required this.collectedCount,
    required this.total,
    required this.userPoints,
  });

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
<<<<<<< Updated upstream
        //Hector image
        Center(child: Image.asset('assets/image_xjq/Hector.png', height: 150)),
        const SizedBox(height: 15),

        //Hector name
        const Text(
          'Hector',
          textAlign: TextAlign.center,
=======
        Center(child: Image.asset('assets/image_xjq/Hector.png', height: 150)),
        const SizedBox(height: 15),
        const Text(
          'Hector',
>>>>>>> Stashed changes
          style: TextStyle(
            color: Color(0xFF001428),
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
<<<<<<< Updated upstream
            height: 1.70,
          ),
        ),
        const SizedBox(height: 15),

        //Progress bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 3),
                  blurRadius: 0,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 16,
                child: LinearProgressIndicator(
                  value: 3 / 5,
                  minHeight: 16,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orangeAccent,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 13),

        // Progress text
        const Text(
          '3 / 5 collected',
          style: TextStyle(
=======
            height: 1.7,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.stars_rounded, color: Colors.amber, size: 24),
            const SizedBox(width: 8),
            Text(
              '$userPoints Points',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 44, 44, 44),
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        Text(
          '$collectedCount / $total collected',
          style: const TextStyle(
>>>>>>> Stashed changes
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color.fromARGB(255, 85, 85, 85),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

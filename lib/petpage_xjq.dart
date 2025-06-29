import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/pet_gridview_xjq.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:assignment1/dbxjq/pet_database_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PetPage extends StatefulWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  int selectedIndex = 1; // 默认显示“未收集”
  int userPoints = 0;
  int? userID;

  List<PetCardData> collectedPets = [];
  List<PetCardData> uncollectedPets = [];

  final PetDatabaseHelper dbHelper = PetDatabaseHelper();

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  Future<void> _initializeUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getInt('userID');

    if (userID == null) {
      debugPrint("未获取到 userID");
      return;
    }

    await dbHelper.insertInitialPets(userID!);
    final allPets = await dbHelper.getPetsByUserId(userID!);
    final db = await openLocalDatabase();

    final pointsResult = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userID],
      limit: 1,
    );

    final points = pointsResult.isNotEmpty ? (pointsResult.first['point'] ?? 0) as int : 0;

    setState(() {
      userPoints = points;
      collectedPets = allPets.where((p) => p.availability == 1).toList();
      uncollectedPets = allPets.where((p) => p.availability == 0).toList();
    });
  }

  Future<void> _updateUserPoints(int newPoints) async {
    final db = await openLocalDatabase();
    await db.update(
      'users',
      {'point': newPoints},
      where: 'id = ?',
      whereArgs: [userID],
    );
  }

  Widget _buildSwitchButton(String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Container(
      decoration: isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppEffectStyles.buttonShadowEffect],
      )
          : null,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primarySolid50 : Colors.transparent,
          foregroundColor: isSelected ? Colors.white : AppColors.primarySolid90,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: isSelected ? const BorderSide(color: Colors.black, width: 1) : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.petHouse, style: Headline4Style),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _PetProfile(
            collectedCount: collectedPets.length,
            total: collectedPets.length + uncollectedPets.length,
            userPoints: userPoints,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSwitchButton(AppLocalizations.of(context)!.collected, 0),
              const SizedBox(width: 12),
              _buildSwitchButton(AppLocalizations.of(context)!.toCollect, 1),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                userID == null
                    ? const Center(child: Text('Please log in to view your pets.'))
                    : PetGridView(
                  pets: collectedPets,
                  userPoints: userPoints,
                  isCollected: true,
                ),
                userID == null
                    ? const Center(child: Text('Please log in to view your pets.'))
                    : PetGridView(
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
                      description:pet.description,
                      descriptionKey: pet.descriptionKey,
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
}

class _PetProfile extends StatelessWidget {
  final int collectedCount;
  final int total;
  final int userPoints;

  const _PetProfile({
    required this.collectedCount,
    required this.total,
    required this.userPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/image_xjq/Hector.png', height: 150)),
        const SizedBox(height: 15),
        const Text(
          'Hector',
          style: TextStyle(
            color: Color(0xFF001428),
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
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
          '$collectedCount / $total ${AppLocalizations.of(context)!.collectedLabel}',
          style: const TextStyle(
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

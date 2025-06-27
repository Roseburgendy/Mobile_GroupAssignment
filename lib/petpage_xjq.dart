import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/pet_gridview_xjq.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:assignment1/dbxjq/pet_database_helper.dart';

class PetPage extends StatefulWidget
{
    const PetPage({Key? key}) : super(key: key);

    @override
    State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage>
{
    int selectedIndex = 0;
    int userPoints = 0;

    late List<PetCardData> collectedPets = [];
    late List<PetCardData> uncollectedPets = [];

    //这里需要之后再决定用户的ID，需要别的function
    final int userID = 1; // 临时固定用户 ID
    final PetDatabaseHelper dbHelper = PetDatabaseHelper();

    @override
    void initState() 
    {
        super.initState();
        _initializeUserData();
    }

    //初始化插入动物数据
    Future<void> _initializeUserData() async
    {
        await dbHelper.insertInitialPets(userID);
        final allPets = await dbHelper.getPetsByUserId(userID);
        final db = await openLocalDatabase();


        final pointsResult = await db.query(
            'users',
            where: 'userid = ?',
            whereArgs: [userID],
            orderBy: 'date DESC',
            limit: 1
        );

        //从health表读取当前点数（实际上要在哪个表我不大清楚呃呃呃）
        final points =
            pointsResult.isNotEmpty ? (pointsResult.first['point'] ?? 0) as int : 0;

        setState(()
            {
                userPoints = points;
                collectedPets = allPets.where((p) => p.availability == 1).toList();
                uncollectedPets = allPets.where((p) => p.availability == 0).toList();



            }
        );
    }

    //更新health data表里的point值
    Future<void> _updateUserPoints(int newPoints) async
    {
        final db = await openLocalDatabase();
        final today = DateTime.now().toIso8601String().split('T').first;

        final existing = await db.query(
            'users',
            where: 'userid = ? AND date = ?',
            whereArgs: [userID, today]
        );

        if (existing.isEmpty) 
        {
            await db.insert('users', 
                {
                    'userid': userID,
                    'date': today,
                    'point': newPoints
                }
            );
        }
        else 
        {
            await db.update(
                'users',
                {'point': newPoints},
                where: 'userid = ? AND date = ?',
                whereArgs: [userID, today]
            );
        }
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Pet House", style: Headline4Style),
                centerTitle: true
            ),
            body: Column(
                children: [
                    const SizedBox(height: 20),
                    _PetProfile(
                        collectedCount: collectedPets.length,
                        total: collectedPets.length + uncollectedPets.length,
                        userPoints: userPoints
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            buildSwitchButton("COLLECTED", 0),
                            const SizedBox(width: 12),
                            buildSwitchButton("TO COLLECT", 1)
                        ]
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                        child: IndexedStack(
                            index: selectedIndex,
                            children: [
                                PetGridView(
                                    pets: collectedPets,
                                    userPoints: userPoints,
                                    isCollected: true
                                ),
                                PetGridView(
                                    pets: uncollectedPets,
                                    userPoints: userPoints,
                                    isCollected: false,
                                    onPurchase: (pet) async
                                    {
                                        final updatedPet = PetCardData(
                                            petID: pet.petID,
                                            name: pet.name,
                                            picturePath: pet.picturePath,
                                            level: 'Collected',
                                            iconPath: 'assets/icons_xjq/collected_icon.svg',
                                            price: pet.price,
                                            description: pet.description,
                                            availability: 1
                                        );

                                        await dbHelper.updatePetAvailability(pet.petID!, 1);
                                        final newPoints = userPoints - pet.price;
                                        await _updateUserPoints(newPoints);

                                        setState(()
                                            {
                                                collectedPets.add(updatedPet);
                                                uncollectedPets.remove(pet);
                                                userPoints = newPoints;
                                            }
                                        );
                                    }
                                )
                            ]
                        )
                    )
                ]
            )
        );
    }

    Widget buildSwitchButton(String label, int index) 
    {
        final bool isSelected = selectedIndex == index;
        return Container(
            decoration:
            isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [AppEffectStyles.buttonShadowEffect]
                )
                : null,
            child: ElevatedButton(
                onPressed: ()
                {
                    setState(()
                        {
                            selectedIndex = index;
                        }
                    );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isSelected ? AppColors.primarySolid50 : Colors.transparent,
                    foregroundColor: isSelected ? Colors.white : AppColors.primarySolid90,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side:
                        isSelected
                            ? const BorderSide(color: Colors.black, width: 1)
                            : BorderSide.none
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    elevation: 0
                ),
                child: Text(
                    label,
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    )
                )
            )
        );
    }
}

class _PetProfile extends StatelessWidget
{
    final int collectedCount;
    final int total;
    final int userPoints;

    const _PetProfile({
        required this.collectedCount,
        required this.total,
        required this.userPoints
    });

    @override
    Widget build(BuildContext context) 
    {
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
                        height: 1.7
                    )
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
                                color: Color.fromARGB(255, 44, 44, 44)
                            )
                        )
                    ]
                ),
                const SizedBox(height: 13),
                Text(
                    '$collectedCount / $total collected',
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(255, 85, 85, 85)
                    )
                ),
                const SizedBox(height: 20)
            ]
        );
    }
}

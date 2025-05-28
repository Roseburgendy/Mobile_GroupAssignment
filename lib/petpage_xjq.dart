import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/model/petpage_xjq/pet_collected.dart';
import 'package:assignment1/model/petpage_xjq/pet_uncollected.dart';
import 'package:assignment1/pet_gridview_xjq.dart';

class PetPage extends StatefulWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
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
          style: Headline4Style,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 上半部分头像区域
          const SizedBox(height: 20),
          const _PetProfile(),

          // 切换按钮区域
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSwitchButton("COLLECTED", 0),
              const SizedBox(width: 12),
              buildSwitchButton("TO COLLECT", 1),
            ],
          ),

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

  Widget buildSwitchButton(String label, int index) {
    final bool isSelected = selectedIndex == index;
    return Container(
      decoration:
          isSelected
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              )
              : null,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.green : Colors.transparent,
          foregroundColor:
              isSelected ? Colors.white : const Color.fromARGB(255, 17, 55, 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side:
                isSelected
                    ? BorderSide(color: Colors.black, width: 1)
                    : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 0, // 关闭默认阴影
        ),
        child: Text(
          label,
          style: TextStyle(
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
  const _PetProfile();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Hector image
        Center(child: Image.asset('assets/image_xjq/Hector.png', height: 150)),
        const SizedBox(height: 15),

        //Hector name
        const Text(
          'Hector',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF001428),
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
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

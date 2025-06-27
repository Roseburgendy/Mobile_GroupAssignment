import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assignment1/dbzzq/open_local_database.dart';

class PetCardData {
  final int? petID;
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;
  final int price;
  final String description;
  final int? availability;

  PetCardData({
    this.petID,
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
    required this.price,
    required this.description,
    this.availability,
  });

  // fromMap：从数据库 Map 创建对象
  factory PetCardData.fromMap(Map<String, dynamic> map) {
    return PetCardData(
      petID: map['petID'],
      name: map['petName'],
      picturePath: map['picturePath'],
      level: map['level'],
      iconPath: map['iconPath'],
      price: map['price'],
      description: map['description'],
      availability: map['availability'],
    );
  }

  // toMap：将对象转成可存入数据库的 Map
  Map<String, dynamic> toMap() {
    return {
      'petName': name,
      'picturePath': picturePath,
      'level': level,
      'iconPath': iconPath,
      'price': price,
      'description': description,
      'availability': availability ?? 0,
    };
  }
}

class PetGridView extends StatefulWidget {
  final List<PetCardData> pets;
  final int userPoints;
  final bool isCollected;
  final void Function(PetCardData)? onPurchase;

  const PetGridView({
    Key? key,
    required this.pets,
    required this.userPoints,
    this.isCollected = false,
    this.onPurchase,
  }) : super(key: key);

  @override
  State<PetGridView> createState() => _PetGridViewState();
}

class _PetGridViewState extends State<PetGridView> {
  void showDetailDialog(PetCardData pet) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              pet.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(pet.picturePath, height: 100),
                const SizedBox(height: 10),
                Text(
                  pet.description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("关闭"),
              ),
            ],
          ),
    );
  }

  void showPurchaseDialog(PetCardData pet) {
    bool canAfford = widget.userPoints >= pet.price;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              pet.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(pet.picturePath, height: 140),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(pet.iconPath, height: 20),
                    const SizedBox(width: 10),
                    Text(pet.level, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
                Text("需要点数：${pet.price}"),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed:
                    canAfford
                        ? () {
                          widget.onPurchase?.call(pet);
                          Navigator.pop(context);
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: canAfford ? Colors.green : Colors.grey,
                ),
                child: Text(canAfford ? "购买" : "点数不足"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: widget.pets.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final pet = widget.pets[index];
        return GestureDetector(
          onTap: () {
            if (widget.isCollected) {
              showDetailDialog(pet);
            } else {
              showPurchaseDialog(pet);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(255, 226, 241, 213),
              border: Border.all(color: Colors.black, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset(2, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(pet.picturePath, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  pet.name,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(pet.iconPath, height: 22),
                    const SizedBox(width: 15),
                    Text(
                      pet.level,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

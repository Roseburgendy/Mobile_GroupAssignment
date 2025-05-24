import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetCardData {
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;

  PetCardData({
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
  });
}

class PetGridView extends StatelessWidget {
  final List<PetCardData> pets;

  const PetGridView({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: pets.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final pet = pets[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 2),
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
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(pet.iconPath, height: 14), // 控制图标大小
                  const SizedBox(width: 4), // 图标和文字之间的间距
                  Text(
                    pet.level,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

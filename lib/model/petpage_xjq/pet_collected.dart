//import 'package:flutter/material.dart';

class CollectedPetModel {
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;

  CollectedPetModel({
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
  });

  static List<CollectedPetModel> getCollectedPets() {
    List<CollectedPetModel> collectedPets = [];

    collectedPets.add(
      CollectedPetModel(
        name: "Ms.Becky",
        picturePath: "assets/image/pets/Ms.Becky.jpg",
        level: "5/5",
        iconPath: "assets/icons/petpage/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Gui Gui",
        picturePath: "assets/image/pets/Gui Gui.jpg",
        level: "3/3",
        iconPath: "assets/icons/petpage/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "\"Im Banana\"",
        picturePath: "assets/image/pets/Im Banana.jpg",
        level: "3/3",
        iconPath: "assets/icons/petpage/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Mr.Naruhodo",
        picturePath: "assets/image/pets/Mr.Naruhodo.jpg",
        level: "2/2",
        iconPath: "assets/icons/petpage/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Godfather",
        picturePath: "assets/image/pets/Godfather.jpg",
        level: "5/5",
        iconPath: "assets/icons/petpage/collect_completed.svg",
      ),
    );

    return collectedPets;
  }
}

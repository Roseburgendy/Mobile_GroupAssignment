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
        picturePath: "assets/image_xjq/Ms.Becky.jpg",
        level: "5/5",
        iconPath: "assets/icons_xjq/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Gui Gui",
        picturePath: "assets/image_xjq/Gui Gui.jpg",
        level: "3/3",
        iconPath: "assets/icons_xjq/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "\"Im Banana\"",
        picturePath: "assets/image_xjq/Im Banana.jpg",
        level: "3/3",
        iconPath: "assets/icons_xjq/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Mr.Naruhodo",
        picturePath: "assets/image_xjq/Mr.Naruhodo.jpg",
        level: "2/2",
        iconPath: "assets/icons_xjq/collect_completed.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Godfather",
        picturePath: "assets/image_xjq/Godfather.jpg",
        level: "5/5",
        iconPath: "assets/icons_xjq/collect_completed.svg",
      ),
    );

    return collectedPets;
  }
}

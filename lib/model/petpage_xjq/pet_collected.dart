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
        picturePath: "assets/image_xjq/Ms.Becky.png",
        level: "5/5",
        iconPath: "assets/icons_xjq/collected_icon.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Gui Gui",
        picturePath: "assets/image_xjq/Gui Gui.png",
        level: "3/3",
        iconPath: "assets/icons_xjq/collected_icon.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "\"Im Banana\"",
        picturePath: "assets/image_xjq/Im Banana.png",
        level: "3/3",
        iconPath: "assets/icons_xjq/collected_icon.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Mr.Naruhodo",
        picturePath: "assets/image_xjq/Mr.Naruhodo.png",
        level: "2/2",
        iconPath: "assets/icons_xjq/collected_icon.svg",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Godfather",
        picturePath: "assets/image_xjq/Godfather.png",
        level: "5/5",
        iconPath: "assets/icons_xjq/collected_icon.svg",
      ),
    );

    return collectedPets;
  }
}

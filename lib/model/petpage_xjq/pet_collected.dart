//import 'package:flutter/material.dart';

class CollectedPetModel {
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;
  final int price;
  final String description;

  CollectedPetModel({
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
    required this.price,
    required this.description,
  });

  static List<CollectedPetModel> getCollectedPets() {
    List<CollectedPetModel> collectedPets = [];

    collectedPets.add(
      CollectedPetModel(
        name: "Ms.Becky",
        picturePath: "assets/image_xjq/Ms.Becky.png",
        level: "Collected",
        iconPath: "assets/icons_xjq/collected_icon.svg",
        price: 5,
        description: "喵喵喵",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Gui Gui",
        picturePath: "assets/image_xjq/Gui Gui.png",
        level: "Collected",
        iconPath: "assets/icons_xjq/collected_icon.svg",
        price: 3,
        description: "龟龟",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "\"Im Banana\"",
        picturePath: "assets/image_xjq/Im Banana.png",
        level: "Collected",
        iconPath: "assets/icons_xjq/collected_icon.svg",
        price: 3,
        description: "走地鸡",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Mr.Naruhodo",
        picturePath: "assets/image_xjq/Mr.Naruhodo.png",
        level: "Collected",
        iconPath: "assets/icons_xjq/collected_icon.svg",
        price: 2,
        description: "一斤鸭梨",
      ),
    );

    collectedPets.add(
      CollectedPetModel(
        name: "Godfather",
        picturePath: "assets/image_xjq/Godfather.png",
        level: "Collected",
        iconPath: "assets/icons_xjq/collected_icon.svg",
        price: 5,
        description: "你甚至不愿称我一声教父",
      ),
    );

    return collectedPets;
  }
}

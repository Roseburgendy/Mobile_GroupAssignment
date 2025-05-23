//import 'package:flutter/material.dart';

class UncollectedPetModel {
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;

  UncollectedPetModel({
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
  });

  static List<UncollectedPetModel> getUncollectedPet() {
    List<UncollectedPetModel> uncollectedPet = [];

    uncollectedPet.add(
      UncollectedPetModel(
        name: "Boba",
        picturePath: "assets/image_xjq/Boba.jpg",
        level: "2/6",
        iconPath: "assets/icons_xjq/collecting.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "Ebi-Man",
        picturePath: "assets/image_xjq/Ebi-Man.jpg",
        level: "1/3",
        iconPath: "assets/icons_xjq/collecting.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "DJ Oni",
        picturePath: "assets/image_xjq/DJ Oni.jpg",
        level: "5/7",
        iconPath: "assets/icons_xjq/collecting.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "New Human",
        picturePath: "assets/image_xjq/New Human.jpg",
        level: "0/9",
        iconPath: "assets/icons_xjq/Locked.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "Rorrrrrr",
        picturePath: "assets/image_xjq/Rorrrrrr.jpg",
        level: "0/5",
        iconPath: "assets/icons_xjq/Locked.svg",
      ),
    );

    return uncollectedPet;
  }
}

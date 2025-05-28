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
        picturePath: "assets/image_xjq/Boba.png",
        level: "2/6",
        iconPath: "assets/icons_xjq/uncollected_icon.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "Ebi-Man",
        picturePath: "assets/image_xjq/Ebi-Man.png",
        level: "1/3",
        iconPath: "assets/icons_xjq/uncollected_icon.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "DJ Oni",
        picturePath: "assets/image_xjq/DJ Oni.png",
        level: "5/7",
        iconPath: "assets/icons_xjq/uncollected_icon.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "New Human",
        picturePath: "assets/image_xjq/New Human.png",
        level: "0/9",
        iconPath: "assets/icons_xjq/locked_icon.svg",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "Rorrrrrr",
        picturePath: "assets/image_xjq/Rorrrrrr.png",
        level: "0/5",
        iconPath: "assets/icons_xjq/locked_icon.svg",
      ),
    );

    return uncollectedPet;
  }
}

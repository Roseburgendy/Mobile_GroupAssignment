//import 'package:flutter/material.dart';

class UncollectedPetModel {
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;
  final int price;
  final String description;

  UncollectedPetModel({
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
    required this.price,
    required this.description,
  });

  static List<UncollectedPetModel> getUncollectedPet() {
    List<UncollectedPetModel> uncollectedPet = [];

    uncollectedPet.add(
      UncollectedPetModel(
        name: "Boba",
        picturePath: "assets/image_xjq/Boba.png",
        level: "0/6",
        iconPath: "assets/icons_xjq/locked_icon.svg",
        price: 6,
        description: "你是啥玩意来着我忘了",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "Ebi-Man",
        picturePath: "assets/image_xjq/Ebi-Man.png",
        level: "0/3",
        iconPath: "assets/icons_xjq/locked_icon.svg",
        price: 3,
        description: "其实还是，更喜欢吃甜虾",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "DJ Oni",
        picturePath: "assets/image_xjq/DJ Oni.png",
        level: "0/3",
        iconPath: "assets/icons_xjq/locked_icon.svg",
        price: 3,
        description: "和喷喷偶像是亲戚",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "New Human",
        picturePath: "assets/image_xjq/New Human.png",
        level: "0/9",
        iconPath: "assets/icons_xjq/locked_icon.svg",
        price: 9,
        description: "打音游很目害",
      ),
    );
    uncollectedPet.add(
      UncollectedPetModel(
        name: "Rorrrrrr",
        picturePath: "assets/image_xjq/Rorrrrrr.png",
        level: "0/5",
        iconPath: "assets/icons_xjq/locked_icon.svg",
        price: 5,
        description: "就你会玩核嗓啊",
      ),
    );

    return uncollectedPet;
  }
}

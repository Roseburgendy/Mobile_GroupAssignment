import 'package:assignment1/app_localizations_extension.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assignment1/dbzzq/openLocalDatabase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'box_ui.dart';

class PetCardData {
  final int? petID;
  final String name;
  final String picturePath;
  final String level;
  final String iconPath;
  final int price;
  final String description;

  final int? availability;
  final String descriptionKey;

  PetCardData({
    this.petID,
    required this.name,
    required this.picturePath,
    required this.level,
    required this.iconPath,
    required this.price,
    required this.description,
    this.availability,
    required this.descriptionKey,
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
      descriptionKey: map['descriptionKey'],
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
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Pet Detail',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => Center(child: PetDialog(pet: pet)),
      transitionBuilder: (_, animation, __, child) {
        return ScaleTransition(scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack), child: child);
      },
    );
  }

  void showPurchaseDialog(PetCardData pet) {
    bool canAfford = widget.userPoints >= pet.price;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Pet Purchase',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => Center(
        child: PetDialog(
          pet: pet,
          isPurchase: true,
          canAfford: canAfford,
          onPurchase: widget.onPurchase != null ? () => widget.onPurchase!(pet) : null,
        ),
      ),
      transitionBuilder: (_, animation, __, child) {
        return ScaleTransition(scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack), child: child);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    //这里debug一下，当前的宠物数量是不是已经传入了？
    print("PetGridView当前展示的宠物数量: ${widget.pets.length}");

    String getIconPath(PetCardData pet) {
      return (pet.availability == 1)
          ? 'assets/icons_xjq/collected_icon.svg'
          : 'assets/icons_xjq/locked_icon.svg';
    }


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
                    SvgPicture.asset(getIconPath(pet), height: 22),
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


class PetDialog extends StatelessWidget {
  final PetCardData pet;
  final bool isPurchase;
  final bool canAfford;
  final VoidCallback? onPurchase;

  const PetDialog({
    Key? key,
    required this.pet,
    this.isPurchase = false,
    this.canAfford = false,
    this.onPurchase,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Card container
          Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              color: AppColors.secondarySolid10,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(width: 2, color: Colors.black),
              boxShadow: [AppEffectStyles.itemShadowEffect],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(pet.picturePath, width: 100, height: 100),
                const SizedBox(height: 10),
                Text(pet.name, style: Headline4Style),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.getString(pet.descriptionKey),
                  textAlign: TextAlign.center,
                  style: BodyStyle,
                ),
                if (isPurchase) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(pet.iconPath, height: 20),
                      const SizedBox(width: 10),
                      Text(pet.level, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("${AppLocalizations.of(context)!.pointNeeded}: ${pet.price}", style: BodyStyle),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: canAfford
                        ? () {
                      onPurchase?.call();
                      Navigator.pop(context);
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canAfford ? Colors.green : Colors.grey,
                    ),
                    child: BoxText.Button(
                      canAfford
                          ? AppLocalizations.of(context)!.purchase
                          : AppLocalizations.of(context)!.notEnoughPoints,
                      color: canAfford ? Colors.black : Colors.grey,
                    ),
                  ),

                ],
              ],
            ),
          ),
          // Image top badge
          // Close button
          Positioned(
            top: -10,
            right: -10,
            child: BoxButton(
              style: ButtonStyleType.secondary,
              icon: const Icon(Icons.close, size: 20),
              onTap: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import '../shared/app_colors.dart';
import 'box_button.dart';

class AchievementItem extends StatelessWidget
{
    final String imagePath;
    final String text;
    final String description;

    const AchievementItem({
        Key? key,
        required this.imagePath,
        required this.text,
        required this.description
    }) : super(key: key);

    @override
    Widget build(BuildContext context)
    {
        return GestureDetector(
            onTap: ()
            {
                showDialog(
                    context: context,
                    builder: (context) => AchievementDialog(
                        imagePath: imagePath,
                        title: text,
                        description: description
                    )
                );
            },
            child: SizedBox(
                width: 135,
                height: 150,
                child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                        Positioned(
                            top: 60,
                            child: Container(
                                width: 119,
                                height: 89,
                                decoration: BoxDecoration(
                                    color: AppColors.secondarySolid50,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(width: 2, color: Colors.black),
                                    boxShadow: [AppEffectStyles.itemShadowEffect]
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: Text(
                                                '"$text"',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: OverlineStyle
                                            )
                                        )
                                    ]
                                )
                            )
                        ),
                        Positioned(
                            top: 30,
                            child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.contain
                                    )
                                )
                            )
                        )
                    ]
                )
            )
        );
    }

}
class AchievementDialog extends StatelessWidget
{
    final String imagePath;
    final String title;
    final String description;

    const AchievementDialog({
        super.key,
        required this.imagePath,
        required this.title,
        required this.description
    });

    @override
    Widget build(BuildContext context)
    {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                    // card
                    Container(
                        margin: EdgeInsets.only(top: 60),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                        decoration: BoxDecoration(
                            color: AppColors.secondarySolid50,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(width: 2, color: Colors.black),
                            boxShadow: [AppEffectStyles.itemShadowEffect]
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                SizedBox(height: 10),
                                Text("Medals", style: OverlineStyle),
                                SizedBox(height: 2),
                                Text(title, style: TitleStyle),
                                SizedBox(height: 8),
                                Text(description,
                                    textAlign: TextAlign.center,
                                    style: BodyStyle
                                )
                            ]
                        )
                    ),
                    // Medal badge
                    Positioned(
                        top: 0,
                        child: Image.asset(
                            imagePath,
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain
                        )
                    ),
                    // Close button
                    Positioned(
                        top: -10,
                        right: -10,
                        child:
                        BoxButton(
                            style: ButtonStyleType.secondary,
                            icon: Icon(Icons.close, size: 20),
                            iconRight: true,
                            onTap: () => Navigator.pop(context)
                        )

                    )
                ]
            )
        );
    }
}

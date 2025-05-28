import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import "package:flutter/material.dart";
import 'package:assignment1/box_ui.dart';


/// EXAMPLE USAGES
class ExampleView extends StatelessWidget
{
    const ExampleView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          children: [
            ///Typography
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxText.Headline1("Headline1"),
                BoxText.Headline2("Headline2"),
                BoxText.Headline3("Headline3"),
                BoxText.Headline4("Headline4"),
                BoxText.Title("Title"),
                BoxText.Subtitle("Subtitle"),
                // Change color
                BoxText.Body("Body", color: Colors.red),
                BoxText.Overline("Overline"),
                BoxText.Button("Button Text"),
              ],
            ),

            const SizedBox(height: 32),

            ///Button
            Column(
              children: [
                BoxButton(
                  title: "TextIcon",
                  icon: Icon(Icons.send, size: 20, color: AppColors.black100),
                  iconRight: true,
                  style: ButtonStyleType.secondary,
                  onTap: () => print("Button clicked"),
                ),
                const SizedBox(height: 16),

                BoxButton(
                  title: "TextIcon",
                  icon: Icon(Icons.send, size: 20, color: AppColors.black100),
                  iconRight: false,
                  style: ButtonStyleType.secondary,
                  onTap: () => print("Button clicked"),
                ),
                const SizedBox(height: 16),

                BoxButton(
                  title: "TextIcon",
                  icon: Icon(Icons.send, size: 20, color: AppColors.black100),
                  iconRight: true,
                  onTap: () => print("Button clicked"),
                ),
                const SizedBox(height: 16),

                BoxButton(
                  icon: Icon(Icons.send, size: 20, color: AppColors.black100),
                  onTap: () => print("Button clicked"),
                ),
                const SizedBox(height: 16),

                BoxButton(
                  title: "Text",
                  style: ButtonStyleType.secondary,
                  onTap: () => print("Button clicked"),
                ),
              ],
            ),
          ],
        ),
      );
    }

}

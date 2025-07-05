import 'package:assignment1/src/shared/app_effects.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:assignment1/box_ui.dart';
import 'package:assignment1/src/widgets/box_button.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:assignment1/src/shared/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoxText.Headline4(AppLocalizations.of(context)!.helpSupport),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BoxText.Title(AppLocalizations.of(context)!.frequentlyAsked),
          SizedBox(height:10),
          FAQItem(
            question: AppLocalizations.of(context)!.resetPasswordQ,
            answer: AppLocalizations.of(context)!.resetPasswordA,
          ),
          SizedBox(height: 5),
          FAQItem(
            question: AppLocalizations.of(context)!.changeLanguageQ,
            answer: AppLocalizations.of(context)!.changeLanguageA,
          ),
          SizedBox(height: 5),
          FAQItem(
            question: AppLocalizations.of(context)!.earnMedalsQ,
            answer: AppLocalizations.of(context)!.earnMedalsA,
          ),
          SizedBox(height: 5),
          FAQItem(
            question: AppLocalizations.of(context)!.getPetsQ,
            answer: AppLocalizations.of(context)!.getPetsA,
          ),
          SizedBox(height: 5),
          FAQItem(
            question: AppLocalizations.of(context)!.changePhotoQ,
            answer: AppLocalizations.of(context)!.changePhotoA,
          ),


          SizedBox(height: 30),
          BoxText.Title(AppLocalizations.of(context)!.contactSupport),
          SizedBox(height: 20),
          BoxButton(
            title: AppLocalizations.of(context)!.emailUs,
            icon: Icon(Icons.email, color: Colors.white),
            style: ButtonStyleType.primary,
            onTap: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'support@example.com',
                queryParameters: {
                  'subject': 'App Support Request'
                },
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Could not open email app."))
                );
              }
            },
          ),
          SizedBox(height: 15),

          /// CALL BUTTON
          BoxButton(
            title: AppLocalizations.of(context)!.callUs,
            icon: Icon(Icons.phone, color: Colors.white),
            style: ButtonStyleType.primary,
            onTap: () async {
              final Uri phoneUri = Uri(scheme: 'tel', path: '+1234567890');
              if (await canLaunchUrl(phoneUri)) {
                await launchUrl(phoneUri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Could not place a call.")),
                );
              }
            },
          ),

        ],
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;
  const FAQItem({required this.question, required this.answer, super.key});

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondarySolid20,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.black100, width: 2),
        boxShadow: [
         AppEffectStyles.cardShadowEffect
        ],
      ),
      child: ExpansionTile(
        title: Text(widget.question, style: SubtitleStyle),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer, style: BodyStyle),
          ),
        ],
        onExpansionChanged: (val) => setState(() => expanded = val),
      ),
    );

  }
}

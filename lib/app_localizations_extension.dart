import 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension AppLocalizationsExtension on AppLocalizations {
  String getString(String key) {
    const Map<String, String> _keyMap = {
      'petBobaDesc': 'petBobaDesc',
      'petDjDesc': 'petDjDesc',
      'petEbiDesc': 'petEbiDesc',
      'petGuiDesc': 'petGuiDesc',
      'petMsBeckyDesc': 'petMsBeckyDesc',
      'petNewHumanDesc': 'petNewHumanDesc',
      'petRorrrrrrDesc': 'petRorrrrrrDesc',
      'petBananaDesc': 'petBananaDesc',
      'petNaruhodoDesc': 'petNaruhodoDesc',
      'petGodfatherDesc': 'petGodfatherDesc',
    };

    switch (key) {
      case 'petBobaDesc':
        return petBobaDesc;
      case 'petDjDesc':
        return petDjDesc;
      case 'petEbiDesc':
        return petEbiDesc;
      case 'petGuiDesc':
        return petGuiDesc;
      case 'petMsBeckyDesc':
        return petMsBeckyDesc;
      case 'petNewHumanDesc':
        return petNewHumanDesc;
      case 'petRorrrrrrDesc':
        return petRorrrrrrDesc;
      case 'petBananaDesc':
        return petBananaDesc;
      case 'petNaruhodoDesc':
        return petNaruhodoDesc;
      case 'petGodfatherDesc':
        return petGodfatherDesc;
      default:
        return '[$key]';
    }
  }
}

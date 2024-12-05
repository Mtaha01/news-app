import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class StringsManager {

  static String drawerTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appTitle;
  }

  static String categories(BuildContext context) {
    return AppLocalizations.of(context)!.categories;
  }

  static String settings(BuildContext context) {
    return AppLocalizations.of(context)!.settings;
  }

  static String sports(BuildContext context) {
    return AppLocalizations.of(context)!.sports;
  }

  static String general(BuildContext context) {
    return AppLocalizations.of(context)!.general;
  }

  static String health(BuildContext context) {
    return AppLocalizations.of(context)!.health;
  }

  static String business(BuildContext context) {
    return AppLocalizations.of(context)!.business;
  }

  static String entertainment(BuildContext context) {
    return AppLocalizations.of(context)!.entertainment;
  }

  static String science(BuildContext context) {
    return AppLocalizations.of(context)!.science;
  }

  static String tech(BuildContext context) {
    return AppLocalizations.of(context)!.technology;
  }

  static String pickCategoryText(BuildContext context) {
    return AppLocalizations.of(context)!.pickCategoryText;
  }
}

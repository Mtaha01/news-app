import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../provider/setting_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
   TextEditingController languageController=new TextEditingController();
    var myProvider=Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 4,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 8,right: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              border: Border.all(
                width: 1,
                color: ColorsManager.green
              ),
            ),
            child: DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'en', label: 'English'),
                DropdownMenuEntry(value: 'ar', label: 'العربية'),
              ],
              initialSelection:myProvider.currentLang,
              width: double.infinity,
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
              ),
              controller: languageController,
              onSelected: (value){
                  myProvider.changeAppLang(value!);
              } ,
            ),
          ),
        ],
      ),
    );
  }
}
